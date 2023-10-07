import UIKit

class ProfileHeaderView: UIView {

    private lazy var textButton: UIButton = {
            let button = UIButton()
            button.setTitle("Show status", for: .normal)

            return button
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)

        self.setupSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }



    private func setupSubviews() {
        addSubview(textButton)
        NSLayoutConstraint.activate([
            textButton.leadingAnchor.constraint(
            equalTo: safeAreaLayoutGuide.leadingAnchor,
            constant: 50.0
            ),
            textButton.trailingAnchor.constraint(
            equalTo: safeAreaLayoutGuide.trailingAnchor,
            constant: -50.0
            ),
            textButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100),
            textButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

}


