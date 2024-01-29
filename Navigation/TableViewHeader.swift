import UIKit

extension UITableView {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = ProfileHeaderView()
            return headerView
        } else {
            return UIView()
        }
    }
}
