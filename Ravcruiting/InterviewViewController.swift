//
//  InterviewViewController.swift
//  Ravcruiting
//
//  Created by Nikki Fernandez on 09/03/2017.
//  Copyright © 2017 SourcePad. All rights reserved.
//

import UIKit

enum InterviewSections: Int {
    case status, record, notes, score, count
}

class InterviewViewController: UITableViewController {

    var candidate:CandidateDM?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(CustomFieldCell.self, forCellReuseIdentifier: "CustomFieldCell")
        tableView.separatorStyle = .none
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return InterviewSections.count.rawValue
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case InterviewSections.status.rawValue:
            return 40.0
        case InterviewSections.notes.rawValue:
            return 210.0
        case InterviewSections.record.rawValue:
            return 60.0
        default:
            return 130.0
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section==InterviewSections.count.rawValue-1 {
            return 50.0
        }
        return 0.0
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        if section==InterviewSections.count.rawValue-1 {
            let v = UIView.init(frame: CGRect.zero)
            
            let padding: CGFloat = 40.0
            let width: CGFloat = ScreenWidth-(padding*2)
            let height: CGFloat = 40.0
            
            let submitButton = UIButton.init(type: .custom)
            submitButton.frame = CGRect(x: padding, y: 0.0, width: width, height: height)
            submitButton.backgroundColor = ColorThemePink
            submitButton.layer.cornerRadius = height/2
            submitButton.setTitle("Submit", for: .normal)
            submitButton.titleLabel?.font = FontButtonText
            submitButton.addTarget(self, action: #selector(submitButtonAction), for: .touchUpInside)
            
            v.addSubview(submitButton)
            
            return v
        }
        return nil
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "CustomFieldCell", for: indexPath) as? CustomFieldCell)!
        cell.parent = self
        cell.configureBasicInformationCell(candidate: candidate!, idx: indexPath.section)
        return cell
    }

    
    // MARK: - Button Actions
    func submitButtonAction() {
        _ = self.navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK: - Cell Actions
    /*func selectInterviewerAction() {
        print("Select interviewer")
    }
    
    func selectStatusAction() {
        print("Select interviewer")
    }*/
    
    func scoreAction(score: Int) {
        
    }
    
    // MARK: -
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
