
import UIKit

class PokemonStatsView: UIView, NibView {
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var statsStackView: UIStackView!
    
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
    
    func configure(stats: [PokemonStat]) {
        stats.forEach { stat in
            let containerStackView = UIStackView()
            containerStackView.axis = .horizontal
            containerStackView.distribution = .fillEqually
            
            let statNameLabel = createLabel(with: "\(stat.nameFormated.capitalizingFirstLetter())")
            containerStackView.addArrangedSubview(statNameLabel)
            
            let statsValueContainerView = createStatsValueStackView(with: stat)
            containerStackView.addArrangedSubview(statsValueContainerView)
            
            statsStackView.addArrangedSubview(containerStackView)
        }
    }
}

private extension PokemonStatsView {
    
    func configureView() {
        backgroundColor = .clear
        containerView.backgroundColor = .clear
        statsStackView.backgroundColor = .clear
    }
    
    func createLabel(with text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .regular)
        
        return label
    }
    
    func createStatsValueStackView(with stat: PokemonStat) -> UIStackView {
        let containerStackView = UIStackView()
        containerStackView.axis = .horizontal
        containerStackView.distribution = .fill
        containerStackView.spacing = 6
        
        let progressView = UIProgressView()
        progressView.progress = 0
        progressView.progressTintColor = .white
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) { progressView.setProgress(Float(stat.value) / 250, animated: true) }
        progressView.transform = progressView.transform.scaledBy(x: 1, y: 0.3)
        containerStackView.addArrangedSubview(progressView)
        
        let statValueLabel = createLabel(with: "\(stat.value)")
        containerStackView.addArrangedSubview(statValueLabel)
        statValueLabel.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        return containerStackView
    }
}
