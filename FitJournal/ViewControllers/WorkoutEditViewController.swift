//
//  WorkoutEditViewController.swift
//  FitJournal
//
//  Created by Pradeep Kumar on 7/19/19.
//  Copyright © 2019 Pradeep Kumar. All rights reserved.
//

import Eureka

class WorkoutEditViewController : FormViewController {
    
     var current_workout:String = ""
    
    init(workout: String) {
        current_workout = workout
        super.init(nibName: nil, bundle: nil)
    }
    //Required function -- Forced to add
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = current_workout
        
        form +++ Section("Information")
            <<< TextRow(){ row in
                row.title = "Name"
                row.placeholder = current_workout
                row.tag = "Name"
                }.onChange {_ in
                    let row: TextRow? = self.form.rowBy(tag: "Name")
                    let value = row?.value
                    self.navigationItem.title = value;
                }
    }
    
}
