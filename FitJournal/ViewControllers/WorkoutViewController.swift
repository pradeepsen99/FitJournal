//
//  WorkoutViewController.swift
//  FitJournal
//
//  Created by Pradeep Kumar on 5/29/19.
//  Copyright © 2019 Pradeep Kumar. All rights reserved.
//

import UIKit
import CoreData

class WorkoutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var plusButton: UIBarButtonItem? = nil
    var addWorkoutButton: UIBarButtonItem? = nil
    //var displayArray = ["Chest Day","Back Day","Bicep Day"]
    var myTableView: UITableView!
    
    var workout: [NSManagedObject] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Code to check if it is the first time running. If it is the first time code is executed then
        //add a sample workout to fill in data-type
        let firstRun = UserDefaults.standard.bool(forKey: "firstRun") as Bool
        if !firstRun {
            //firstTimeRun()
            UserDefaults.standard.set(true, forKey: "firstRun")
        }
        
        self.navigationController?.navigationBar.topItem?.title = "Workout"
        
        plusButton = UIBarButtonItem.init(
            image: UIImage(named: "plus.png")?.withRenderingMode(.alwaysTemplate),
            style: .plain,
            target: self,
            action: #selector(plusButtonClick)
        )
        
        addWorkoutButton = UIBarButtonItem.init(
            image: UIImage(named: "icons8-exercise-filled-24")?.withRenderingMode(.alwaysTemplate),
            style: .plain,
            target: self,
            action: #selector(workoutButtonClick)
        )
        
        self.navigationItem.leftBarButtonItem = plusButton
        self.navigationItem.rightBarButtonItem = addWorkoutButton
        tableSetup()
        arraySetup()
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
        NSFetchRequest<NSManagedObject>(entityName: "Workout")
      
      //3
      do {
        workout = try managedContext.fetch(fetchRequest)
      } catch let error as NSError {
        print("Could not fetch. \(error), \(error.userInfo)")
      }
    }
    
    func arraySetup(){
        //let workoutData = UserDefaults.standard.data(forKey: "savedWorkouts")
        //let workoutArr = try! JSONDecoder().decode([Workout].self, from: workoutData!)
        //TOOD fix error with first time running.
        //displayArray.append(workoutArr[0].name)
        myTableView.reloadData()
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
        return workout.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.textLabel!.text = workout[indexPath.row].value(forKeyPath: "name") as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewWorkout()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func save(name: String) {
          guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
            return
          }
          
          // 1
          let managedContext =
            appDelegate.persistentContainer.viewContext
          
          // 2
          let entity =
            NSEntityDescription.entity(forEntityName: "Workout",
                                       in: managedContext)!
          
          let work = NSManagedObject(entity: entity,
                                       insertInto: managedContext)
          
          // 3
          work.setValue(name, forKeyPath: "name")
          
          // 4
          do {
            try managedContext.save()
            workout.append(work)
          } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
          }
    }
}

extension WorkoutViewController{
    
    @objc func plusButtonClick(){
        let alert = UIAlertController(title: "New Workout", message: "Type in the name of the new workout!", preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "Add Workout", style: .default) { (addWorkoutDialogClick) in
            let textField = alert.textFields![0] as UITextField
            //self.displayArray.append(textField.text!)
            self.save(name: textField.text!)
            self.myTableView.reloadData()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addTextField { (textField) in
            textField.placeholder = "Chest Day, Back Day, Leg Day, etc..."
        }
        alert.addAction(cancel)
        alert.addAction(action)
        self.present(alert, animated:true, completion: nil)
    }
    
    @objc func workoutButtonClick(){
        
    }
    
    func viewWorkout() {
        navigationController?.pushViewController(WorkoutEditViewController(), animated: true)
    }
}
