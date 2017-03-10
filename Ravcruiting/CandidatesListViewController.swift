//
//  CandidatesListViewController.swift
//  Ravcruiting
//
//  Created by Nikki Fernandez on 08/03/2017.
//  Copyright © 2017 SourcePad. All rights reserved.
//

import UIKit

class CandidatesListViewController: UITableViewController, CandidateControllerDelegate {

    var candidates: NSMutableArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let candidate1 = CandidateDM.sampleCandidate()
        candidates = NSMutableArray(array: [candidate1])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Sample candidate
        let candidate = (candidates?.object(at: indexPath.row) as? CandidateDM)!
        
        // Name
        let cell = tableView.dequeueReusableCell(withIdentifier: "CandidateCell", for: indexPath)
        cell.textLabel?.text = "\(candidate.firstName) \(candidate.lastName)"
        cell.textLabel?.font = FontListMainText
        cell.textLabel?.textColor = ColorThemeDarkText
        
        // Status and position
        let subAttrString = NSMutableAttributedString()
        let position = NSAttributedString(string: "\(candidate.position)", attributes: [NSForegroundColorAttributeName: ColorThemePink, NSFontAttributeName: FontListBoldSubText! as UIFont])
        let status = NSAttributedString(string: "   \(candidate.applicationStatus) by \(candidate.interviewer)", attributes: [NSForegroundColorAttributeName: ColorThemeDarkText, NSFontAttributeName: FontListSubText! as UIFont])
        
        subAttrString.append(position)
        subAttrString.append(status)
        cell.detailTextLabel?.attributedText = subAttrString
        
        return cell
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let indexPath:NSIndexPath = self.tableView.indexPathForSelectedRow! as NSIndexPath
        let row = indexPath.row
        
        let vc = segue.destination as? ProfileViewController
        vc?.candidate = candidates?.object(at: row) as? CandidateDM!
    }
    
    // MARK: - Candidate Controller Delegate
    func didGetCandidates(candidates: [CandidateDM]) {
         
    }
}
