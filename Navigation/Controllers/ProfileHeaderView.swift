import UIKit

class ProfileHeaderView: UIView {

    private lazy var imageProfile: UIImageView = {
        var imageProfile = UIImageView(frame: CGRect(x: 16, y: 150, width: 170, height: 170))
        imageProfile.image = UIImage(named: "userAvatar")
        imageProfile.layer.cornerRadius = 50
        imageProfile.clipsToBounds = true
        imageProfile.layer.borderColor = UIColor.blue.cgColor
        imageProfile.layer.borderWidth = 5

        return imageProfile
    }()

    private lazy var nameProfile: UILabel = {
        let nameProfile = UILabel(frame: CGRect(x: 150, y: 80, width: 200, height: 80))
        nameProfile.text = "Hipster Cat"

        return nameProfile
    }()

    private lazy var ShowStatusButton: UIButton = {
            let ShowStatusButton = UIButton(frame: CGRect(x: 16, y: 400, width: 350, height: 50))
            ShowStatusButton.layer.cornerRadius = 4
            ShowStatusButton.setTitle("Show status", for: .normal)
        ShowStatusButton.backgroundColor = .blue

            return ShowStatusButton
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageProfile)
        self.addSubview(nameProfile)
        self.addSubview(ShowStatusButton)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }



    private func setupSubviews() {


    }
}

