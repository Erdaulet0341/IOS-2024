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


class ModernMusicProgress: UIProgressView {
    private let gradientLayer = CAGradientLayer()
    private let progressLayer = CALayer()
    private var observation: NSKeyValueObservation?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        layer.cornerRadius = 4
        clipsToBounds = true
        
        trackTintColor = UIColor.systemGray.withAlphaComponent(0.2)
        progressTintColor = .clear
        
        gradientLayer.colors = [
            UIColor.systemBlue.cgColor,
            UIColor.systemPurple.cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        
        progressLayer.addSublayer(gradientLayer)
        layer.addSublayer(progressLayer)
        
        observation = observe(\.progress, options: [.new]) { [weak self] _, _ in
            self?.updateProgress(animated: true)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateProgress(animated: false)
        gradientLayer.frame = progressLayer.bounds
    }
    
    private func updateProgress(animated: Bool) {
        let progressWidth = bounds.width * CGFloat(progress)
        
        if animated {
            CATransaction.begin()
            CATransaction.setAnimationDuration(0.1)
        }
        
        progressLayer.frame = CGRect(x: 0, y: 0, width: progressWidth, height: bounds.height)
        
        if animated {
            CATransaction.commit()
        }
    }
}
