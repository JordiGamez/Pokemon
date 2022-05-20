
import UIKit

extension UIViewController {
    
    enum Direction {
        case left
        case right
    }
    
    func addPokemonLogo() {
        navigationItem.titleView = buildPokemonImageView()
    }
    
    func addBarButton(position: Direction, imageName: String, target: Any?, action: Selector) {
        let barButton = buildButton(imageName: imageName, target: target, action: action)
        
        switch position {
        case .left:
            if navigationItem.leftBarButtonItem == nil {
                navigationItem.leftBarButtonItems = [barButton]
            } else {
                navigationItem.leftBarButtonItems?.append(barButton)
            }
        case .right:
            if navigationItem.rightBarButtonItem == nil {
                navigationItem.rightBarButtonItems = [barButton]
            } else {
                navigationItem.rightBarButtonItems?.append(barButton)
            }
        }
    }
}

private extension UIViewController {
    
    func buildPokemonImageView() -> UIImageView {
        let logo = UIImage(named: "pokemon_logo")
        let imageView = UIImageView(image: logo)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let aspectRatio: CGFloat = 11.0 / 4.0
        imageView.heightAnchor.constraint(equalToConstant: 36).isActive = true
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor,
                                         multiplier: aspectRatio).isActive = true
        
        return imageView
    }
    
    func buildButton(imageName: String, target: Any?, action: Selector) -> UIBarButtonItem {
        let containerView = UIControl(frame: CGRect.init(x: 0, y: 0, width: 26, height: 26))
        containerView.addTarget(target, action: action, for: .touchUpInside)
        
        let icon = UIImageView(frame: CGRect.init(x: 0, y: 0, width: 26, height: 26))
        icon.image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
        icon.tintColor = Colors.navigationBarButtonColor
        
        containerView.addSubview(icon)
        
        return UIBarButtonItem(customView: containerView)
    }
}
