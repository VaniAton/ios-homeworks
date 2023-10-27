
import UIKit

class ProfileViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Профиль"
        view.backgroundColor = .lightGray
    //    let profileView = ProfileHeaderView()
        self.view.addSubview(profileView)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        let profileView = Navigation.ProfileHeaderView(frame: self.view.bounds)
        self.view.addSubview(profileView)
      }
    let profileView = ProfileHeaderView()
}


