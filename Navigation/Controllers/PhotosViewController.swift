import UIKit

class PhotosViewController: UIViewController {
    
    let photoIdent = "photoCell"
    fileprivate lazy var photos: [Photos] = Photos.make()
    
    lazy var viewLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets.init(top: 8, left: 8, bottom: 8, right: 8)
        return layout
    }()
    
    private let collectionPhotos: UICollectionView = {
        let viewLayout = UICollectionViewLayout()
        
        let collectionPhotos = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionPhotos.translatesAutoresizingMaskIntoConstraints = false
        collectionPhotos.backgroundColor = .systemBackground
        
        collectionPhotos.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "photoCell")
        
        return collectionPhotos
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupConstraints()
        
    }
    func setupConstraints() {
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
            
        NSLayoutConstraint.activate([
            collectionPhotos.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionPhotos.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            collectionPhotos.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            collectionPhotos.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            ])
        }
    
    private func setupCollectionView() {
        view.addSubview(collectionPhotos)
        
        collectionPhotos.dataSource = self
        collectionPhotos.delegate = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = true
    }
}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotosCollectionViewCell
        let photo = photos[indexPath.row]
        cell.setup(photos: photo)
                return cell
    }
    
    
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let countItem: CGFloat = 2
        let accessibleWidth = collectionView.frame.width - 32
        let widthItem = (accessibleWidth / countItem)
        return CGSize(width: widthItem, height: widthItem * 0.56)
    }
}

final class photos {
    
    static let shared = photos()
    
    let examples: [UIImage]
    
    private init() {
        var photos = [UIImage]()
        for i in 1...20 { photos.append((UIImage(named: "\(i)") ?? UIImage())) }
        examples = photos.shuffled()
    }
}
