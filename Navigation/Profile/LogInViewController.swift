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
    
    private lazy var emailButton: UITextField = {
        let emailButton =  UITextField()
        emailButton.placeholder = " Email of phone"
        emailButton.layer.borderWidth = 0.5
        emailButton.backgroundColor = .systemGray6
        emailButton.textColor = .black
        emailButton.autocapitalizationType = .none
        emailButton.font = .systemFont(ofSize: 16)
        emailButton.layer.borderColor = UIColor.lightGray.cgColor
        emailButton.keyboardType = UIKeyboardType.default
        emailButton.returnKeyType = UIReturnKeyType.done
        
        emailButton.delegate = self
        
        return emailButton
    }()
    
    private lazy var passwordButton: UITextField = {
        let passwordButton =  UITextField()
        passwordButton.placeholder = " Password"
        passwordButton.isSecureTextEntry = true
        passwordButton.backgroundColor = .systemGray6
        passwordButton.layer.borderWidth = 0.5
        passwordButton.textColor = .black
        passwordButton.autocapitalizationType = .none
        passwordButton.font = UIFont.systemFont(ofSize: 16)
        passwordButton.layer.borderColor = UIColor.lightGray.cgColor
        passwordButton.keyboardType = UIKeyboardType.default
        passwordButton.returnKeyType = UIReturnKeyType.done
        
        passwordButton.delegate = self
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
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .white
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        
        return contentView
    }()
    
    // добавление вью
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.hideNavigationBar()
        addSubviews()
        setupContraints()
        
        setupContentOfScrollView()
        
    }
    
    private func addSubviews() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupKeyboardObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        removeKeyboardObservers()
    }
    @objc func willShowKeyboard(_ notification: NSNotification) {
        let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height
        scrollView.contentInset.bottom = keyboardHeight ?? 0.0
    }
    
    @objc func willHideKeyboard(_ notification: NSNotification) {
        scrollView.contentInset.bottom = 0.0
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
            scrollView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
         ])
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            
        ])
    }
    private func setupContentOfScrollView() {
        
        contentView.addSubview(imageLanchScreen)
        contentView.addSubview(loginStack)
        contentView.addSubview(logInButton)
        
        
        NSLayoutConstraint.activate([
            imageLanchScreen.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            imageLanchScreen.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageLanchScreen.widthAnchor.constraint(equalToConstant: 100),
            imageLanchScreen.heightAnchor.constraint(equalToConstant: 100),
           
            loginStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginStack.topAnchor.constraint(equalTo: imageLanchScreen.bottomAnchor, constant: 120),
            loginStack.heightAnchor.constraint(equalToConstant: 100),
           
            logInButton.topAnchor.constraint(equalTo: loginStack.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
       ])
        
            logInButton.subviews.last?.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
        
        private func setupKeyboardObservers() {
            let notificationCenter = NotificationCenter.default
            
            notificationCenter.addObserver(
                self,
                selector: #selector(self.willShowKeyboard(_:)),
                name: UIResponder.keyboardWillShowNotification,
                object: nil
            )
            
            notificationCenter.addObserver(
                self,
                selector: #selector(self.willHideKeyboard(_:)),
                name: UIResponder.keyboardWillHideNotification,
                object: nil
            )
        }
        
        private func removeKeyboardObservers() {
            let notificationCenter = NotificationCenter.default
            notificationCenter.removeObserver(self)
        }
        
    }
    extension LogInViewController: UITextFieldDelegate {
        
        func textFieldShouldReturn(
            _ textField: UITextField
        ) -> Bool {
            textField.resignFirstResponder()
            
            return true
        }
    }

