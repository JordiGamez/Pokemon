
import UIKit

class Spinner: UIView {
    
    private static let containerWidth: CGFloat = 100
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    init() {
        super.init(frame: UIScreen.main.bounds)
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
    
    private func configureView() {
        backgroundColor = .clear
        showSpinner()
    }
    
    private func showSpinner() {
        addBackgroundView()
        
        let containerView = UIView()
        containerView.frame = CGRect(x: frame.width/2 - Self.containerWidth/2, y: frame.height/2 - Self.containerWidth/2, width: Self.containerWidth, height: Self.containerWidth)
        containerView.backgroundColor = Colors.spinnerContainerColor?.withAlphaComponent(0.5)
        containerView.layer.cornerRadius = 8
        
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.frame = CGRect(x: containerView.frame.width/2 - 25, y: containerView.frame.height/2 - 25, width: 50, height: 50)
        spinner.color = .black
        spinner.startAnimating()
        
        containerView.addSubview(spinner)
        
        addSubview(containerView)
    }
    
    private func addBackgroundView() {
        let backgroundImageView = UIView(frame: frame)
        backgroundImageView.backgroundColor = .black.withAlphaComponent(0.65)
        addSubview(backgroundImageView)
        
        backgroundImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}
