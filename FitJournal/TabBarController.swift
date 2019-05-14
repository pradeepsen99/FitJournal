//
//  TabBarController.swift
//  FitJournal
//
//  Created by Pradeep Kumar on 5/13/19.
//  Copyright © 2019 Pradeep Kumar. All rights reserved.
//

//Code taken & modified from https://github.com/gmathi/NovelLibrary-iOS/blob/75aedfc5e672fce15724ef68cc6bc091bb6011c0/NovelLibrary/View%20Controllers/TabBarController.swift

import UIKit
import BATabBarController

class TabBarController: UIViewController {
    
    var tabBar: BATabBarController!
    
    let hubItem: BATabBarItem = getTabBarItem(title: "Workout", imageName: "star")
    let profileItem: BATabBarItem = getTabBarItem(title: "Profile", imageName: "map_marker")
    let graphsItem: BATabBarItem = getTabBarItem(title: "Graphs", imageName: "list")
    
    class func getTabBarItem(title: String, imageName: String) -> BATabBarItem {
        let tabBarItem = BATabBarItem(image: UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate), selectedImage: UIImage(named: imageName),title: NSAttributedString(string:title))
        tabBarItem?.tintColor = .white
        tabBarItem?.title.textColor = .white
        return tabBarItem!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = UIStoryboard(name: "Workout", bundle: nil).instantiateInitialViewController()!
        let vc2 = UIStoryboard(name: "Profile", bundle: nil).instantiateInitialViewController()!
        let vc3 = UIStoryboard(name: "Graphs", bundle: nil).instantiateInitialViewController()!
        
        
        //Add DarkTheme to the TabBar
        self.tabBar = BATabBarController()
        self.tabBar.tabBarItemStrokeColor = .red;
        self.tabBar.viewControllers = [vc1, vc2, vc3]
        self.tabBar.tabBarItems = [hubItem, profileItem, graphsItem]
        self.tabBar.setSelectedView(vc1, animated: true)
        self.tabBar.tabBarBackgroundColor = UIColor(red: 1/256, green: 4/255, blue: 13/255, alpha: 1)
        self.view.addSubview(self.tabBar.view)
    }
    
}
