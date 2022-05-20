
import UIKit

protocol PokemonCardViewDelegate: AnyObject {
    func loadFavoriteStatus(pokemonDetail: PokemonDetailModel)
    func performFavoriteAction(pokemonDetail: PokemonDetailModel)
}

class PokemonCardView: UIView, NibView {
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var pokeballImageView: UIImageView!
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var favoriteButton: UIButton!
    @IBOutlet private weak var pokemonImageView: UIImageView!
    @IBOutlet private weak var overlayView: UIView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var firstTypeContainerView: UIView!
    @IBOutlet private weak var firstTypeImageView: UIImageView!
    @IBOutlet private weak var firstTypeLabel: UILabel!
    @IBOutlet private weak var secondTypeContainerView: UIView!
    @IBOutlet private weak var secondTypeImageView: UIImageView!
    @IBOutlet private weak var secondTypeLabel: UILabel!
    @IBOutlet private weak var statsView: PokemonStatsView!
    
    weak var delegate: PokemonCardViewDelegate?
    
    var model: PokemonDetailModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        inflateView()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        inflateView()
        configureView()
    }
    
    func configure(model: PokemonDetailModel) {
        self.model = model
        
        numberLabel.text = "# \(model.number)"
        
        favoriteButton.setImage(UIImage(named: "heart_icon")?.withRenderingMode(.alwaysOriginal), for: .normal)
        favoriteButton.addTarget(self, action: #selector(userDidTapFavoriteIcon), for: .touchUpInside)
        
        let url = URL(string: model.imageUrl)
        pokemonImageView.kf.setImage(with: url)
        
        containerView.backgroundColor = model.types.first?.cardColor().withAlphaComponent(0.75)
        
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        
        nameLabel.text = "\(model.name.uppercased())"
        
        showPokemonTypeBadges(types: model.types)
        
        statsView.configure(stats: model.stats)
        
        loadFavoriteStatus()
    }
    
    func showIsFavorite() {
        favoriteButton.setImage(UIImage(named: "heart_icon_favorite")?.withRenderingMode(.alwaysOriginal), for: .normal)
    }
    
    func showIsNotFavorite() {
        favoriteButton.setImage(UIImage(named: "heart_icon")?.withRenderingMode(.alwaysOriginal), for: .normal)
    }
}

private extension PokemonCardView {
    
    func configureView() {
        backgroundColor = .clear
        
        containerView.layer.cornerRadius = 8
        containerView.clipsToBounds = true
        
        numberLabel.font = .systemFont(ofSize: 28, weight: .heavy)
        numberLabel.textColor = .white
        numberLabel.text = ""
        
        nameLabel.font = .systemFont(ofSize: 28, weight: .bold)
        nameLabel.textColor = .white
        nameLabel.text = ""
        
        firstTypeLabel.textColor = .white
        firstTypeLabel.font = .systemFont(ofSize: 10, weight: .semibold)
        firstTypeLabel.text = ""
        
        secondTypeLabel.textColor = .white
        secondTypeLabel.font = .systemFont(ofSize: 10, weight: .semibold)
        secondTypeLabel.text = ""
        
        pokeballImageView.image = UIImage(named: "pokeball")?.withRenderingMode(.alwaysTemplate)
        pokeballImageView.tintColor = .white
        pokeballImageView.alpha = 0.25
    }
    
    func showPokemonTypeBadges(types: [PokemonType]) {
        // First badge
        let firstType = types[0]
        firstTypeContainerView.backgroundColor = firstType.badgeColor()
        firstTypeContainerView.layer.cornerRadius = 4
        firstTypeImageView.image = UIImage(named: firstType.name.rawValue)
        firstTypeLabel.text = firstType.name.rawValue.uppercased()
        
        // Second badge
        if types.count > 1 {
            let secondType = types[1]
            secondTypeContainerView.backgroundColor = secondType.badgeColor()
            secondTypeContainerView.layer.cornerRadius = 4
            secondTypeImageView.image = UIImage(named: secondType.name.rawValue)
            secondTypeLabel.text = secondType.name.rawValue.uppercased()
            secondTypeContainerView.isHidden = false
        } else {
            secondTypeContainerView.isHidden = true
        }
    }
    
    func loadFavoriteStatus() {
        guard let model = model else { return }
        delegate?.loadFavoriteStatus(pokemonDetail: model)
    }
    
    @objc func userDidTapFavoriteIcon() {
        guard let model = model else { return }
        delegate?.performFavoriteAction(pokemonDetail: model)
    }
}
