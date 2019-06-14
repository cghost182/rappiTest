//
//  CustomNavigationController.swift
//  ChrisPelis
//
//  Created by Christian Collazos on 6/13/19.
//  Copyright © 2019 Christian Collazos. All rights reserved.
//

import UIKit

class CustomNavigationViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        navigationBar.isTranslucent = true
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
