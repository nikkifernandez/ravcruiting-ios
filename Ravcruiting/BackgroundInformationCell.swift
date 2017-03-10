//
//  BackgroundInformationCell.swift
//  Ravcruiting
//
//  Created by Nikki Fernandez on 09/03/2017.
//  Copyright © 2017 SourcePad. All rights reserved.
//

import UIKit

class BackgroundInformationCell: UITableViewCell {

    @IBOutlet weak var infoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureBackgroundInformationCell(candidate: CandidateDM) {
        infoLabel.font = FontRegularText
        infoLabel.text = "\(candidate.backgroundInformation)"
        infoLabel.textColor = ColorThemeGray
        
        // Adjust frame
        let height = Utilities.heightForView(text: "\(candidate.backgroundInformation)", font: FontRegularText!, width: infoLabel.frame.size.width)
        var newFrame = infoLabel.frame
        newFrame.size.height = height
        infoLabel.frame = newFrame
    }

}
