import UIKit

class ProfileHeaderView: UIView, UITextFieldDelegate {
    
    private lazy var imageProfile: UIImageView = {
        var imageProfile = UIImageView()
        imageProfile.translatesAutoresizingMaskIntoConstraints = false
        imageProfile.image = UIImage(named: "userAvatar")
        imageProfile.layer.cornerRadius = 75
        imageProfile.clipsToBounds = true
        imageProfile.layer.borderColor = UIColor.white.cgColor
        imageProfile.layer.borderWidth = 3
        imageProfile.contentMode = .scaleAspectFill
        
        
        return imageProfile
    }()
    
    private lazy var nameProfile: UILabel = {
        let nameProfile = UILabel()
        nameProfile.translatesAutoresizingMaskIntoConstraints = false
        nameProfile.font = UIFont.systemFont(ofSize: 24)
        nameProfile.textColor = .black
        nameProfile.text = "Hipster Cat"
        
        return nameProfile
    }()
    
    private lazy var statusProfile: UITextField = {
        let statusProfile =  UITextField()
        statusProfile.translatesAutoresizingMaskIntoConstraints = false
        statusProfile.placeholder = " Waiting for something..."
        statusProfile.font = UIFont.systemFont(ofSize: 15)
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
        statusProfile.font = UIFont.preferredFont(forTextStyle: .body)
        statusProfile.keyboardType = .default
        statusProfile.returnKeyType = .done
        statusProfile.clearButtonMode = .whileEditing
        statusProfile.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        
        return statusProfile
    }()
    
    private lazy var showStatusButton: UIButton = {
        let showStatusButton = UIButton()
        showStatusButton.translatesAutoresizingMaskIntoConstraints = false
        showStatusButton.layer.cornerRadius = 16
        showStatusButton.setTitle("Show status", for: .normal)
        showStatusButton.backgroundColor = .systemBlue
        showStatusButton.titleLabel?.textColor = .white
        showStatusButton.layer.shadowColor = UIColor.black.cgColor
        showStatusButton.layer.shadowOpacity = 0.7
        showStatusButton.layer.shadowRadius = 4
        showStatusButton.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        showStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return showStatusButton
    }()
    
    private lazy var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.text = "status"
        statusLabel.layer.backgroundColor = .none
        statusLabel.textColor = .gray
        
        return statusLabel
    }()
    
    private var statusText: String = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageProfile)
        self.addSubview(nameProfile)
        self.addSubview(showStatusButton)
        self.addSubview(statusProfile)
        self.addSubview(statusLabel)
        constraintsForAllUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? "Status"
    }
        @objc func buttonPressed() {
            statusLabel.text = statusText
            
            print(self.statusProfile.text ?? "Status")
        }
        
        func constraintsForAllUI() {
            
            NSLayoutConstraint.activate([
                imageProfile.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
                imageProfile.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
                imageProfile.heightAnchor.constraint(equalToConstant: 150.0),
                imageProfile.widthAnchor.constraint(equalToConstant: 150.0),
                
                statusProfile.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
                statusProfile.leadingAnchor.constraint(equalTo: imageProfile.trailingAnchor, constant: 16),
                statusProfile.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
                statusProfile.heightAnchor.constraint(equalToConstant: 40),
                
                nameProfile.leadingAnchor.constraint(equalTo: imageProfile.trailingAnchor, constant: 16),
                nameProfile.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 50),
                nameProfile.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                
                showStatusButton.topAnchor.constraint(equalTo: imageProfile.bottomAnchor, constant: 16),
                showStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
                showStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
                showStatusButton.heightAnchor.constraint(equalToConstant: 34),
                
                statusLabel.leadingAnchor.constraint(equalTo: imageProfile.trailingAnchor, constant: 16),
                statusLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
                statusLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60),
                statusLabel.bottomAnchor.constraint(equalTo: statusProfile.topAnchor, constant: 0)
            ])
        }
    }
