//
//  studentProvider.swift
//  Midterm_2022
//
//  Created by Niravkumar Savsani on 2022-03-17.
//

import Foundation

class studentProvider{
    
    //Select all student
    static var allStudent : [Student] = []
    
    
    //insert a new student
    static func addStudent( student : Student){
        allStudent.append(student)
    }
    
    //update student
    static func updateStudent( student : Student) -> Bool{
        for(index, std) in allStudent.enumerated(){
            if std.id == student.id{
                allStudent[index] = student
                return true
            }
        }
        return false
        
    }
    //delete student
    static func deleteStudent( id : Int) -> Bool{
        for(index, std) in allStudent.enumerated(){
            if std.id ==  id{
                allStudent.remove(at: index)
                return true
            }
        }
        return false
    }
    
    
    
}
