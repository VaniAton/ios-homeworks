import UIKit

final class PhotosCollectionViewCell: UICollectionViewCell {
    
    
    private lazy var imageInProfileCollection: UIImageView = {
        let imageInProfileCollection = UIImageView()
        imageInProfileCollection.translatesAutoresizingMaskIntoConstraints = false

        return imageInProfileCollection
    }()
    
    required init?(coder: NSCoder) {
        fatalError("errorCollection")
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupSubviews()
        setupLayouts()
    }
    
    private func setupSubviews() {
        contentView.addSubview(imageInProfileCollection)
    }
    
    private func setupLayouts() {
        NSLayoutConstraint.activate([
            imageInProfileCollection.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageInProfileCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageInProfileCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageInProfileCollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func setup(photos: Photos) {
        imageInProfileCollection.image = UIImage(named: photos.image)
    }
}

