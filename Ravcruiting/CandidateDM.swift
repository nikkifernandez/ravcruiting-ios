//
//  CandidateDM.swift
//  Ravcruiting
//
//  Created by Nikki Fernandez on 09/03/2017.
//  Copyright © 2017 SourcePad. All rights reserved.
//

import UIKit

class CandidateDM: NSObject {
    
    struct CandidateConstants {
        static let firstNameKey = "first_name"
        static let lastNameKey = "last_name"
    }
    
    struct InterviewConstants {
        static let statusKey = "status"
        static let interviewerKey = "interviewer"
        static let scoreKey = "score"
        static let notesKey = "notes"
    }
    
    var candidateId: Int = 0
    var firstName: String = ""
    var lastName: String = ""
    
    // Resume
    var basicInformation: String = ""
    var backgroundInformation: String = ""
    var skills: [String] = []
    var interests: [String] = []
    
    // Interviews
    var interviews: [NSDictionary] = []
    
    // Application status
    var position: String = ""   // Position applied for
    var applicationStatus: String = ""
    var interviewer: String = ""
    
    override init() {
        super.init()
    }
    
    class func sampleCandidate() -> CandidateDM {
        let candidate = CandidateDM()
        candidate.firstName = "John"
        candidate.lastName = "Doe"
        
        candidate.basicInformation = "John Doe\nSenior RoR Developer\njohndoe@email.com\n(123) 456-7890"
        candidate.backgroundInformation = "Senior software craftsman featuring expertise in Ruby on Rails, web frameworks and other programming languages, a passion for Web 2.0 trends, APIs, mashups and other disruptive technologies, and experience managing teams of offshore providers and developers."
        candidate.skills = ["JQuery", "JavaScript", "MySQL", "PostgreSQL", "RSpec", "Ruby", "Ruby on Rails", "SQL", "SQLite", "XML"]
        candidate.interests = ["Basketball", "Dota", "Hiking", "Surfing"]
        
        candidate.position = "RoR Developer"
        candidate.applicationStatus = "Technical Interview"
        candidate.interviewer = "Rav B"
        
        let interview1: NSDictionary = [InterviewConstants.statusKey : "HR",
                                        InterviewConstants.interviewerKey : "Con B.",
                                        InterviewConstants.scoreKey : "5",
                                        InterviewConstants.notesKey: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                        ]
        let interview2: NSDictionary = [InterviewConstants.statusKey : "Technical Interview",
                                        InterviewConstants.interviewerKey : "Mark A.",
                                        InterviewConstants.scoreKey : "4",
                                        InterviewConstants.notesKey: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                        ]
        
        candidate.interviews = [interview1, interview2]
        
        return candidate
    }
    
    class func candidateFromData(data: NSDictionary) -> CandidateDM {
        let candidate = CandidateDM()
        
        candidate.firstName = (data[CandidateConstants.firstNameKey] as? String)!
        candidate.lastName = (data[CandidateConstants.lastNameKey] as? String)!
        
        return candidate
    }
}
