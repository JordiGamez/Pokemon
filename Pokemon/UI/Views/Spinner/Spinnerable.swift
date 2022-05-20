
import UIKit

protocol Spinnerable: AnyObject {
    var wrapperView: UIView { get }
    
    func showSpinner()
    func hideSpinner()
}

extension Spinnerable {
    
    func showSpinner() {
        DispatchQueue.main.async {
            guard self.retrieveSpinner() == nil else { return }
            self.wrapperView.addSubview(Spinner())
        }
    }
    
    func hideSpinner() {
        DispatchQueue.main.async {
            self.removeSpinner()
        }
    }
}

private extension Spinnerable {
    
    func retrieveSpinner() -> Spinner? {
        for subview in wrapperView.subviews {
            if let spinner = subview as? Spinner {
                return spinner
            }
        }
        return nil
    }
    
    func removeSpinner() {
        guard let spinner = retrieveSpinner() else { return }
        UIView.animate(withDuration: 0.3, animations: {
            spinner.alpha = 0.0
        })
        spinner.removeFromSuperview()
    }
}
