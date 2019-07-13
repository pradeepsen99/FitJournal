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
            action: #selector(mealsButtonClick)
        )
        
        self.navigationItem.rightBarButtonItem = settingsButton
    }
    
    
}

extension ExerciseViewController{
    @objc func mealsButtonClick(){
        
    }
}

