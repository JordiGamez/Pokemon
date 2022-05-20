
import UIKit

class SelectorViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var optionLabel: UILabel!
    
    override var isSelected: Bool {
        didSet {
            isSelected ? select() : deselect()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    private func configureView() {
        backgroundColor = .clear
        containerView.backgroundColor = Colors.lightGray
        containerView.layer.cornerRadius = 4
        optionLabel.font = .systemFont(ofSize: 14, weight: .medium)
        optionLabel.textColor = .black
    }
    
    func configure(optionName: String) {
        optionLabel.text = optionName
    }
    
    func select() {
        containerView.backgroundColor = Colors.blue
        optionLabel.textColor = .white
    }
    
    func deselect() {
        containerView.backgroundColor = Colors.lightGray
        optionLabel.textColor = .black
    }
}
