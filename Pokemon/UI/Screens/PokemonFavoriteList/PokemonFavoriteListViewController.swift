
import UIKit

//sourcery: AutoMockable
protocol PokemonFavoriteListView: AnyObject {
    func showPokemonList(pokemon: [PokemonDetailModel])
    func reloadFavoriteList()
}

class PokemonFavoriteListViewController: UIViewController {
    
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private let cellIdentifier: String = "PokemonFavoriteViewCell"
    
    var presenter: PokemonFavoriteListPresenter?
    var pokemonList: [PokemonDetailModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        pokemonList = nil
    }
}

private extension PokemonFavoriteListViewController {
    
    func configureView() {
        title = "favorite.title".localized
        view.backgroundColor = .darkGray
        contentView.backgroundColor = .clear
        configureNavigationView()
        configureCollectionView()
    }
    
    func configureNavigationView() {
        addBarButton(position: .left,
                     imageName: "trash",
                     target: self,
                     action: #selector(userDidTapTrashIcon))
        addBarButton(position: .right,
                     imageName: "close_icon",
                     target: self,
                     action: #selector(userDidTapCloseIcon))
    }
    
    func configureCollectionView() {
        collectionView.backgroundColor = .clear
        collectionView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func loadData() {
        if let pokemonList = pokemonList {
            showPokemonList(pokemon: pokemonList)
        } else {
            presenter?.loadData()
        }
    }
    
    @objc func userDidTapTrashIcon() {
        presenter?.emptyFavoriteList()
    }
    
    @objc func userDidTapCloseIcon() {
        presenter?.close()
    }
}

// MARK: - PokemonFavoriteListView

extension PokemonFavoriteListViewController: PokemonFavoriteListView {
    
    func showPokemonList(pokemon: [PokemonDetailModel]) {
        pokemonList = pokemon
        collectionView.reloadData()
    }
    
    func reloadFavoriteList() {
        pokemonList = []
        collectionView.reloadData()
    }
}

// MARK: - UICollectionView

extension PokemonFavoriteListViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let pokemonList = pokemonList else { return 0 }
        if pokemonList.count == 0 {
            collectionView.setEmptyMessage("favorite.empty".localized)
        } else {
            collectionView.restore()
        }
        
        return pokemonList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let pokemonList = pokemonList,
              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? PokemonFavoriteViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(pokemonDetail: pokemonList[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let pokemonList = pokemonList else { return }
        presenter?.showPokemonDetail(pokemonDetail: pokemonList[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 16
        let collectionViewSize = collectionView.frame.size.width - padding
        let width = collectionViewSize/2
        
        return CGSize(width: width, height: width + 40)
    }
}
