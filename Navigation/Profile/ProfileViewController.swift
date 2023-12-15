
import UIKit

class ProfileViewController: UIViewController {

    let profileView = ProfileHeaderView()
    
    lazy var changeTitile: UIButton = {
        let changeTitile = UIButton()
        changeTitile.translatesAutoresizingMaskIntoConstraints = false
        changeTitile.backgroundColor = .blue
        
        return changeTitile
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Профиль"
        view.backgroundColor = .lightGray
        self.view.addSubview(profileView)
        self.view.addSubview(changeTitile)
        setupContraintsForProfileHV()
    }

    override func viewWillLayoutSubviews() {
    }
    
    func setupContraintsForProfileHV() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        profileView.backgroundColor = .white
        profileView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: 0),
            profileView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 0),
            profileView.heightAnchor.constraint(equalToConstant: 220),
            profileView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 0),
            
            changeTitile.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: 0),
            changeTitile.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 0),
            changeTitile.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor, constant: 0)
        ])
    }
}


