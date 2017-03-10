//
//  CandidateController.swift
//  Ravcruiting
//
//  Created by Nikki Fernandez on 10/03/2017.
//  Copyright © 2017 SourcePad. All rights reserved.
//

import Foundation
import Alamofire

class CandidateController: NSObject {

    static let sharedInstance = CandidateController()
    
    weak var delegate: CandidateControllerDelegate?
    
    // MARK: - Life Cycle -
    private override init() {
        super.init()
    }
    
    // MARK: - Public Methods -
    func getCandidates(delegate: CandidateControllerDelegate) {
        
        self.delegate = delegate

        Alamofire.request("https://yourGetURL.com", method: .get, parameters: ["":""], encoding: URLEncoding.default, headers: nil).responseJSON { (response:DataResponse) in
            
            switch(response.result) {
            case .success(_):
                if let data = response.result.value{
                    print(data)
                }
                break
                
            case .failure(_):
                print(response.result.error)
                break
                
            }
        }
        
    }
}

protocol CandidateControllerDelegate: class {
    func didGetCandidates(candidates: [CandidateDM])
}
