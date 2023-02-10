//
//  ViewController.swift
//  Midterm_2022
//
//  Created by Niravkumar Savsani on 2022-03-10.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var txtName: UITextField!
    
    
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        
        if(txtName.text!.isEmpty){
            Toast.ok(view: self, title: "Opps!", message: "Please enter your name", handler: nil)
            
            return false
        }
        
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == Segue.toStudentListView)
        {
            let studentListViewController = segue.destination as! StudentListViewController
            
            studentListViewController.userName = txtName.text!
        }
    }
    
    
    @IBAction func btnSubmit(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

