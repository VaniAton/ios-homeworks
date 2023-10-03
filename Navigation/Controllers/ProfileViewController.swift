
import UIKit

class ProfileViewController: UIViewController {

    var profileView = ProfileHeaderView()


    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Профиль"
        view.backgroundColor = .lightGray
        view.addSubview(profileView)
        profileView.backgroundColor = .black

        super.viewWillLayoutSubviews()
    }

    

}

