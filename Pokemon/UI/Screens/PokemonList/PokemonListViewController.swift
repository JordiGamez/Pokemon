
import UIKit

//sourcery: AutoMockable
protocol PokemonListView: Spinnerable {
    func showPokemonList(model: PokemonListModel)
    func showError(region: PokemonRegion)
}

class PokemonListViewController: UIViewController {
    
    @IBOutlet private weak var contentStackView: UIStackView!
    @IBOutlet private weak var regionSelectorView: SelectorView!
    @IBOutlet private weak var regionNameLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var errorView: ErrorView!
    
    private let cellIdentifier: String = "PokemonListCell"
    
    var presenter: PokemonListPresenter?
    var model: PokemonListModel?
    
    private var pokemonList: [Pokemon] { model?.pokemon ?? [] }
    private var region: PokemonRegion = .kanto
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        loadData()
    }
}

private extension PokemonListViewController {
    
    func configureView() {
        title = "list.title".localized
        view.backgroundColor = .darkGray
        contentStackView.clipsToBounds = true
        configureErrorView()
        configureRegionNameLabel()
        configureNavigationView()
        configureSelectorView()
        configureTableView()
    }
    
    func configureNavigationView() {
        addPokemonLogo()
        addBarButton(position: .right,
                     imageName: "selector_icon",
                     target: self,
                     action: #selector(userDidTapSelectorIcon))
        addBarButton(position: .left,
                     imageName: "heart_icon",
                     target: self,
                     action: #selector(userDidTapFavoriteIcon))
    }
    
    func configureErrorView() {
        errorView.hide()
        errorView.delegate = self
    }
    
    func configureRegionNameLabel() {
        regionNameLabel.text = PokemonRegion.allCases[0].rawValue.capitalizingFirstLetter()
        regionNameLabel.font = .systemFont(ofSize: 28, weight: .bold)
    }
    
    func configureSelectorView() {
        regionSelectorView.backgroundColor = .clear
        regionSelectorView.delegate = self
        regionSelectorView.configure(options: PokemonRegion.allCases.map({ $0.rawValue }))
        regionSelectorView.select(0)
        regionSelectorView.isHidden = true
    }
    
    func configureTableView() {
        tableView.backgroundColor = .clear
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func loadData() {
        if let model = model {
            showPokemonList(model: model)
        } else {
            presenter?.loadData(region: region)
        }
    }
    
    @objc func userDidTapSelectorIcon() {
        UIView.animate(withDuration: 0.3, animations: {
            self.regionSelectorView.alpha = !self.regionSelectorView.isHidden ? 0 : 1
            self.regionSelectorView.isHidden = !self.regionSelectorView.isHidden
        })
    }
    
    @objc func userDidTapFavoriteIcon() {
        presenter?.navigateToFavorites()
    }
}

// MARK: - PokemonListView

extension PokemonListViewController: PokemonListView {
    
    func showPokemonList(model: PokemonListModel) {
        self.model = model
        
        errorView.hide()
        regionNameLabel.isHidden = false
        
        tableView.reloadData()
        tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        tableView.isHidden = false
    }
    
    func showError(region: PokemonRegion) {
        self.region = region
        
        regionSelectorView.isHidden = true
        regionNameLabel.isHidden = true
        tableView.isHidden = true
        
        errorView.show()
    }
}

// MARK: - Spinner

extension Spinnerable where Self: PokemonListViewController {
    
    var wrapperView: UIView {
        view
    }
}

// MARK: - TableView

extension PokemonListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pokemonList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PokemonListCell else {
            return UITableViewCell()
        }
        
        cell.configure(pokemon: pokemonList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showDetail(pokemon: pokemonList[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        UIView.animate(withDuration: 0.4) {
            cell.transform = CGAffineTransform.identity
        }
    }
}

// MARK: - SelectorView

extension PokemonListViewController: SelectorViewDelegate {
    
    func userDidSelectItem(row: Int) {
        region = PokemonRegion.allCases[row]
        presenter?.loadData(region: region)
        regionNameLabel.text = PokemonRegion.allCases[row].rawValue.capitalizingFirstLetter()
    }
}

// MARK: - ErrorView

extension PokemonListViewController: ErrorViewDelegate {
    
    func retry() {
        presenter?.loadData(region: region)
    }
}
