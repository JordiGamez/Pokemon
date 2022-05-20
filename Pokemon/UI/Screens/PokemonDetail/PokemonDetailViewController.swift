
import UIKit
import Kingfisher

//sourcery: AutoMockable
protocol PokemonDetailView: Spinnerable {
    func showEvolutionChain(model: [PokemonDetailModel])
    func showAddedToFavorite(pokemonDetail: PokemonDetailModel)
    func showRemovedFromFavorite(pokemonDetail: PokemonDetailModel)
    func showError()
}

class PokemonDetailViewController: UIViewController {
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var pageControl: UIPageControl!
    @IBOutlet private weak var errorView: ErrorView!
    
    var presenter: PokemonDetailPresenter?
    var pokemon: Pokemon?
    var evolutionChainModel: [PokemonDetailModel]?
    
    private var slides: [PokemonCardView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        loadData()
    }
}

private extension PokemonDetailViewController {
    
    func configureView() {
        configureNavigationView()
        view.backgroundColor = .darkGray
        containerView.backgroundColor = .clear
        configureErrorView()
        configureScrollView()
        configurePageControl()
    }
    
    func configureNavigationView() {
        navigationController?.navigationBar.tintColor = Colors.navigationBarButtonColor
    }
    
    func configureErrorView() {
        errorView.hide()
        errorView.delegate = self
    }
    
    func configureScrollView() {
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
    }
    
    func configurePageControl() {
        pageControl.isHidden = true
        pageControl.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        pageControl.layer.cornerRadius = 8
    }
    
    func loadData() {
        if let evolutionChainModel = evolutionChainModel {
            showEvolutionChain(model: evolutionChainModel)
        } else {
            presenter?.loadData()
        }
    }
    
    func createSlides(model: [PokemonDetailModel]) -> [PokemonCardView] {
        model.map {
            let cardView = PokemonCardView(frame: CGRect(x: 0,
                                                         y: 0,
                                                         width: containerView.frame.size.width,
                                                         height: containerView.frame.size.height))
            cardView.delegate = self
            cardView.configure(model: $0)
            
            return cardView
        }
    }
    
    func configurePageControl(with slides: [PokemonCardView]) {
        pageControl.isHidden = slides.count <= 1
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
    }
    
    func configureScrollView(with slides: [PokemonCardView]) {
        let screen = UIScreen.main.bounds
        
        scrollView.frame = CGRect(x: 0,
                                  y: 0,
                                  width: screen.width,
                                  height: view.frame.height)
        scrollView.contentSize = CGSize(width: screen.width * CGFloat(slides.count),
                                        height: view.frame.height)
        
        for index in 0 ..< slides.count {
            slides[index].frame = CGRect(x: screen.width * CGFloat(index) + 4,
                                         y: 0,
                                         width: scrollView.frame.width - 8,
                                         height: containerView.frame.height)
            scrollView.addSubview(slides[index])
        }
    }
    
    func moveScroll(model: [PokemonDetailModel]) {
        guard let index = model.firstIndex(where: { "\($0.number)" == self.pokemon?.number }) else { return }
        scrollView.scrollTo(page: index)
    }
    
    func addShareButton() {
        addBarButton(position: .right,
                     imageName: "share",
                     target: self,
                     action: #selector(userDidTapShareIcon))
    }
    
    @objc func userDidTapShareIcon() {
        defer { UIGraphicsEndImageContext() }
        
        let bounds = UIScreen.main.bounds
        UIGraphicsBeginImageContextWithOptions(bounds.size, true, 0.0)
        view.drawHierarchy(in: bounds, afterScreenUpdates: false)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return }
        
        presenter?.share(image: image)
    }
}

// MARK: - PokemonDetailView

extension PokemonDetailViewController: PokemonDetailView {
    
    func showEvolutionChain(model: [PokemonDetailModel]) {
        self.evolutionChainModel = model
        slides = createSlides(model: model)
        configurePageControl(with: slides)
        configureScrollView(with: slides)
        moveScroll(model: model)
        addShareButton()
    }
    
    func showAddedToFavorite(pokemonDetail: PokemonDetailModel) {
        guard let cardView = slides.first(where: { $0.model?.number == pokemonDetail.number }) else { return }
        cardView.showIsFavorite()
    }
    
    func showRemovedFromFavorite(pokemonDetail: PokemonDetailModel) {
        guard let cardView = slides.first(where: { $0.model?.number == pokemonDetail.number }) else { return }
        cardView.showIsNotFavorite()
    }
    
    func showError() {
        scrollView.isHidden = true
        errorView.show()
    }
}

// MARK: - Spinner

extension Spinnerable where Self: PokemonDetailViewController {
    
    var wrapperView: UIView {
        view
    }
}

// MARK: - ScrollView

extension PokemonDetailViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        avoidVerticalScroll(scrollView)
        updatePageControl(scrollView)
    }
    
    private func avoidVerticalScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 || scrollView.contentOffset.y < 0 {
            scrollView.contentOffset.y = 0
        }
    }
    
    private func updatePageControl(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
}

// MARK: - PokemonCard

extension PokemonDetailViewController: PokemonCardViewDelegate {
    
    func loadFavoriteStatus(pokemonDetail: PokemonDetailModel) {
        presenter?.loadFavoriteStatus(pokemonDetail: pokemonDetail)
    }
    
    func performFavoriteAction(pokemonDetail: PokemonDetailModel) {
        presenter?.performFavoriteAction(pokemonDetail: pokemonDetail)
    }
}

// MARK: - ErrorView

extension PokemonDetailViewController: ErrorViewDelegate {
    
    func retry() {
        errorView.hide()
        scrollView.isHidden = false
        presenter?.loadData()
    }
}
