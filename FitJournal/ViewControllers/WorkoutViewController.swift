//
//  WorkoutViewController.swift
//  FitJournal
//
//  Created by Pradeep Kumar on 5/29/19.
//  Copyright © 2019 Pradeep Kumar. All rights reserved.
//

import UIKit

class WorkoutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var plusButton: UIBarButtonItem? = nil
    var addWorkoutButton: UIBarButtonItem? = nil
    var displayArray = ["Chest Day","Back Day","Bicep Day"]
    var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Code to check if it is the first time running. If it is the first time code is executed then
        //add a sample workout to fill in data-type
        let firstRun = UserDefaults.standard.bool(forKey: "firstRun") as Bool
        if !firstRun {
            firstTimeRun()
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
    
    func firstTimeRun(){
        
        //Init exercise array
        //let benchPress = Exercise.init("Bench Press", 0, "Strength", )
        //benchPress.name = "Bench Press"
        
        //let squat = Exercise.init()
        
        //let workoutSample = Workout.init()
        
        var workoutArr = [Workout]()
        //workoutArr.append(workoutSample)
        
        let workoutData = try! JSONEncoder().encode(workoutArr)
        UserDefaults.standard.set(workoutData, forKey: "savedWorkouts")
    }
    
    func firstTimeEquipmentRun() {
        
    }
    
    func firstTimeExerciseRun() {
        
    }
    
    func firstTimeMuscleRun() {
        
    }
    
    
    
    func arraySetup(){
        let workoutData = UserDefaults.standard.data(forKey: "savedWorkouts")
        let workoutArr = try! JSONDecoder().decode([Workout].self, from: workoutData!)
        displayArray.append(workoutArr[0].name)
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
        return displayArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(displayArray[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewWorkout()
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension WorkoutViewController{
    
    @objc func plusButtonClick(){
        let alert = UIAlertController(title: "New Workout", message: "Type in the name of the new workout!", preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "Add Workout", style: .default) { (addWorkoutDialogClick) in
            let textField = alert.textFields![0] as UITextField
            self.displayArray.append(textField.text!)
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
