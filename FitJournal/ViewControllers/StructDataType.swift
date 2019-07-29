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
}

struct Exercise : Codable{
    var name = ""
    var id = 0
    var type = ""
    var musclesWorked : [String]?
    var equipment : Equipment?
    var notes = ""
    var oneRM = 0
    var numberOfSets = 0
    var numofReps = 0
}

struct Equipment : Codable {
    var name = ""
    var id = 0
}

struct Workout : Codable {
    init(){
        name = "test"
    }
    var name = "test"
    var id = 0
    var exercises : [Exercise]?
    var numberOfAttempts = 0
    var notes = ""
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
}
