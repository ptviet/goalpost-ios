
import UIKit

class GoalCell: UITableViewCell {

  // Outlets
  @IBOutlet weak var goalDescLbl: UILabel!
  @IBOutlet weak var typeDescLbl: UILabel!
  @IBOutlet weak var progressLbl: UILabel!
  @IBOutlet weak var completionView: UIView!
  
  func configureCell(goal: Goal) {
    self.goalDescLbl.text = goal.goalDescription
    self.typeDescLbl.text = goal.goalType
    self.progressLbl.text = String(describing: goal.goalProgress)
    
    if goal.goalProgress == goal.goalCompletionValue {
      self.completionView.isHidden = false
    } else {
      self.completionView.isHidden = true
    }
  }
  
}
