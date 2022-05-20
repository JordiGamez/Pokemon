
import UIKit

extension UICollectionView {
    
    func setEmptyMessage(_ message: String) {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 0
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ash-ketchum")
        imageView.contentMode = .scaleAspectFit
        
        stackView.addArrangedSubview(imageView)
        
        let messageLabel = UILabel()
        messageLabel.text = message
        messageLabel.textColor = Colors.navigationBarButtonColor
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.sizeToFit()

        stackView.addArrangedSubview(messageLabel)
        
        backgroundView = stackView
    }
    
    func restore() {
        backgroundView = nil
    }
}
