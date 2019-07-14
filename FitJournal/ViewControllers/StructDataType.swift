//
//  StructDataType.swift
//  FitJournal
//
//  Created by Pradeep Kumar on 7/13/19.
//  Copyright © 2019 Pradeep Kumar. All rights reserved.
//

struct Exercise {
    var name = ""
    var id = 0
    var type = ""
    var musclesWorked = [String]()
    var equipment = ""
    var notes = ""
    var oneRM = 0
    var numberOfSets = 0
    var numofReps = 0
}

class Workout : Codable{
    init(){
        name = "test"
        
    }
    var name = "test"
    var id = 0
    //var exercises = [Exercise]()
    var numberOfAttempts = 0
    var timeTaken = 0
    var notes = ""
}
