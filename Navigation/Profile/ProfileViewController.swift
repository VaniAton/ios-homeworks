
import UIKit

class ProfileViewController: UIViewController  {
    
    fileprivate let data = Post.make()
    static let headerIdent = "header"
    static let photoIdent = "photo"
    static let postIdent = "post"
 
// MARK: - Subviews
    
    private var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: headerIdent)
        table.register(PhotosTableViewCell.self, forCellReuseIdentifier: photoIdent)
        table.register(PostTableViewCell.self, forCellReuseIdentifier: postIdent)
        return table
    }()
    
    private enum CellReuseID: String {
        case custom = "CustomTableViewCell_ReuseID"
        case photos = "PhotosTableViewCell_ReuseID"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        setupConstraints()
        tuneTableView()
        
        
        view.backgroundColor = .systemBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.indexPathsForSelectedRows?.forEach{ indexPath in
            tableView.deselectRow(
                at: indexPath,
                animated: animated
            )
        }
    }
    
// MARK: - Constraints
    
    func setupConstraints() {
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
            
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            ])
        }
    private func tuneTableView() {
        tableView.rowHeight = UITableView.automaticDimension // высота каждой ячейки
        tableView.estimatedRowHeight = 40.0
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
}

// MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    
// MARK: - Колличество секций
    
    func numberOfSections(
        in tableView: UITableView
    ) -> Int {
        2
    }
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        switch section {
        case 0: return 1
        case 1: return 4
        default:
            assertionFailure("no registered section")
            return 1
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: Self.photoIdent, for: indexPath) as! PhotosTableViewCell
            return cell
        case 1:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: Self.postIdent, for: indexPath) as! PostTableViewCell
            cell.configPost(post: data[indexPath.row])
            return cell
        default:
            assertionFailure("no registered section")
            return UITableViewCell()
        }
    }
}
 // MARK: - UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == 0 else { return nil }
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: Self.headerIdent) as! ProfileHeaderView?
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 220 : 0
    }
}
