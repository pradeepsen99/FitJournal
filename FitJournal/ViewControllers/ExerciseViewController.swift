//
//  ExerciseViewController.swift
//  FitJournal
//
//  Created by Pradeep Kumar on 7/12/19.
//  Copyright © 2019 Pradeep Kumar. All rights reserved.
//

import UIKit
import CoreData

class ExerciseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var myTableView: UITableView!
    var settingsButton: UIBarButtonItem? = nil
    var current_exercise = "";
    var exercise: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.topItem?.title = "Exercises"
        
        settingsButton = UIBarButtonItem.init(
            image: UIImage(named: "plus.png")?.withRenderingMode(.alwaysTemplate),
            style: .plain,
            target: self,
            action: #selector(addExerciseButtonClick)
        )
        
        self.navigationItem.rightBarButtonItem = settingsButton
        
        tableSetup()
    }
    
    func tableSetup(){
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height * 2
        
        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        self.view.addSubview(myTableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercise.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.textLabel!.text = exercise[indexPath.row].value(forKeyPath: "name") as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        current_exercise = exercise[indexPath.row].value(forKeyPath: "name") as! String
        viewExercise()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          
          //1
          guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
              return
          }
          
          let managedContext =
            appDelegate.persistentContainer.viewContext
          
          //2
          let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Exercise")
          
          //3
          do {
            exercise = try managedContext.fetch(fetchRequest)
          } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
          }
    }
    
    //Saves the string into coreData as a new exercise instance
    func save(name: String) {
          guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
            return
          }

          let managedContext = appDelegate.persistentContainer.viewContext

          let entity = NSEntityDescription.entity(forEntityName: "Exercise", in: managedContext)!
          
          let work = NSManagedObject(entity: entity, insertInto: managedContext)
          work.setValue(name, forKeyPath: "name")

          do {
            try managedContext.save()
            exercise.append(work)
          } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
          }
    }
}

extension ExerciseViewController{
    @objc func addExerciseButtonClick(){
        let alert = UIAlertController(title: "New Exercise", message: "Type in the name of the new exercise!", preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "Add Exercise", style: .default) { (addExerciseDialogClick) in
            let textField = alert.textFields![0] as UITextField
            self.save(name: textField.text!)
            self.myTableView.reloadData()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addTextField { (textField) in
            textField.placeholder = "Bench Press, Deadlift, etc..."
        }
        alert.addAction(cancel)
        alert.addAction(action)
        self.present(alert, animated:true, completion: nil)
    }
    
    
    func viewExercise() {
        navigationController?.pushViewController(ExerciseEditViewController(exercise: current_exercise), animated: true)
    }

}

