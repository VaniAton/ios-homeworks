
import UIKit

class FeedViewController: UIViewController {

    var post = Post(title: "Мой пост")

    private lazy var actionButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("Новая новость", for: .normal)
        
            
            return button
        }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Лента новостей"
        view.backgroundColor = .systemBrown

        view.addSubview(actionButton)
        actionButton.layer.cornerRadius = 12
        actionButton.backgroundColor = .blue


                let safeAreaLayoutGuide = view.safeAreaLayoutGuide
                NSLayoutConstraint.activate([
                    actionButton.leadingAnchor.constraint(
                        equalTo: safeAreaLayoutGuide.leadingAnchor,
                        constant: 50.0
                    ),
                    actionButton.trailingAnchor.constraint(
                        equalTo: safeAreaLayoutGuide.trailingAnchor,
                        constant: -50.0
                    ),
                    actionButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100),
                    actionButton.heightAnchor.constraint(equalToConstant: 50)
                ])

                actionButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
            }

            @objc func buttonPressed(_ sender: UIButton) {
                let postViewController = PostViewController()

                    postViewController.modalTransitionStyle = .flipHorizontal
                    postViewController.modalPresentationStyle = .fullScreen
                    postViewController.titlePost = post.title

                navigationController?.pushViewController(postViewController, animated: true)
            }

}

struct Post{
    var title: String
}
