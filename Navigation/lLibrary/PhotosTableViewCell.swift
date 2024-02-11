import UIKit

class PhotosTableViewCell: UIViewController {
    
    private lazy var userCollectionPhotosLabel: UILabel = {
        let userPhotosLabel = UILabel()
        userPhotosLabel.text = "Photos"
        
        return userPhotosLabel
    }()
    
    private lazy var photosLabel: UILabel = {
        let label = UILabel()
        label.text="\u{2794}"
        
        return label
    }()
    
    private lazy var firstPhotoPreview: UIImageView = {
        let firstImage = UIImageView()
        firstImage.image = UIImage(named: "")
        firstImage.layer.cornerRadius = 6
        firstImage.clipsToBounds = true
        
        return firstImage
    }()
    
    private lazy var secondPhotoPreview: UIImageView = {
        let secondImage = UIImageView()
        secondImage.image = UIImage(named: "")
        secondImage.layer.cornerRadius = 6
        secondImage.clipsToBounds = true
        
        return secondImage
    }()
    
    private lazy var thirdPhotoPreview: UIImageView = {
        let thirdImage = UIImageView()
        thirdImage.image = UIImage(named: "")
        thirdImage.layer.cornerRadius = 6
        thirdImage.clipsToBounds = true
        
        
        return thirdImage
    }()
    
    private lazy var fourthPhotoPreview: UIImageView = {
        let fourthImage = UIImageView()
        fourthImage.image = UIImage(named: "")
        fourthImage.layer.cornerRadius = 6
        fourthImage.clipsToBounds = true
        
        
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
    
    private func setupContraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            userCollectionPhotosLabel.leadingAnchor.constraint(
                equalTo: safeAreaGuide.leadingAnchor, constant: 12
            ),
            userCollectionPhotosLabel.topAnchor.constraint(
                equalTo: safeAreaGuide.topAnchor, constant: 12
            ),
            userCollectionPhotosLabel.bottomAnchor.constraint(
                equalTo: stackPhotoView.topAnchor, constant: 12
            ),
            
            stackPhotoView.leadingAnchor.constraint(
                equalTo: safeAreaGuide.leadingAnchor, constant: 2
            ),
            stackPhotoView.bottomAnchor.constraint(
                equalTo: safeAreaGuide.bottomAnchor, constant: 12
            ),
            
            photosLabel.trailingAnchor.constraint(
                equalTo: safeAreaGuide.trailingAnchor, constant: -12
            ),
            photosLabel.bottomAnchor.constraint(
                equalTo: stackPhotoView.topAnchor, constant: 12
            ),
            photosLabel.topAnchor.constraint(
                equalTo: safeAreaGuide.topAnchor, constant: 12
            )
        ])
    }
}
