
import UIKit
import CoreData

class FinishGoalVC: UIViewController, UITextFieldDelegate {
  
  // Outlets
  @IBOutlet weak var createGoalBtn: UIButton!
  @IBOutlet weak var pointTxtField: UITextField!
  @IBOutlet weak var spinner: UIActivityIndicatorView!
  @IBOutlet weak var errorLbl: UILabel!
  
  var goalDescription: String!
  var goalType: GoalType!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    spinner.isHidden = true
    errorLbl.isHidden = true
    
    pointTxtField.delegate = self
    
    let hideKeyboard = UITapGestureRecognizer(target: self, action: #selector(toggleKeyboard))
    view.addGestureRecognizer(hideKeyboard)
    
    createGoalBtn.bindToKeyboard()
    
  }
  
  func initData(goalDescription: String, goalType: GoalType) {
    self.goalDescription = goalDescription
    self.goalType = goalType
  }
  
  @objc func toggleKeyboard() {
    view.endEditing(true)
  }
  
  @IBAction func onCreateGoalBtnPressed(_ sender: Any) {
    if pointTxtField.text != "" && pointTxtField.text != "0" {
      self.errorLbl.isHidden = true
      self.spinner.isHidden = false
      self.spinner.startAnimating()
      self.save { (success) in
        if success {
          self.errorLbl.isHidden = true
          self.dismiss(animated: true, completion: nil)
        } else {
          self.errorLbl.isHidden = false
        }
        self.spinner.isHidden = true
        self.spinner.stopAnimating()
      }
    } else {
      self.errorLbl.isHidden = false
    }
    
  }
  
  func save(completion: @escaping (_ finished: Bool) -> ()) {
    guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
    let goal = Goal(context: managedContext)
    goal.goalDescription = goalDescription
    goal.goalType = goalType.rawValue
    goal.goalCompletionValue = Int32(pointTxtField.text!)!
    goal.goalProgress = Int32(0)
    
    do {
      try managedContext.save()
      completion(true)
    } catch {
      debugPrint("Could not save: \(error)")
      completion(false)
    }

  }
  
  @IBAction func onBackBtnPressed(_ sender: Any) {
    dismissDetail()
  }
  
}
