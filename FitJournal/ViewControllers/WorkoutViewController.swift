//
//  WorkoutViewController.swift
//  FitJournal
//
//  Created by Pradeep Kumar on 5/29/19.
//  Copyright © 2019 Pradeep Kumar. All rights reserved.
//

import UIKit

class WorkoutViewController: UIViewController {
    
    var plusButton: UIBarButtonItem? = nil
    var addWorkoutButton: UIBarButtonItem? = nil
    
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
            action: #selector(addWorkoutButtonClick)
        )
        
        self.navigationItem.leftBarButtonItem = plusButton
        self.navigationItem.rightBarButtonItem = addWorkoutButton
    }
    
    
}

extension WorkoutViewController{
    @objc func plusButtonClick(){
        
    }
    
    @objc func addWorkoutButtonClick(){
        
    }
}
