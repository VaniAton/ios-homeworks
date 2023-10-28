
import UIKit

class FeedViewController: UIViewController {
    
    var post = Post(title: "Мои посты")
    
    private lazy var actionButton1: UIButton = {
            let button1 = UIButton()
            button1.setTitle("Новый пост", for: .normal)
        button1.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
            return button1
    }()
    
    private lazy var actionButton2: UIButton = {
            let button2 = UIButton()
            button2.setTitle("Новый пост", for: .normal)
        button2.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
            return button2
    }()
    
    private lazy var stackView: UIStackView = { [unowned self] in
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10.0
        
        stackView.addArrangedSubview(self.actionButton1)
        stackView.addArrangedSubview(self.actionButton2)
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Лента новостей"
        view.backgroundColor = .lightGray
        view.addSubview(stackView)
        setupConstraintsforStack()
        
    }
        
    @objc func buttonPressed(_ sender: UIButton) {
            let postViewController = PostViewController()
        
            postViewController.modalTransitionStyle = .flipHorizontal
            postViewController.modalPresentationStyle = .fullScreen
            postViewController.titlePost = post.title
        
            navigationController?.pushViewController(postViewController, animated: true)
    }

    
    func setupConstraintsforStack() {
        
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
        
            stackView.centerYAnchor.constraint(equalTo: safeAreaGuide.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: safeAreaGuide.centerXAnchor)
        ])
    }
    
    struct Post{
        var title: String
    }
}
