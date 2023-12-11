import Foundation
import UIKit

class LogInViewController: UIViewController {
    
    // Изображение логотипа
    private lazy var imageLanchScreen: UIImageView = {
        let imageLanchScreen = UIImageView()
        imageLanchScreen.translatesAutoresizingMaskIntoConstraints = false
        imageLanchScreen.image = UIImage(named: "AppIcon")
       return imageLanchScreen
    }()
    
    // поле логина
    private lazy var emailButton: UITextField = {
        let emailButton =  UITextField()
        emailButton.placeholder = "Email of phone"
        emailButton.layer.borderWidth = 0.5
        emailButton.backgroundColor = .systemGray6
        emailButton.textColor = .black
        emailButton.autocapitalizationType = .none
        emailButton.font = .systemFont(ofSize: 16)
        
        return emailButton
    }()
    
    // поле пароля
    private lazy var passwordButton: UITextField = {
        let passwordButton =  UITextField()
        passwordButton.placeholder = "Password"
        passwordButton.isSecureTextEntry = true
        passwordButton.backgroundColor = .systemGray6
        passwordButton.layer.borderWidth = 0.5
        passwordButton.textColor = .black
        passwordButton.autocapitalizationType = .none
        passwordButton.font = UIFont.systemFont(ofSize: 16)
        
        return passwordButton
    }()
    
    // UIStackView с логином и паролем
    private lazy var loginStack: UIStackView = { [unowned self] in
        let loginStack = UIStackView()
        
        loginStack.translatesAutoresizingMaskIntoConstraints = false
        loginStack.clipsToBounds = true
        
        loginStack.axis = .vertical
        loginStack.distribution = .fillEqually
        loginStack.alignment = .fill
        loginStack.layer.cornerRadius = 10
        loginStack.layer.borderColor = UIColor.lightGray.cgColor
        loginStack.layer.borderWidth = 0.5
        
        
        loginStack.addArrangedSubview(self.emailButton)
        loginStack.addArrangedSubview(self.passwordButton)
        
        return loginStack
    }()
    
    // кнопка логина
    private lazy var logInButton: UIButton = {
        let logInButton = UIButton()
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.layer.cornerRadius = 10
        logInButton.setTitle("Log in", for: .normal)
        logInButton.backgroundColor = UIColor(patternImage: UIImage(named: "blue_pixel")!)
        logInButton.titleLabel?.textColor = .white
        logInButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return logInButton
    }()
    
    // добавление вью
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(imageLanchScreen)
        view.addSubview(loginStack)
        view.addSubview(logInButton)
        setupContraints()
        self.hideNavigationBar()
    }
    // Прячем навигационный бар в VC
    func hideNavigationBar() {
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        }
    func showNavigationBar() {
            self.navigationController?.setNavigationBarHidden(false, animated: true)
        }
    
    // механизм работы кнопки
    @objc func buttonPressed() {
        let profileViewCOntroller = ProfileViewController()
        profileViewCOntroller.modalPresentationStyle = .fullScreen
    
        navigationController?.pushViewController(profileViewCOntroller, animated: true)
    }
    
    // констрейнты для вью
    func setupContraints() {
        
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            imageLanchScreen.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 120),
            imageLanchScreen.centerXAnchor.constraint(equalTo: safeAreaGuide.centerXAnchor),
            imageLanchScreen.widthAnchor.constraint(equalToConstant: 100),
            imageLanchScreen.heightAnchor.constraint(equalToConstant: 100),
            
            loginStack.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16),
            loginStack.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -16),
            loginStack.topAnchor.constraint(equalTo: imageLanchScreen.bottomAnchor, constant: 120),
            loginStack.heightAnchor.constraint(equalToConstant: 100),
            
            logInButton.topAnchor.constraint(equalTo: loginStack.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
        
        ])
    }
}

// структура для таблицы
struct LabelLogin {
    let name: String
    
}
    
    extension LabelLogin {
        
        static func make() -> [LabelLogin] {
            [
                LabelLogin(name: "Login or Number"),
                LabelLogin(name: "Password"),
            ]
        }
    }
