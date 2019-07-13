//
//  WorkoutViewController.swift
//  FitJournal
//
//  Created by Pradeep Kumar on 5/29/19.
//  Copyright © 2019 Pradeep Kumar. All rights reserved.
//

import UIKit

class WorkoutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(myArray[indexPath.row])"
        return cell
    }
    
    
    var plusButton: UIBarButtonItem? = nil
    var addWorkoutButton: UIBarButtonItem? = nil
    private let myArray: NSArray = ["Chest Day","Back Day","Bicep Day"]
    private var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height * 2
        
        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        self.view.addSubview(myTableView)
    }
    
    
}

extension WorkoutViewController{
    @objc func plusButtonClick(){
        let alert = UIAlertController(title: "New Workout", message: "Type in the name of the new workout!", preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "Add Workout", style: .default) { (addWorkoutDialogClick) in
            let textField = alert.textFields![0] as UITextField
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addTextField { (textField) in
            textField.placeholder = "Chest Day, Back Day, Leg Day, etc..."
        }
        alert.addAction(cancel)
        alert.addAction(action)
        self.present(alert, animated:true, completion: nil)
    }
    
    @objc func addWorkoutDialogClick(){
        
    }
    
    @objc func workoutButtonClick(){
        
    }
}
