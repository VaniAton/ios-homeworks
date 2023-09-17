
import UIKit

class PostViewController: UIViewController {

    var titlePost: String = "Полезный отдых"

    private lazy var actionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Назад", for: .normal)

        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = titlePost
        view.backgroundColor = .systemGray2
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
        dismiss(animated: true)
    }
}


