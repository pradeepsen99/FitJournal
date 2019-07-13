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
    private let myArray: NSArray = ["First","Second","Third"]
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
        let displayHeight: CGFloat = self.view.frame.height
        
        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        self.view.addSubview(myTableView)
    }
    
    
}

extension WorkoutViewController{
    @objc func plusButtonClick(){
        
    }
    
    @objc func workoutButtonClick(){
        
    }
}
