
import UIKit

protocol SelectorViewDelegate: AnyObject {
    func userDidSelectItem(row: Int)
}

class SelectorView: UIView, NibView {
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private var options: [String] = []
    private var selectedRow: Int = 0
    
    weak var delegate: SelectorViewDelegate?
    
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
    
    private func configureView() {
        containerView.backgroundColor = .clear
        
        collectionView.backgroundColor = .clear
        collectionView.register(UINib(nibName: "SelectorViewCell", bundle: nil), forCellWithReuseIdentifier: "SelectorViewCell")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func configure(options: [String]) {
        self.options = options
        collectionView.reloadData()
    }
    
    func select(_ row: Int) {
        selectedRow = row
        collectionView.selectItem(at: IndexPath(row: row, section: 0), animated: true, scrollPosition: .top)
    }
}

extension SelectorView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        options.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectorViewCell", for: indexPath) as? SelectorViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(optionName: options[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard selectedRow != indexPath.row else { return }
        selectedRow = indexPath.row
        delegate?.userDidSelectItem(row: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 70, height: collectionView.frame.height)
    }
}
