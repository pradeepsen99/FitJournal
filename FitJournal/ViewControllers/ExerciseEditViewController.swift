//
//  ExerciseEditViewController.swift
//  FitJournal
//
//  Created by Pradeep Kumar on 7/19/19.
//  Copyright © 2019 Pradeep Kumar. All rights reserved.
//

import Eureka

class ExerciseEditViewController : FormViewController {
    var current_exercise = ""
    
    init(exercise: String) {
        current_exercise = exercise
        super.init(nibName: nil, bundle: nil)
    }
    //Required function -- Forced to add
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = current_exercise
        
        //Using Eurekas form builder
        /*
         VARIABLES USED
         var name = ""
         var id = 0
         var type = ""
         var musclesWorked : [Muscles]?
         var equipment : Equipment?
         var notes = ""
         var oneRM = 0
         var numberOfSets = 0
         var numofReps = 0
         */
        form
            +++ Section("Information")
                <<< TextRow(){ row in
                    row.title = "Name"
                    row.placeholder = "Enter exercise name"
                    row.baseValue = current_exercise
                    row.tag = "Name"
                    }.onChange {_ in
                        let row: TextRow? = self.form.rowBy(tag: "Name")
                        let value = row?.value
                        //currExercise.name = value;
                        self.navigationItem.title = value;
                    }
                <<< TextRow(){ row in
                    row.title = "Type"
                    row.placeholder = "Enter text here"
                    row.tag = "Type"
                    }.onChange {_ in
                        let row: TextRow? = self.form.rowBy(tag: "Type")
                        let value = row?.value
                        self.navigationItem.title = value;
                    }
            +++ MultivaluedSection(multivaluedOptions: [.Reorder, .Insert, .Delete],
                               header: "Muscle Groups",
                               footer: "Adds muscle groups. To add more click on 'Add new Muscle Group'") {
                $0.addButtonProvider = { section in
                    return ButtonRow(){
                        $0.title = "Add New Muscle Group"
                    }
                }
                $0.multivaluedRowToInsertAt = { index in
                    return NameRow() {
                        $0.placeholder = "Muscle Group Name"
                    }
                }
                $0 <<< NameRow() {
                    $0.placeholder = "Muscle Group Name"
                }
            }
        
            +++ Section("Personal Notes")
                <<< TextAreaRow("Personal Notes") { row in
                        //Row setup

                    }.cellSetup({ (cell, row) in
                        cell.textView.scrollRangeToVisible(NSMakeRange(cell.textView.text.count - 1, 1))
                    }).onChange({ (row) in
                         //Your Change logic

                         row.cell.textView.scrollRangeToVisible(NSMakeRange(row.cell.textView.text.count - 1, 1))
                    })
        
        
        //let valuesDictionary = form.values();
    }
}
