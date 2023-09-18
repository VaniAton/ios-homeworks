

import UIKit

class InfoViewController: UIViewController {

    private lazy var allertButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Создать новый пост", for: .normal)

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(allertButton)
        allertButton.layer.cornerRadius = 14
        allertButton.backgroundColor = .gray

        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            allertButton.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 50.0
            ),
            allertButton.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -50.0
            ),
            allertButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -450),
            allertButton.heightAnchor.constraint(equalToConstant: 50)
        ])


        allertButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)

        
    }

    @objc func buttonPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Новый пост", message: "Вы действительно хотите создать новый пост?", preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "Да", style: .default)
        let cancBtn = UIAlertAction(title: "Нет", style: .default)
        alert.addAction(okBtn)
        alert.addAction(cancBtn)

        present(alert, animated: true)
    }
}
