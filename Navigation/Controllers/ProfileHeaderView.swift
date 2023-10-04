import UIKit

class ProfileHeaderView: UIView {

    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 1170, height: 600))

        addSubview(actionButton)
        self.actionButton = setupSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private lazy var actionButton: UIButton = {
            let button = UIButton()
            button.setTitle("Новый пост", for: .normal)

            return button


    }()

    private func setupSubviews() {

    }

}
