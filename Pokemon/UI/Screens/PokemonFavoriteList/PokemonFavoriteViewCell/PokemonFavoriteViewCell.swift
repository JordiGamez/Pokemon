
import UIKit

class PokemonFavoriteViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var pokeballImageView: UIImageView!
    @IBOutlet private weak var pokemonImageView: UIImageView!
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    func configure(pokemonDetail: PokemonDetailModel) {
        containerView.backgroundColor = pokemonDetail.types.first?.cardColor().withAlphaComponent(0.75)
        
        let url = URL(string: pokemonDetail.imageUrl)
        pokemonImageView.kf.setImage(with: url)
        
        numberLabel.text = "# \(pokemonDetail.number)"
        
        nameLabel.text = pokemonDetail.name.uppercased()
    }
}

private extension PokemonFavoriteViewCell {
    
    func configureView() {
        backgroundColor = .clear
        clipsToBounds = true
        
        containerView.layer.cornerRadius = 8
        containerView.clipsToBounds = true
        
        pokeballImageView.image = UIImage(named: "pokeball")?.withRenderingMode(.alwaysTemplate)
        pokeballImageView.tintColor = .white
        pokeballImageView.alpha = 0.25
        
        numberLabel.font = .systemFont(ofSize: 22, weight: .heavy)
        
        nameLabel.font = .systemFont(ofSize: 16, weight: .bold)
        nameLabel.textAlignment = .center
    }
}
