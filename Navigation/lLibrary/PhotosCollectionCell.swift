import UIKit

final class PhotosCollectionCell: UICollectionViewCell {
    
    private enum Constants {
        static let verticalSpacing: CGFloat = 8.0
        static let horizontalPadding: CGFloat = 8.0
        static let photosDescriptionVerticalPadding: CGFloat = 8.0
        static let imageHeight: CGFloat = 100.0
    }
    
    private lazy var imageInProfileCollection: UIImageView = {
        let imageInProfileCollection = UIImageView()
        imageInProfileCollection.translatesAutoresizingMaskIntoConstraints = false
        
        imageInProfileCollection.contentMode = .scaleAspectFill
        return imageInProfileCollection
    }()
    
    required init?(coder: NSCoder) {
        fatalError("errorCollection")
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupView()
        setupSubviews()
        setupLayouts()
    }
    
    private func setupView() {
        contentView.clipsToBounds = true
    }
    private func setupSubviews() {
        contentView.addSubview(imageInProfileCollection)
    }
    
    private func setupLayouts() {
        NSLayoutConstraint.activate([
            imageInProfileCollection.heightAnchor.constraint(equalToConstant: 150
                                                            ),
            imageInProfileCollection.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func setup(with photos: Photos) {
        imageInProfileCollection.image = UIImage(named: photos.image)
    }
}
