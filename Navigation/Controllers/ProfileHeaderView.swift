import UIKit

class ProfileHeaderView: UIView, UITextFieldDelegate {

    private lazy var imageProfile: UIImageView = {
        var imageProfile = UIImageView(frame: CGRect(x: 16, y: 130, width: 150, height: 150))
        imageProfile.image = UIImage(named: "userAvatar")
        imageProfile.layer.cornerRadius = 75
        imageProfile.clipsToBounds = true
        imageProfile.layer.borderColor = UIColor.white.cgColor
        imageProfile.layer.borderWidth = 3

        return imageProfile
    }()

    private lazy var nameProfile: UILabel = {
        let nameProfile = UILabel(frame: CGRect(x: 200, y: 100, width: 200, height: 80))
        nameProfile.font = UIFont.systemFont(ofSize: 24)
        nameProfile.textColor = .black
        nameProfile.text = "Hipster Cat"

        return nameProfile
    }()

    private lazy var statusProfile: UITextField = {
        let statusProfile =  UITextField(frame: CGRect(x: 180, y: 230, width: 170, height: 40))
        statusProfile.placeholder = "Waiting for something..."
        statusProfile.font = UIFont.systemFont(ofSize: 15)
        statusProfile.borderStyle = UITextField.BorderStyle.roundedRect
        statusProfile.autocorrectionType = UITextAutocorrectionType.no
        statusProfile.keyboardType = UIKeyboardType.default
        statusProfile.returnKeyType = UIReturnKeyType.done
        statusProfile.clearButtonMode = UITextField.ViewMode.whileEditing
        statusProfile.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        statusProfile.delegate = self
        statusProfile.backgroundColor = UIColor.white
        statusProfile.layer.borderWidth = 1
        statusProfile.layer.borderColor = UIColor.black.cgColor
        statusProfile.layer.cornerRadius = 11

        return statusProfile
    }()

    private lazy var ShowStatusButton: UIButton = {
        let ShowStatusButton = UIButton(frame: CGRect(x: 16, y: 300, width: 350, height: 50))
        ShowStatusButton.layer.cornerRadius = 16
        ShowStatusButton.setTitle("Show status", for: .normal)
        ShowStatusButton.backgroundColor = .systemBlue
        ShowStatusButton.titleLabel?.textColor = .white
        ShowStatusButton.layer.shadowColor = UIColor.black.cgColor
        ShowStatusButton.layer.shadowOpacity = 0.7
        ShowStatusButton.layer.shadowRadius = 4
        ShowStatusButton.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        ShowStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

        return ShowStatusButton
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageProfile)
        self.addSubview(nameProfile)
        self.addSubview(ShowStatusButton)
        self.addSubview(statusProfile)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func buttonPressed() {

        print(self.statusProfile.text ?? "Status") // Почему то выходит ошибка при нажатии, но если заполнить поле текстом и вызвать функцию то текст отображается в консоли
    }
}

