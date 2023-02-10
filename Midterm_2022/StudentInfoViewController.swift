//
//  StudentInfoViewController.swift
//  Midterm_2022
//
//  Created by Niravkumar Savsani on 2022-03-10.
//

import UIKit

class StudentInfoViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    
    
    @IBOutlet weak var btnDelete: UIButton!
    
    public var editMode : Bool = false
    
    //student? is optional it can be new or its mostly new
    public var selectedStudent : Student?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if editMode{ //edit mode means update or delete
            btnDelete.isHidden = false
            title = "Updating student"
            txtName.text = selectedStudent!.name
        }else {
            btnDelete.isHidden = true
            title = "Inserting new student"
        }
        
    }
   
    
    @IBAction func btnDeleteTouchUp(_ sender: Any) {
        studentProvider.deleteStudent(id: selectedStudent!.id)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnSave(_ sender: Any) {
        
        if let studentName = txtName.text{
            if studentName.count<3{
                print("Please enter student valid name!...")
                return
            }
            if editMode{
                selectedStudent?.name = studentName
                studentProvider.updateStudent(student: selectedStudent!)
            }else{
                //insert a new student
                let newStudent = Student()
                newStudent.id = Student.getNextId()
                newStudent.name = studentName
                
                studentProvider.addStudent(student: newStudent)
                
                
            }
            navigationController?.popViewController(animated: true)
            
        }else{
            print("Invalid student!....")
        }

    }
    
}
