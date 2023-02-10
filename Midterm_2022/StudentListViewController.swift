//
//  StudentListViewController.swift
//  Midterm_2022
//
//  Created by Niravkumar Savsani on 2022-03-10.
//

import UIKit

//to get data in table we need two UItable view protocols
class StudentListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    

    @IBOutlet weak var lblNameForList: UILabel!
    
    public var userName : String="";
    
    public var selectedRow : Int = 0
    
    @IBOutlet weak var tabelView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblNameForList.text = userName
        tabelView.delegate = self
        tabelView.dataSource = self
    }
    
    @IBAction func btnRefresh(_ sender: Any) {
        
        tabelView.reloadData()
        
    }
    
    @IBAction func btnAdd(_ sender: Any) {
        
        performSegue(withIdentifier: Segue.toStudentInfoView, sender: nil)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentProvider.allStudent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = studentProvider.allStudent[indexPath.row].name
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedRow = indexPath.row
        
        performSegue(withIdentifier: Segue.toStudentInfoViewEditing, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == Segue.toStudentInfoViewEditing){
            
            let studentInfo = segue.destination as! StudentInfoViewController
            
            //we have to send the selected student to studentInfoViewController
            // first we need to prepare the studentInfoViewController to receive
            // this object
            
            studentInfo.selectedStudent = studentProvider.allStudent[self.selectedRow]
            studentInfo.editMode = true
        }
        
    }
}
