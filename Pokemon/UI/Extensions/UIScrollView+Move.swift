
import UIKit

extension UIScrollView {
    
    func scrollTo(page: Int = 0, animated: Bool = false) {
        frame.origin.x = frame.size.width * CGFloat(page)
        scrollRectToVisible(frame, animated: animated)
    }
}
