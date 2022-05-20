
import UIKit

protocol NibView {
    static var nibName: String { get }
}

extension NibView where Self: UIView {
    
    static var nibName: String {
        String(describing: Self.self)
    }
    
    /**
     - Abstract:
        This method called to `inflateView(from:locatedAt:)` with:
        * nibName -> `Self.nibName`
        * bundle -> `Bundle.bmi2Core`
    */
    func inflateView() {
        let nib = UINib(nibName: Self.nibName, bundle: .main)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            return
        }
        
        addSubview(view)
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}

extension NibView {
    
    static func initializeFromNib(bundle: Bundle = Bundle.main) -> Self {
        guard let nibViews = bundle.loadNibNamed(nibName, owner: self, options: nil) else {
            fatalError("\(nibName) not found in bundle \(bundle)")
        }
        guard let nibView = nibViews.first as? Self else {
            fatalError("Error loading \(self) from nib")
        }
        
        return nibView
    }
}
