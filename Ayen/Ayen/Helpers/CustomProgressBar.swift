import UIKit

class CustomProgressBar: UIView {
    private let progressLayer = CALayer()
    private let backgroundLayer = CALayer()
    
    var progressColor: UIColor = .systemBlue {
        didSet {
            progressLayer.backgroundColor = progressColor.cgColor
        }
    }
    
    var trackColor: UIColor = .lightGray {
        didSet {
            backgroundLayer.backgroundColor = trackColor.cgColor
        }
    }
    
    var cornerRadius: CGFloat = 10 {
        didSet {
            layer.cornerRadius = cornerRadius
            backgroundLayer.cornerRadius = cornerRadius
            progressLayer.cornerRadius = cornerRadius
        }
    }
    
    private var _progress: CGFloat = 0
    
    /// Progress value (0.0 to 1.0)
    var progress: CGFloat {
        get {
            return _progress
        }
        set {
            setProgress(newValue, animated: false)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayers()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayers()
    }
    
    private func setupLayers() {
        backgroundLayer.backgroundColor = trackColor.cgColor
        backgroundLayer.frame = bounds
        backgroundLayer.cornerRadius = cornerRadius
        layer.addSublayer(backgroundLayer)
        
        progressLayer.backgroundColor = progressColor.cgColor
        progressLayer.frame = CGRect(x: 0, y: 0, width: 0, height: bounds.height)
        progressLayer.cornerRadius = cornerRadius
        layer.addSublayer(progressLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundLayer.frame = bounds
        updateProgress(animated: false)
    }
    
    func setProgress(_ progress: CGFloat, animated: Bool) {
        _progress = min(max(progress, 0), 1) // Clamp progress between 0 and 1
        updateProgress(animated: animated)
    }
    
    private func updateProgress(animated: Bool) {
        let targetWidth = bounds.width * _progress
        let newFrame = CGRect(x: 0, y: 0, width: targetWidth, height: bounds.height)
        
        if animated {
            UIView.animate(withDuration: 0.25) {
                self.progressLayer.frame = newFrame
            }
        } else {
            progressLayer.frame = newFrame
        }
    }
}
