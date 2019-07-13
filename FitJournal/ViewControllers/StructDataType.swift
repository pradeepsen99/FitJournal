//
//  StructDataType.swift
//  FitJournal
//
//  Created by Pradeep Kumar on 7/13/19.
//  Copyright © 2019 Pradeep Kumar. All rights reserved.
//

class Exercise {
    var name = ""
    var id = 0
    var musclesWorked = [String]()
    var equipment = ""
    var notes = ""
    
}

class Workout {
    var name = ""
    var id = 0
    var exercises = [Exercise]()
    
}
