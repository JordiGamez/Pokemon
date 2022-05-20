
import UIKit

protocol ErrorViewDelegate: AnyObject {
    func retry()
}

class ErrorView: UIView, NibView {
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var titleContainerView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var messageContainerView: UIView!
    @IBOutlet private weak var messageLabel: UILabel!
    @IBOutlet private weak var retryButton: UIButton!
    
    weak var delegate: ErrorViewDelegate?
    
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
    
    func hide() {
        isHidden = true
    }
    
    func show() {
        isHidden = false
    }
}

private extension ErrorView {
    
    func configureView() {
        backgroundColor = .clear
        
        containerView.backgroundColor = .clear
        
        iconImageView.image = UIImage(named: "snorlax")
        
        titleContainerView.backgroundColor = .clear
        messageContainerView.backgroundColor = .clear
        
        configureTitleLabel()
        configureMessageLabel()
        configureRetryButton()
    }
    
    func configureTitleLabel() {
        titleLabel.text = "error.title".localized
        titleLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 0
    }
    
    func configureMessageLabel() {
        messageLabel.text = "error.message".localized
        messageLabel.font = .systemFont(ofSize: 14, weight: .medium)
        messageLabel.textAlignment = .center
        messageLabel.textColor = .white
        messageLabel.numberOfLines = 0
    }
    
    func configureRetryButton() {
        retryButton.backgroundColor = Colors.electric
        retryButton.setTitle("error.button".localized.uppercased(), for: .normal)
        retryButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        retryButton.tintColor = .darkGray
        retryButton.layer.cornerRadius = 4
        retryButton.addTarget(self, action: #selector(userDidTapRetryButton), for: .touchUpInside)
    }
    
    @objc func userDidTapRetryButton() {
        delegate?.retry()
    }
}
