
import UIKit

class ProfileViewController: UIViewController {

    var profileView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Профиль"
        view.backgroundColor = .lightGray
        view.addSubview(profileView)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileView.frame = view.bounds
    }
}


