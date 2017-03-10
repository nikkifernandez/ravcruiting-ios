//
//  TagsInformationCell.swift
//  Ravcruiting
//
//  Created by Nikki Fernandez on 09/03/2017.
//  Copyright © 2017 SourcePad. All rights reserved.
//

import UIKit

class TagsInformationCell: UITableViewCell {

    @IBOutlet weak var fieldLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        fieldLabel.font = FontBoldText
        fieldLabel.textColor = ColorThemeDarkText
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureTagsInformationCell(candidate: CandidateDM, tag: Int) {
        
        var strArray: [String] = []
        var bgColor : UIColor?
        
        if tag==ProfileTags.skills.rawValue {
            fieldLabel.text = "Skills"
            bgColor = ColorThemeYellow
            strArray = candidate.skills
        }
        else {
            fieldLabel.text = "Interests"
            bgColor = ColorThemeGreen
            strArray = candidate.interests
        }
        
        var xPos: Double = 20.0
        var yPos: Double = 30.0
        let height: Double = 25.0
        let offset: Double = 5.0
        
        for i in 0...(strArray.count-1) {
            let lbl = UILabel(frame: CGRect(x: xPos, y: yPos, width: 100.0, height: height))
            lbl.font = FontRegularText
            lbl.textColor = ColorThemeGray
            lbl.backgroundColor = bgColor
            lbl.clipsToBounds = true
            lbl.layer.cornerRadius = 5.0
            lbl.textAlignment = .center
            lbl.text = strArray[i]
            
            // Resize
            var frame = lbl.frame
            lbl.sizeToFit()
            frame.size.width = (lbl.frame.size.width + 10.0)
            
            if (xPos + Double(frame.size.width)) > Double(self.frame.size.width)-20.0 {
                yPos += (height + offset)
                xPos = 20.0
                frame.origin.x = CGFloat(xPos)
                frame.origin.y = CGFloat(yPos)
            }
            
            lbl.frame = frame
            
            self.addSubview(lbl)
            xPos += Double(lbl.frame.size.width) + offset
        }
    }

}
