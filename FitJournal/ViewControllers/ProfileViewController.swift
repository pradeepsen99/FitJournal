//
//  ProfileViewController.swift
//  FitJournal
//
//  Created by Pradeep Kumar on 5/29/19.
//  Copyright © 2019 Pradeep Kumar. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var settingsButton: UIBarButtonItem? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.topItem?.title = "Profile"
        
        settingsButton = UIBarButtonItem.init(
            image: UIImage(named: "settings.png")?.withRenderingMode(.alwaysTemplate),
            style: .plain,
            target: self,
            action: #selector(settingsButtonClick)
        )
        
        self.navigationItem.rightBarButtonItem = settingsButton
    }
    
    
}

extension ProfileViewController{
    @objc func settingsButtonClick(){
        
    }
}
