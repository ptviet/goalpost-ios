
import UIKit

class CreateGoalVC: UIViewController {
  
  @IBOutlet weak var goalTxtView: UITextView!
  @IBOutlet weak var shortTermBtn: UIButton!
  @IBOutlet weak var longTermBtn: UIButton!
  @IBOutlet weak var nextBtn: UIButton!
  
  var goalType: GoalType = .shortTerm
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let hideKeyboard = UITapGestureRecognizer(target: self, action: #selector(toggleKeyboard))
    view.addGestureRecognizer(hideKeyboard)
    
    nextBtn.bindToKeyboard()
    shortTermBtn.setSelectedColor()
    longTermBtn.setDeselectedColor()
  }
  
  @objc func toggleKeyboard() {
    view.endEditing(true)
  }
  
  @IBAction func onShortTermBtnPressed(_ sender: Any) {
    goalType = .shortTerm
    shortTermBtn.setSelectedColor()
    longTermBtn.setDeselectedColor()
  }
  
  @IBAction func onLongTermBtnPressed(_ sender: Any) {
    goalType = .longTerm
    shortTermBtn.setDeselectedColor()
    longTermBtn.setSelectedColor()
  }
  
  @IBAction func onNextBtnPressed(_ sender: Any) {
    
  }
  
  @IBAction func onBackBtnPressed(_ sender: Any) {
    dismissDetail()
  }
  
}
