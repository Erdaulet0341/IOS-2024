import UIKit

class TrackTableViewCell: UITableViewCell {
    let titleLabel = UILabel()
    let lengthLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        lengthLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        lengthLabel.textColor = .gray

        let stackView = UIStackView(arrangedSubviews: [titleLabel, lengthLabel])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 4

        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
