
import UIKit
import Kingfisher

class PokemonListCell: UITableViewCell {
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var pokeballImageView: UIImageView!
    @IBOutlet private weak var pokemonImageView: UIImageView!
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    func configure(pokemon: Pokemon) {
        let url = URL(string: pokemon.imageUrl)
        pokemonImageView.kf.setImage(with: url)
        
        numberLabel.text = "# \(pokemon.number)"
        
        nameLabel.text = pokemon.name.uppercased()
    }
}

private extension PokemonListCell {
    
    func configureView() {
        selectionStyle = .none
        backgroundColor = .clear
        clipsToBounds = true
        
        containerView.backgroundColor = .lightGray
        containerView.layer.cornerRadius = 8
        containerView.clipsToBounds = true
        
        pokeballImageView.image = UIImage(named: "pokeball")?.withRenderingMode(.alwaysTemplate)
        pokeballImageView.tintColor = .white
        pokeballImageView.alpha = 0.25
        
        numberLabel.font = .systemFont(ofSize: 22, weight: .heavy)
        
        nameLabel.font = .systemFont(ofSize: 22, weight: .bold)
        nameLabel.textAlignment = .center
    }
}
