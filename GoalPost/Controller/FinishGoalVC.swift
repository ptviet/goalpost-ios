
import UIKit

class FinishGoalVC: UIViewController, UITextFieldDelegate {
  
  // Outlets
  @IBOutlet weak var createGoalBtn: UIButton!
  @IBOutlet weak var pointTxtField: UITextField!
  
  var goalDescription: String!
  var goalType: GoalType!
  
  override func viewDidLoad() {
    super.viewDidLoad()
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
    
  }
  
  @IBAction func onBackBtnPressed(_ sender: Any) {
    dismissDetail()
  }
  
}
