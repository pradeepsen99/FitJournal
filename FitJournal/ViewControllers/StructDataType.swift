//
//  StructDataType.swift
//  FitJournal
//
//  Created by Pradeep Kumar on 7/13/19.
//  Copyright © 2019 Pradeep Kumar. All rights reserved.
//

struct Muscles : Codable{
    var name = ""
    var exercises = [Exercise]()
    
    init(nameInput: String, exercisesInput: [Exercise]) {
        name = nameInput
        exercises = exercisesInput
    }
}

struct Exercise : Codable{
    var name = ""
    var id = 0
    var type = ""
    var musclesWorked : [Muscles]?
    var equipment : Equipment?
    var notes = ""
    var oneRM = 0
    var numberOfSets = 0
    var numofReps = 0
    
    init(nameInput: String, idInput: Int, typeInput: String, musclesWorkedInput: [Muscles], equipmentInput: Equipment, notesInput: String, oneRMInput: Int, numberOfSetsInput: Int, numOfRepsInput: Int) {
        
        name = nameInput
        id = idInput
        type = typeInput
        musclesWorked = musclesWorkedInput
        equipment = equipmentInput
        notes = notesInput
        oneRM = oneRMInput
        numberOfSets = numberOfSetsInput
        numofReps = numOfRepsInput
        
    }
}

struct Equipment : Codable {
    var name = ""
    var id = 0
    
    init(nameInput: String, idInput: Int) {
        name = nameInput
        id = idInput
    }
}

struct Workout : Codable {
    var name = "test"
    var id = 0
    var exercises : [Exercise]?
    var numberOfAttempts = 0
    var notes = ""
    
    init(nameInput: String, idInput: Int, exercisesInput: [Exercise], numberOfAttemptsInput: Int, notesInput: String){
        name = nameInput
        id = idInput
        exercises = exercisesInput
        numberOfAttempts = numberOfAttemptsInput
        notes = notesInput
    }
}

struct Date : Codable {
    var year = 0
    var month = 0
    var day = 0
    var hour = 0
    var minute = 0
    var second = 0
    
    init (yearInput: Int, monthInput: Int, dayInput: Int, hourInput: Int, minuteInput: Int, secondInput: Int){
        year = yearInput
        month = monthInput
        day  = dayInput
        hour = hourInput
        minute = minuteInput
        second = secondInput
    }
}

struct WorkoutLog : Codable {
    var workout : Workout?
    var timeSpentMinutes = 0.0
    var startTime : Date?
    var endTime : Date?
    var uniqueID = 0
    
    init(workoutInput: Workout, timeSpentMinInput: Double, startTimeInput: Date, endTimeInput: Date, uniqueIDInput: Int) {
        workout = workoutInput
        timeSpentMinutes = timeSpentMinInput
        startTime = startTimeInput
        endTime = endTimeInput
        uniqueID = uniqueIDInput
    }
}
