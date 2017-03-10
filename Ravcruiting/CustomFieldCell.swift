//
//  CustomFieldCell.swift
//  Ravcruiting
//
//  Created by Nikki Fernandez on 09/03/2017.
//  Copyright © 2017 SourcePad. All rights reserved.
//

import UIKit

class CustomFieldCell: UITableViewCell, UITextViewDelegate {

    var parent:InterviewViewController?
    
    lazy var fieldLabel: UILabel = {
        let label: UILabel = UILabel(frame: CGRect(x: 15.0, y: 10.0, width: ScreenWidth-30.0, height: 20.0))
        label.font = FontBigText
        label.textColor = ColorThemeDarkText
        return label
    }()
    
    lazy var customView: UIView = {
        let view: UIView = UIView(frame: CGRect(x: 15.0, y: self.fieldLabel.frame.origin.y+self.fieldLabel.frame.size.height+10.0, width: ScreenWidth-30.0, height: 160.0))
        return view
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.clear
        self.selectionStyle = .none
        
        self.contentView.addSubview(self.fieldLabel)
        self.contentView.addSubview(self.customView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureBasicInformationCell(candidate: CandidateDM, idx: Int) {
        
        switch idx {
        case InterviewSections.status.rawValue:
            let attrString = NSMutableAttributedString()
            let status = NSAttributedString(string: "\(candidate.applicationStatus)", attributes: [NSForegroundColorAttributeName: ColorThemeDarkText, NSFontAttributeName: FontBoldText! as UIFont])
            let interviewer = NSAttributedString(string: " by \(candidate.interviewer)", attributes: [NSForegroundColorAttributeName: ColorThemeDarkText, NSFontAttributeName: FontRegularText! as UIFont])
            
            attrString.append(status)
            attrString.append(interviewer)
            fieldLabel.attributedText = attrString
            
        case InterviewSections.record.rawValue:
            fieldLabel.text = ""
            
            var viewFrame = customView.frame
            viewFrame.origin.y = 10.0
            customView.frame = viewFrame
            
            let recordBtn = UIButton(type: .custom)
            recordBtn.frame = CGRect(x: 0.0, y: 0.0, width: 250.0, height: 40.0)
            recordBtn.layer.cornerRadius = 15.0
            recordBtn.backgroundColor = ColorThemeGreen
            recordBtn.setTitle("Start Recording", for: .normal)
            recordBtn.setTitle("Recording...", for: .selected)
            recordBtn.setTitleColor(ColorThemeDarkText, for: .normal)
            recordBtn.titleLabel?.font = FontBoldText
            recordBtn.addTarget(self, action: #selector(recordButtonAction(sender:)), for: .touchUpInside)
            
            let pollyImgView = UIImageView(image: UIImage(named: "polly"))
            pollyImgView.frame = CGRect(x: 10.0, y: 0.0, width: 40.0, height: 40.0)
            recordBtn.addSubview(pollyImgView)
            
            customView.addSubview(recordBtn)
            
        case InterviewSections.notes.rawValue:
            fieldLabel.text = "What are your thoughts about \(candidate.firstName)?"
            
            let textView = UITextView(frame: CGRect(x: 0, y: 0, width: self.customView.frame.size.width, height: self.customView.frame.size.height))
            textView.delegate = self
            textView.backgroundColor = UIColor.white
            textView.font = FontRegularText
            textView.textColor = ColorThemeGray
            textView.layer.cornerRadius = 10.0
            textView.layer.borderColor = ColorThemeDarkText.cgColor
            textView.layer.borderWidth = 1.0
            customView.addSubview(textView)
            
        case InterviewSections.score.rawValue:
            fieldLabel.text = "Do you want him/her to be part of the team?"
            
            let dimension = 45.0
            let offset = 8.0
            var xPos = 0.0
            
            let btn1 = UIButton(type: .custom)
            btn1.frame = CGRect(x: xPos, y: 0.0, width: dimension, height: dimension)
            btn1.setImage(UIImage(named: "btn-1"), for: .normal)
            btn1.setImage(UIImage(named: "btn-1-selected"), for: .selected)
            btn1.addTarget(self, action: #selector(scoreButtonAction(sender:)), for: .touchUpInside)
            btn1.tag = 1
            xPos += (dimension + offset)
            let btn2 = UIButton(type: .custom)
            btn2.frame = CGRect(x: xPos, y: 0.0, width: dimension, height: dimension)
            btn2.setImage(UIImage(named: "btn-2"), for: .normal)
            btn2.setImage(UIImage(named: "btn-2-selected"), for: .selected)
            btn2.addTarget(self, action: #selector(scoreButtonAction(sender:)), for: .touchUpInside)
            btn2.tag = 2
            xPos += (dimension + offset)
            let btn3 = UIButton(type: .custom)
            btn3.frame = CGRect(x: xPos, y: 0.0, width: dimension, height: dimension)
            btn3.setImage(UIImage(named: "btn-3"), for: .normal)
            btn3.setImage(UIImage(named: "btn-3-selected"), for: .selected)
            btn3.addTarget(self, action: #selector(scoreButtonAction(sender:)), for: .touchUpInside)
            btn3.tag = 3
            xPos += (dimension + offset)
            let btn4 = UIButton(type: .custom)
            btn4.frame = CGRect(x: xPos, y: 0.0, width: dimension, height: dimension)
            btn4.setImage(UIImage(named: "btn-4"), for: .normal)
            btn4.setImage(UIImage(named: "btn-4-selected"), for: .selected)
            btn4.addTarget(self, action: #selector(scoreButtonAction(sender:)), for: .touchUpInside)
            btn4.tag = 4
            xPos += (dimension + offset)
            let btn5 = UIButton(type: .custom)
            btn5.frame = CGRect(x: xPos, y: 0.0, width: dimension, height: dimension)
            btn5.setImage(UIImage(named: "btn-5"), for: .normal)
            btn5.setImage(UIImage(named: "btn-5-selected"), for: .selected)
            btn5.addTarget(self, action: #selector(scoreButtonAction(sender:)), for: .touchUpInside)
            btn5.tag = 5
            
            /*
            let btn1 = UIButton(type: .custom)
            btn1.frame = CGRect(x: xPos, y: 0.0, width: dimension, height: dimension)
            btn1.setImage(UIImage(named: "btn-"), for: .normal)
            btn1.setImage(UIImage(named: "btn-"), for: .selected)
            btn1.addTarget(self, action: #selector(starButtonAction(sender:)), for: .touchUpInside)
            btn1.tag = 1
            xPos += (dimension + offset)
            let btn2 = UIButton(type: .custom)
            btn2.frame = CGRect(x: xPos, y: 0.0, width: dimension, height: dimension)
            btn2.setImage(UIImage(named: "btn-"), for: .normal)
            btn2.setImage(UIImage(named: "btn-"), for: .selected)
            btn2.addTarget(self, action: #selector(starButtonAction(sender:)), for: .touchUpInside)
            btn2.tag = 2
            xPos += (dimension + offset)
            let btn3 = UIButton(type: .custom)
            btn3.frame = CGRect(x: xPos, y: 0.0, width: dimension, height: dimension)
            btn3.setImage(UIImage(named: "btn-"), for: .normal)
            btn3.setImage(UIImage(named: "btn-"), for: .selected)
            btn3.addTarget(self, action: #selector(starButtonAction(sender:)), for: .touchUpInside)
            btn3.tag = 3
            xPos += (dimension + offset)
            let btn4 = UIButton(type: .custom)
            btn4.frame = CGRect(x: xPos, y: 0.0, width: dimension, height: dimension)
            btn4.setImage(UIImage(named: "btn-"), for: .normal)
            btn4.setImage(UIImage(named: "btn-"), for: .selected)
            btn4.addTarget(self, action: #selector(starButtonAction(sender:)), for: .touchUpInside)
            btn4.tag = 4
            xPos += (dimension + offset)
            let btn5 = UIButton(type: .custom)
            btn5.frame = CGRect(x: xPos, y: 0.0, width: dimension, height: dimension)
            btn5.setImage(UIImage(named: "btn-"), for: .normal)
            btn5.setImage(UIImage(named: "btn-"), for: .selected)
            btn5.addTarget(self, action: #selector(starButtonAction(sender:)), for: .touchUpInside)
            btn5.tag = 5
            */
            
            customView.addSubview(btn1)
            customView.addSubview(btn2)
            customView.addSubview(btn3)
            customView.addSubview(btn4)
            customView.addSubview(btn5)
            
        default: break
            
        }
    }
    
    // MARK: - Actions
    /*func selectInterviewerAction() {
        parent?.selectInterviewerAction()
    }
    
    func selectStatusAction() {
        parent?.selectStatusAction()
    }*/
    
    func scoreButtonAction(sender: UIButton) {
        let score = sender.tag
        
        let btn1 = self.viewWithTag(1) as! UIButton
        let btn2 = self.viewWithTag(2) as! UIButton
        let btn3 = self.viewWithTag(3) as! UIButton
        let btn4 = self.viewWithTag(4) as! UIButton
        let btn5 = self.viewWithTag(5) as! UIButton
        
        btn1.isSelected = (score == 1)
        btn2.isSelected = (score == 2)
        btn3.isSelected = (score == 3)
        btn4.isSelected = (score == 4)
        btn5.isSelected = (score == 5)
        
        parent?.scoreAction(score: score)
    }
    
    /*func starButtonAction(sender: UIButton) {
        
        let index = sender.tag
        
        let btn1 = self.viewWithTag(1) as! UIButton
        let btn2 = self.viewWithTag(2) as! UIButton
        let btn3 = self.viewWithTag(3) as! UIButton
        let btn4 = self.viewWithTag(4) as! UIButton
        let btn5 = self.viewWithTag(5) as! UIButton
        
        btn1.isSelected = (index >= 1)
        btn2.isSelected = (index >= 2)
        btn3.isSelected = (index >= 3)
        btn4.isSelected = (index >= 4)
        btn5.isSelected = (index >= 5)
        
        parent?.starAction(score: index)
    }*/
    
    func recordButtonAction(sender: UIButton) {
        let btn = sender
        let isSelected = !btn.isSelected
        btn.isSelected = isSelected
        btn.backgroundColor = isSelected ? ColorThemePink : ColorThemeGreen
    }
}
