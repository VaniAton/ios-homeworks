
import UIKit

class PostViewController: UIViewController {

    var titlePost: String = "Новый пост"

    private lazy var openButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(openInfo))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = openButton
        view.backgroundColor = .systemGray2
        self.navigationItem.title = titlePost
}

@objc func openInfo(_ sender: UIButton) {
    let infoViewController = InfoViewController()

    infoViewController.modalTransitionStyle = .flipHorizontal
    infoViewController.modalPresentationStyle = .fullScreen
    present(infoViewController, animated: true)
    }
}



