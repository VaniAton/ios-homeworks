import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private lazy var userCollectionPhotosLabel: UILabel = {
        let userPhotosLabel = UILabel()
        userPhotosLabel.translatesAutoresizingMaskIntoConstraints = false
        userPhotosLabel.text = "Photos"
        userPhotosLabel.font = .systemFont(ofSize: 24, weight: .bold)
        userPhotosLabel.textColor = .black
        
        return userPhotosLabel
    }()
    
    private lazy var photosLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text="\u{2794}"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private lazy var firstPhotoPreview: UIImageView = {
        let firstImage = UIImageView()
        firstImage.image = UIImage(named: "image_1")
        firstImage.layer.cornerRadius = 6
        firstImage.clipsToBounds = true
        firstImage.contentMode = .scaleAspectFill
        
        return firstImage
    }()
    
    private lazy var secondPhotoPreview: UIImageView = {
        let secondImage = UIImageView()
        secondImage.image = UIImage(named: "image_2")
        secondImage.layer.cornerRadius = 6
        secondImage.clipsToBounds = true
        secondImage.contentMode = .scaleAspectFill
        
        return secondImage
    }()
    
    private lazy var thirdPhotoPreview: UIImageView = {
        let thirdImage = UIImageView()
        thirdImage.image = UIImage(named: "image_5")
        thirdImage.layer.cornerRadius = 6
        thirdImage.clipsToBounds = true
        thirdImage.contentMode = .scaleAspectFill
        
        
        return thirdImage
    }()
    
    private lazy var fourthPhotoPreview: UIImageView = {
        let fourthImage = UIImageView()
        fourthImage.image = UIImage(named: "image_12")
        fourthImage.layer.cornerRadius = 6
        fourthImage.clipsToBounds = true
        fourthImage.contentMode = .scaleAspectFill
        
        
        return fourthImage
    }()
    
    private lazy var stackPhotoView: UIStackView = { [unowned self] in
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 8.0
        
        stackView.addArrangedSubview(self.firstPhotoPreview)
        stackView.addArrangedSubview(self.secondPhotoPreview)
        stackView.addArrangedSubview(self.thirdPhotoPreview)
        stackView.addArrangedSubview(self.fourthPhotoPreview)
        
        return stackView
    }()
    
    
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(
            style: style,
            reuseIdentifier: reuseIdentifier
        )
        
        addSubviews()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error")
    }
    
    
    private func addSubviews() {
        
        contentView.addSubview(userCollectionPhotosLabel)
        contentView.addSubview(photosLabel)
        contentView.addSubview(stackPhotoView)
    }
    
    private func setupContraints() {
        
        NSLayoutConstraint.activate([
            photosLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor, constant: -12
            ),
            photosLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor, constant: 12
            ),
            userCollectionPhotosLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor, constant: 12
            ),
            userCollectionPhotosLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: 12
            ),
            stackPhotoView.topAnchor.constraint(
                equalTo: userCollectionPhotosLabel.bottomAnchor, constant: 12
            ),
            stackPhotoView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: 12
            ),
            stackPhotoView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor, constant: -12
            ),
            stackPhotoView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor, constant: -12
            ),
            stackPhotoView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
}
    
