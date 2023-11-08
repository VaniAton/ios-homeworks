import Foundation
import UIKit

class LogInViewController: UIViewController {
    
    private lazy var imageLanchScreen: UIImageView = {
        let imageLanchScreen = UIImageView()
        imageLanchScreen.translatesAutoresizingMaskIntoConstraints = false
        imageLanchScreen.image = UIImage(named: "AppIcon")
       return imageLanchScreen
    }()
    
    private lazy var loginTable: UITableView = {
        let loginTable = UITableView.init(
            frame: .zero,
            style: .plain)
        loginTable.translatesAutoresizingMaskIntoConstraints = false
        
        return loginTable
    }()
    
    private lazy var emailButton: UITextField = {
        let emailButton =  UITextField()
        emailButton.translatesAutoresizingMaskIntoConstraints = false
        emailButton.placeholder = "Email of phone"
        emailButton.layer.borderColor = UIColor.lightGray.cgColor
        emailButton.layer.borderWidth = 0.5
        emailButton.layer.cornerRadius = 10
        emailButton.backgroundColor = .systemGray
        
        return emailButton
    }()
    
    private lazy var passwordButton: UITextField = {
        let passwordButton =  UITextField()
        passwordButton.translatesAutoresizingMaskIntoConstraints = false
        passwordButton.placeholder = "Password"
        passwordButton.isSecureTextEntry = true
        passwordButton.backgroundColor = .systemGray
        passwordButton.layer.borderColor = UIColor.lightGray.cgColor
        passwordButton.layer.borderWidth = 0.5
        passwordButton.layer.cornerRadius = 10
        
        return passwordButton
    }()
    
    private lazy var logInButton: UIButton = {
        let logInButton = UIButton()
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.layer.cornerRadius = 16
        logInButton.setTitle("Log in", for: .normal)
        logInButton.backgroundColor = .systemBlue
        logInButton.titleLabel?.textColor = .white
        logInButton.layer.shadowColor = UIColor.black.cgColor
        logInButton.layer.shadowOpacity = 0.7
        logInButton.layer.shadowRadius = 4
        logInButton.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        logInButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return logInButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(imageLanchScreen)
        view.addSubview(logInButton)
        constraintsForLogin()
    }
    override func viewWillAppear(_ animated: Bool) {
          self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    @objc func buttonPressed() {
        let profileViewCOntroller = ProfileViewController()
        profileViewCOntroller.modalPresentationStyle = .fullScreen
    
        navigationController?.pushViewController(profileViewCOntroller, animated: true)
    }
    func constraintsForLogin() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            imageLanchScreen.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 120),
            imageLanchScreen.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            imageLanchScreen.widthAnchor.constraint(equalToConstant: 100),
            imageLanchScreen.heightAnchor.constraint(equalToConstant: 100),
            
            logInButton.topAnchor.constraint(equalTo: passwordButton.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
        
        ])
    }
}
