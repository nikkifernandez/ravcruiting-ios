//
//  ProfileViewController.swift
//  Ravcruiting
//
//  Created by Nikki Fernandez on 08/03/2017.
//  Copyright © 2017 SourcePad. All rights reserved.
//

import UIKit

enum ProfileSections: Int {
    case basicInformation = 0, backgroundInformation, skills, interests, interviews, count
}

enum ProfileTags: Int {
    case skills = 0, interests
}

class ProfileViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var candidate: CandidateDM?
    
    fileprivate lazy var footerView: UIView = {
        let width: CGFloat = self.view.frame.size.width*0.45
        let height: CGFloat = 40.0
        let padding: CGFloat = 10.0
        let v = UIView.init(frame: CGRect(x: 0.0, y: 0.0, width: ScreenWidth, height: height+15.0))
        
        let startButton = UIButton.init(type: .custom)
        startButton.frame = CGRect(x: padding, y: 0.0, width: width, height: height)
        startButton.backgroundColor = ColorThemePink
        startButton.layer.cornerRadius = height/2
        startButton.setTitle("Start Interview", for: .normal)
        startButton.titleLabel?.font = FontButtonText
        startButton.addTarget(self, action: #selector(startButtonAction), for: .touchUpInside)
        
        let addButton = UIButton.init(type: .custom)
        addButton.frame = CGRect(x: self.view.frame.size.width-(width+padding), y: 0.0, width: width, height: height)
        addButton.backgroundColor = ColorThemePink
        addButton.layer.cornerRadius = height/2
        addButton.setTitle("Upload Exam", for: .normal)
        addButton.titleLabel?.font = FontButtonText
        addButton.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
        
        v.addSubview(startButton)
        v.addSubview(addButton)
        
        return v
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Back button
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 0.0, y: 0.0, width: 44.0, height: 44.0)
        let backButton = UIBarButtonItem(customView: btn)
        self.navigationController?.navigationItem.backBarButtonItem = backButton
        
        // Footer
        tableView.tableFooterView = self.footerView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return ProfileSections.count.rawValue
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section==ProfileSections.interviews.rawValue {
            return (candidate?.interviews.count)!
        }
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
        case ProfileSections.basicInformation.rawValue:
            return 115.0
        case ProfileSections.backgroundInformation.rawValue:
            return Utilities.heightForView(text: "\(candidate?.backgroundInformation)", font: FontRegularText!, width: ScreenWidth-40.0) + 30.0
        case ProfileSections.skills.rawValue:
            return 100.0
        case ProfileSections.interests.rawValue:
            return 100.0
        case ProfileSections.interviews.rawValue:
            let interview: NSDictionary = (candidate?.interviews[indexPath.row])!
            let notesHt = Utilities.heightForView(text: interview.object(forKey: "notes") as! String, font: FontRegularText!, width: ScreenWidth-40.0)
            return notesHt + 70.0
        default:
            return 44.0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case ProfileSections.basicInformation.rawValue:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "BasicInformationCell", for: indexPath) as? BasicInformationCell)!
            cell.configureBasicInformationCell(candidate: candidate!)
            return cell
        case ProfileSections.backgroundInformation.rawValue:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "BackgroundInformationCell", for: indexPath) as? BackgroundInformationCell)!
            cell.configureBackgroundInformationCell(candidate: candidate!)
            return cell
        case ProfileSections.skills.rawValue:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "TagsInformationCell", for: indexPath) as? TagsInformationCell)!
            cell.configureTagsInformationCell(candidate: candidate!, tag: ProfileTags.skills.rawValue)
            return cell
        case ProfileSections.interests.rawValue:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "TagsInformationCell", for: indexPath) as? TagsInformationCell)!
            cell.configureTagsInformationCell(candidate: candidate!, tag: ProfileTags.interests.rawValue)
            return cell
        case ProfileSections.interviews.rawValue:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "InterviewInformationCell", for: indexPath) as? InterviewInformationCell)!
            cell.configureInterviewInformationCell(interview: (candidate?.interviews[indexPath.row])!)
            return cell
        default:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "InterviewStatusCell", for: indexPath) as? InterviewStatusCell)!
            cell.configureBasicInformationCell(candidate: candidate!)
            return cell
        }
    }

    // MARK: - Button Actions
    
    func startButtonAction() {
        let vc = InterviewViewController()
        vc.candidate = candidate
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func addButtonAction() {
        
        let alert = UIAlertController(title: "Select source of Exam file", message: "", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (alert: UIAlertAction!) in
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.allowsEditing = false
            picker.sourceType = .photoLibrary
            self.present(picker, animated: true, completion: nil)
            
        }))
        
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (alert: UIAlertAction!) in
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.allowsEditing = false
            picker.sourceType = .camera
            picker.cameraCaptureMode = .photo
            picker.modalPresentationStyle = .fullScreen
            self.present(picker, animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }

    // MARK: - Image Picker Controller Delegates
    private func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        //let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        let alert = UIAlertController(title: "Exam Upload", message: "Upload is succesful", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
        
        dismiss(animated:true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        dismiss(animated: true, completion: nil)
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
