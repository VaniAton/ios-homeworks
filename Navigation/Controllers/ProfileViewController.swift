
import UIKit

class ProfileViewController: UIViewController {

    let ProfileHeaderView1: UIView = {
        let ProfileHeaderView = UIView()
        ProfileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        return ProfileHeaderView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Профиль"
        view.backgroundColor = .lightGray
        view.addSubview(ProfileHeaderView1)
        constraintsProfileHeaderView()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        let profileView = Navigation.ProfileHeaderView(frame: self.view.bounds)
        self.view.addSubview(profileView)
      }
    
    func constraintsProfileHeaderView() {
        NSLayoutConstraint(item: ProfileHeaderView1,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .leadingMargin,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: ProfileHeaderView1,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .trailingMargin,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: ProfileHeaderView1,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .topMargin,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: ProfileHeaderView1,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .width,
                           multiplier: 1,
                           constant: 200).isActive = true
    }
}


