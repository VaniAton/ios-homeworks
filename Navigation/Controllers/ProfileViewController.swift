
import UIKit

class ProfileViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Профиль"
        view.backgroundColor = .lightGray
    //    let profileView = ProfileHeaderView()
        self.view.addSubview(profileView)
        profileView.translatesAutoresizingMaskIntoConstraints = false
    }

    override func viewWillLayoutSubviews() {
    }
    let profileView = ProfileHeaderView()
    
    func setupContraintsForProfileHV() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            profileView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: 0),
            profileView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 0),
            profileView.heightAnchor.constraint(equalToConstant: 220),
            profileView.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaGuide.topAnchor, multiplier: 1.0)
        ])
    }
}


