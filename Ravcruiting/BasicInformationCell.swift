//
//  BasicInformationCell.swift
//  Ravcruiting
//
//  Created by Nikki Fernandez on 09/03/2017.
//  Copyright © 2017 SourcePad. All rights reserved.
//

import UIKit

class BasicInformationCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // Pass model
    func configureBasicInformationCell(candidate: CandidateDM) {
        infoLabel.font = FontListMainText
        infoLabel.text = "\(candidate.basicInformation)"
        infoLabel.textColor = ColorThemeGray
        
        photoImageView.image = UIImage(named: "img-default-photo")
    }

}
