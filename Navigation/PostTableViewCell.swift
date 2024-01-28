import UIKit

class PostTableViewCell: UITableViewCell {
    
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(
            style: .subtitle,
            reuseIdentifier: reuseIdentifier
        )
        
        tuneView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error_2")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        isHidden = false
        isSelected = false
        isHighlighted = false
    }
    
    private func tuneView() {
        backgroundColor = .systemGray
        contentView.backgroundColor = .blue
        textLabel?.backgroundColor = .clear
        detailTextLabel?.backgroundColor = .clear
        imageView?.backgroundColor = .clear
        
        accessoryView = nil
        accessoryType = .disclosureIndicator
        
        selectionStyle = .gray
        let selectedView = UIView()
        selectedView.backgroundColor = .systemGray
        selectedBackgroundView = selectedView
    }
    
    internal func update(post: Post) {
        textLabel?.text = post.author
        detailTextLabel?.text = post.description
        
        
        
    }
}

