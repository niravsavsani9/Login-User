//
//  student.swift
//  Midterm_2022
//
//  Created by Niravkumar Savsani on 2022-03-17.
//

import Foundation

class Student{
    static private var idGenerator : Int = 0 ;
    
    public var id : Int = 0;
    public var name : String = "";
    
    static func getNextId() -> Int {
        
        Student.idGenerator += 1
        return Student.idGenerator
    }
    
    //Constructor
    init(id : Int = 0, name : String = ""){
        
        
        
        self.id = id
        self.name = name
    }
}
