import UIKit

func animateView(_ view: UIView) {
    UIView.animate(withDuration: 0.1, animations: {
        view.transform = CGAffineTransform(scaleX: 0.9, y: 0.9) // Shrink
    }) { _ in
        UIView.animate(withDuration: 0.1, animations: {
            view.transform = CGAffineTransform.identity // Back to normal size
        })
    }
}
