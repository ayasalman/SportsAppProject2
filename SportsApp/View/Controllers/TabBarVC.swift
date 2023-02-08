//
//  TabBarVC.swift
//  SportsApp
//
//  Created by Aya on 02/02/2023.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.changeRadiusOfTabBar()
       
        
    }
    
    override func viewDidLayoutSubviews() {
        self.changeHeightOfTabBar()
    }
    
    func changeRadiusOfTabBar()
    {
        self.tabBar.layer.masksToBounds = true
        self.tabBar.isTranslucent = true
        self.tabBar.layer.cornerRadius = 50
        self.tabBar.layer.maskedCorners = [ .layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func changeHeightOfTabBar()
    {
        if UIDevice().userInterfaceIdiom == .phone
        {
            var tabFrame = tabBar.frame
            tabFrame.size.height = 100
            tabFrame.origin.y = view.frame.size.height - 100
            tabBar.frame = tabFrame
        }
        
        
    }
    
    
   

}
