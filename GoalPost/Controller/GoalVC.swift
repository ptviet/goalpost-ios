
import UIKit

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class GoalVC: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  var goals = [Goal]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.isHidden = false
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    fetchCoreDataObjects()
  }
  
  @IBAction func onAddGoalBtnPressed(_ sender: Any) {
    guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "createGoalVC") else { return }
    presentDetail(createGoalVC)
  }
  
  func fetchCoreDataObjects() {
    self.fetch { (success) in
      if success {
        if goals.count > 0 {
          tableView.isHidden = false
        } else {
          tableView.isHidden = true
        }
      }
    }
    self.tableView.reloadData()
  }
  
}

