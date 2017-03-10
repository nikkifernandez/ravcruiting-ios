//
//  InterviewInformationCell.swift
//  Ravcruiting
//
//  Created by Nikki Fernandez on 10/03/2017.
//  Copyright © 2017 SourcePad. All rights reserved.
//

import UIKit

class InterviewInformationCell: UITableViewCell {

    @IBOutlet weak var statusLabel: UILabel?
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var notesLabel: UILabel?
    @IBOutlet weak var scoreLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        statusLabel?.font = FontSmallBoldText
        statusLabel?.textColor = UIColor.white
        statusLabel?.backgroundColor = ColorThemeGray
        statusLabel?.textAlignment = .center
        statusLabel?.layer.cornerRadius = 5.0
        statusLabel?.clipsToBounds = true
        
        nameLabel?.font = FontBoldText
        nameLabel?.textColor = ColorThemeGray
        
        notesLabel?.font = FontRegularText
        notesLabel?.textColor = ColorThemeGray
        
        scoreLabel?.font = FontSmallBoldText
        scoreLabel?.textColor = ColorThemeBlue
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureInterviewInformationCell(interview: NSDictionary) {
        
        // Status
        statusLabel?.text = interview.object(forKey: "status") as! String?
        statusLabel?.sizeToFit()
        var statusFrame = statusLabel?.frame
        statusFrame?.size.width = (statusFrame?.size.width)! + 15.0
        statusLabel?.frame = statusFrame!
        
        // Name
        nameLabel?.text = interview.object(forKey: "interviewer") as! String?
        nameLabel?.sizeToFit()
        
        var nameFrame = nameLabel?.frame
        nameFrame?.origin.x = (statusLabel?.frame.origin.x)! + (statusLabel?.frame.size.width)! + 10.0
        nameLabel?.frame = nameFrame!
        
        // Notes
        let notes = interview.object(forKey: "notes") as! String?
        var notesFrame = notesLabel?.frame
        let height = Utilities.heightForView(text: notes!, font: (notesLabel?.font)!, width: (notesLabel?.frame.size.width)!)
        notesFrame?.size.height = height
        notesLabel?.text = notes
        notesLabel?.frame = notesFrame!
        
        // Score
        let score = (interview.object(forKey: "score") as! String?)!
        scoreLabel?.text = "Score: \(score)"
        var scoreFrame = scoreLabel?.frame
        scoreFrame?.origin.y = (notesFrame?.origin.y)! + (notesFrame?.size.height)! + 5.0
        scoreLabel?.frame = scoreFrame!
    }
}
