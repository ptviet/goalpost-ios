
import UIKit

class CreateGoalVC: UIViewController {
  
  @IBOutlet weak var goalTxtView: UITextView!
  @IBOutlet weak var shortTermBtn: UIButton!
  @IBOutlet weak var longTermBtn: UIButton!
  @IBOutlet weak var nextBtn: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  @IBAction func onNextBtnPressed(_ sender: Any) {
    
  }
  
  @IBAction func onShortTermBtnPressed(_ sender: Any) {
  
  }
  
  @IBAction func onLongTermBtnPressed(_ sender: Any) {
    
  }
  
  @IBAction func onBackBtnPressed(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  
}
