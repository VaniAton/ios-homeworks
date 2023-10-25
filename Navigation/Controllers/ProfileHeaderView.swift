import UIKit

class ProfileHeaderView: UIView, UITextFieldDelegate {

    private lazy var imageProfile: UIImageView = {
        var imageProfile = UIImageView(frame: CGRect(x: 16, y: 130, width: 150, height: 150))
        imageProfile.image = UIImage(named: "userAvatar")
        imageProfile.layer.cornerRadius = 75
        imageProfile.clipsToBounds = true
        imageProfile.layer.borderColor = UIColor.white.cgColor
        imageProfile.layer.borderWidth = 3
        imageProfile.translatesAutoresizingMaskIntoConstraints = false

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
    
    private lazy var statusLabel: UILabel = {
        let statusLabel = UILabel(frame: CGRect(x: 180, y: 180, width: 100, height: 40))
        statusLabel.text = "status"
        statusLabel.layer.backgroundColor = .none
        statusLabel.textColor = .gray

        return statusLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageProfile)
        self.addSubview(nameProfile)
        self.addSubview(ShowStatusButton)
        self.addSubview(statusProfile)
        self.addSubview(statusLabel)
        constraintsForAllUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func buttonPressed() {

        print(self.statusProfile.text ?? "Status")
    }
    
    func constraintsImageProfile() {
        
        NSLayoutConstraint.activate([
            imageProfile.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            imageProfile.bottomAnchor.constraint(equalTo: ShowStatusButton.topAnchor, constant: 16),
            imageProfile.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            imageProfile.trailingAnchor.constraint(equalTo: statusProfile.trailingAnchor, constant: 16)
        //    imageProfile.heightAnchor.constraint(equalToConstant: 20),
        //    imageProfile.widthAnchor.constraint(equalToConstant: 160)
            ])
        }
    func constraintsShowStatusButton() {
        
        NSLayoutConstraint.activate([
            ShowStatusButton.topAnchor.constraint(equalTo: imageProfile.bottomAnchor, constant: 16),
            ShowStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            ShowStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 16),
            ShowStatusButton.heightAnchor.constraint(equalToConstant: 50),
            ])
        }
    func constraintsNameProfile() {
        
        NSLayoutConstraint.activate([
            nameProfile.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            nameProfile.leadingAnchor.constraint(equalTo: imageProfile.leadingAnchor, constant: 16),
            nameProfile.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 100),
            nameProfile.bottomAnchor.constraint(equalTo: statusProfile.topAnchor, constant: 34),
            nameProfile.heightAnchor.constraint(equalToConstant: 40)
            ])
        }
    func constraintsStatusProfile() {
        
        NSLayoutConstraint.activate([
            statusProfile.topAnchor.constraint(equalTo: imageProfile.bottomAnchor, constant: 34),
            statusProfile.leadingAnchor.constraint(equalTo: imageProfile.leadingAnchor, constant: 16),
            statusProfile.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 40),
            statusProfile.bottomAnchor.constraint(equalTo: ShowStatusButton.topAnchor, constant: 34),
            statusProfile.heightAnchor.constraint(equalToConstant: 40)
            ])
        }
    func constraintsStatusLabel() {
        
        NSLayoutConstraint.activate([
            statusProfile.topAnchor.constraint(equalTo: imageProfile.bottomAnchor, constant: 34),
            statusProfile.leadingAnchor.constraint(equalTo: imageProfile.leadingAnchor, constant: 16),
            statusProfile.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 40),
            statusProfile.bottomAnchor.constraint(equalTo: ShowStatusButton.topAnchor, constant: 34),
            statusProfile.heightAnchor.constraint(equalToConstant: 40)
            ])
        }
    func constraintsForAllUI() {
        constraintsImageProfile()
        constraintsShowStatusButton()
        constraintsNameProfile()
        constraintsStatusProfile()
        constraintsStatusLabel()
    }
}

