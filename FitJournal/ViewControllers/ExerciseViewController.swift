//
//  ExerciseViewController.swift
//  FitJournal
//
//  Created by Pradeep Kumar on 7/12/19.
//  Copyright © 2019 Pradeep Kumar. All rights reserved.
//

import UIKit

class ExerciseViewController: UIViewController {
    
    var settingsButton: UIBarButtonItem? = nil
    
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
    }
    
    
}

extension ExerciseViewController{
    @objc func addExerciseButtonClick(){
        let alert = UIAlertController(title: "New Exercise", message: "Type in the name of the new exercise!", preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "Add Exercise", style: .default) { (addWorkoutDialogClick) in
            let textField = alert.textFields![0] as UITextField
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addTextField { (textField) in
            textField.placeholder = "Bench Press, Deadlift, etc..."
        }
        alert.addAction(cancel)
        alert.addAction(action)
        self.present(alert, animated:true, completion: nil)
    }
}

