
import UIKit
import CoreData

extension GoalVC: UITableViewDelegate, UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return goals.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell", for: indexPath) as? GoalCell
      else { return UITableViewCell() }
    let goal = goals[indexPath.row]
    cell.configureCell(goal: goal)
    return cell
  }
  
  func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return true
  }
  
  func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
    return UITableViewCell.EditingStyle.none
  }
  
  func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
    let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath) in
      self.removeGoal(atIndexPath: indexPath)
      self.goals.remove(at: indexPath.row)
      tableView.deleteRows(at: [indexPath], with: .automatic)
      self.fetchCoreDataObjects()
      
    }
    deleteAction.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
    
    let addAction = UITableViewRowAction(style: .normal, title: "+1") { (rowAction, indexPath) in
      self.setProgress(atIndexPath: indexPath)
      tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    addAction.backgroundColor = #colorLiteral(red: 0.4274509804, green: 0.737254902, blue: 0.3882352941, alpha: 1)
    
    return [deleteAction, addAction]
  }
  
}

extension GoalVC {
  func fetch(completion: (_ finished: Bool) -> ()) {
    guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Goal")
    do {
      goals = try (managedContext.fetch(fetchRequest) as? [Goal])!
      completion(true)
    } catch {
      debugPrint("Could not fetch: \(error)")
      completion(false)
    }
  }
  
  func removeGoal(atIndexPath indexPath: IndexPath) {
    guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
    managedContext.delete(goals[indexPath.row])
    do {
      try managedContext.save()
    } catch {
      debugPrint("Could not remove: \(error)")
    }
    
  }
  
  func setProgress(atIndexPath indexPath: IndexPath) {
    guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
    let selectedGoal = goals[indexPath.row]
    if selectedGoal.goalProgress < selectedGoal.goalCompletionValue {
      selectedGoal.goalProgress += 1
      
      do {
        try managedContext.save()
      } catch {
        debugPrint("Could not set progress: \(error)")
      }
      
    } else {
      return
    }
    
  }
  
}
