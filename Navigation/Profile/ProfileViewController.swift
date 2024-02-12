
import UIKit

class ProfileViewController: UIViewController  {
    
    fileprivate let data = Post.make()
    static let headerIdent = "header"
 
// MARK: - Subviews
    
    private var tableView: UITableView = {
        let tableView = UITableView.init(
            frame: .zero,
            style: .plain
        )
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
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
        tableView.estimatedRowHeight = 60.0
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
      
// MARK: - Регистрация ячеек
        
        tableView.register(
            PhotosTableViewCell.self,
            forCellReuseIdentifier: CellReuseID.photos.rawValue
        )
        
        tableView.register(
            PostTableViewCell.self,
            forCellReuseIdentifier: CellReuseID.custom.rawValue
        )
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
        data.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CellReuseID.custom.rawValue,
            for: indexPath
        ) as? PostTableViewCell else {
            fatalError("Error")
        }
        
        cell.configPost(post: data[indexPath.row])
        
        return cell
    }
    func tableView1(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CellReuseID.photos.rawValue,
            for: indexPath
        ) as? PhotosTableViewCell else {
            fatalError("Error")
        }
        
        return cell
    }
}
 // MARK: - UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int
    ) -> CGFloat {
        return 220
    }
    
    func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int
    ) -> UIView? {
        let tableView1 = ProfileHeaderView()
        tableView1.backgroundColor = UIColor.white
        return tableView1
    }
}
