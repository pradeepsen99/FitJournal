//
//  ExerciseEditViewController.swift
//  FitJournal
//
//  Created by Pradeep Kumar on 7/19/19.
//  Copyright © 2019 Pradeep Kumar. All rights reserved.
//

import Eureka

class ExerciseEditViewController : FormViewController {
    //let currExercise = Exercise(from: Decoder);
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Edit Exercise";
        
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
                    row.placeholder = "Enter text here"
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
            +++ Section("Muscles Worked")
                <<< TextRow(){ row in
                    row.title = "Muscle Group"
                    row.placeholder = "Enter text here"
                    row.tag = "Muscle Group"
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
