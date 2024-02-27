import UIKit

class PhotosViewController: UIViewController {
    
    fileprivate lazy var photos: [Photos] = Photos.make()
    
    let photoIdent = "photoCell"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    private let collectionPhotos: UICollectionView = {
        
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.minimumInteritemSpacing = 8
        viewLayout.minimumLineSpacing = 8
        viewLayout.scrollDirection = .vertical
        viewLayout.sectionInset = UIEdgeInsets.init(top: 8, left: 8, bottom: 8, right: 8)
        
        let collectionPhotos = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionPhotos.translatesAutoresizingMaskIntoConstraints = false
        collectionPhotos.backgroundColor = .white
        
        collectionPhotos.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "photoCell")
        
        return collectionPhotos
    }()
    
    private lazy var openButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(openInfo))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Photo"
        setupCollectionView()
        setupConstraints()
        
    }
    
    @objc func openInfo(_ sender: UIButton) {
        let infoViewController = InfoViewController()

        infoViewController.modalTransitionStyle = .flipHorizontal
        infoViewController.modalPresentationStyle = .fullScreen
        present(infoViewController, animated: true)
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
        let countItem: CGFloat = 3
        let accessibleWidth = collectionView.frame.width - 32
        let widthItem = (accessibleWidth / countItem)
        return CGSize(width: widthItem, height: widthItem * 0.56)
    }
}

