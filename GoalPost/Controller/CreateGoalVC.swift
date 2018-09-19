
import UIKit

class CreateGoalVC: UIViewController, UITextViewDelegate {
  
  // Outlets
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
    goalTxtView.delegate = self
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
    
    if goalTxtView.text != "" && goalTxtView.text != "..." {
      guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "finishGoalVC") as? FinishGoalVC else { return }
      finishGoalVC.initData(goalDescription: self.goalTxtView.text!, goalType: self.goalType)
      presentingViewController?.presentSecondaryDetail(finishGoalVC)
    }
  }
  
  func textViewDidBeginEditing(_ textView: UITextView) {
    if goalTxtView.text == "..." {
      goalTxtView.text = ""
    }
    goalTxtView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
  }
  
  
  @IBAction func onBackBtnPressed(_ sender: Any) {
    dismissDetail()
  }
  
  
}
