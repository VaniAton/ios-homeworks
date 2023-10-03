import UIKit

class ProfileHeaderView: UIView {

    private lazy var actionButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("Новый пост", for: .normal)

            return button
    }()
}
