//
//  MealsViewController.swift
//  FitJournal
//
//  Created by Pradeep Kumar on 6/7/19.
//  Copyright © 2019 Pradeep Kumar. All rights reserved.
//

import UIKit

class MealsViewController: UIViewController {
    
    var settingsButton: UIBarButtonItem? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.topItem?.title = "Meals"
        
        settingsButton = UIBarButtonItem.init(
            image: UIImage(named: "restaurant.png")?.withRenderingMode(.alwaysTemplate),
            style: .plain,
            target: self,
            action: #selector(mealsButtonClick)
        )
        
        self.navigationItem.rightBarButtonItem = settingsButton
    }
    
    
}

extension MealsViewController{
    @objc func mealsButtonClick(){
        
    }
}
