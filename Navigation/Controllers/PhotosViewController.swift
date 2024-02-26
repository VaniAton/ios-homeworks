import UIKit

class PhotosViewController: UIViewController {
    
    fileprivate lazy var photos: [Photos] = Photos.make()
    
    private let collectionPhotos: UICollectionView = {
        let viewLayout = UICollectionViewLayout()
        
        let collectionPhotos = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionPhotos.translatesAutoresizingMaskIntoConstraints = false
        collectionPhotos.backgroundColor = .systemBackground
        
        collectionPhotos.register(PhotosCollectionCell.self, forCellWithReuseIdentifier: PhotosCollectionCell.identifier)
        
        return collectionPhotos
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionPhotos)
        
        collectionPhotos.dataSource = self
        collectionPhotos.delegate = self
        
    }
    private enum LayoutConstant {
        static let spacing: CGFloat = 8.0
        static let itemHeight: CGFloat = 8.0
    }
}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionPhotos.dequeueReusableCell(withReuseIdentifier: PhotosCollectionCell.identifier, for: indexPath) as! PhotosCollectionCell
        
        let photos = photos[indexPath.row]
        cell.setup(with: photos)
        
        return cell
    }
    
    
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionView, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = itemWidth(
//                    for: view.frame.width,
//                    spacing: LayoutConstant.spacing
//                )
//                
//                return CGSize(width: width, height: LayoutConstant.itemHeight)
//    }
}
protocol ReusableView: AnyObject {
    static var identifier: String { get }
}

extension UICollectionViewCell: ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}
