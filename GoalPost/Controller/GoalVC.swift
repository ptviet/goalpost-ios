
import UIKit

class GoalVC: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.isHidden = false
  }

  @IBAction func onAddGoalBtnPressed(_ sender: Any) {
    
  }
  
}

