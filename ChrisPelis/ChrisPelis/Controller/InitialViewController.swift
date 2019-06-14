//
//  InitialViewController.swift
//  ChrisPelis
//
//  Created by Christian Collazos on 6/13/19.
//  Copyright © 2019 Christian Collazos. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    var moviesVC = MoviesViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow

    }

    @IBAction func testAction(_ sender: Any) {
        self.navigationController?.pushViewController(self.moviesVC, animated: true)
    }
    
}
