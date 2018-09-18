
import UIKit

class GoalCell: UITableViewCell {

  @IBOutlet weak var goalDescLbl: UILabel!
  @IBOutlet weak var typeDescLbl: UILabel!
  @IBOutlet weak var progressLbl: UILabel!
  
  func configureCell(desc: String, type: GoalType, progressAmount: Int) {
    self.goalDescLbl.text = desc
    self.typeDescLbl.text = type.rawValue
    self.progressLbl.text = String(describing: progressAmount)
    
  }
  
}
