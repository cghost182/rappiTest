//
//  InitialViewController.swift
//  ChrisPelis
//
//  Created by Christian Collazos on 6/13/19.
//  Copyright © 2019 Christian Collazos. All rights reserved.
//

import UIKit
import Moya

class InitialViewController: UIViewController {

    var moviesVC = MoviesViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow

    }

    @IBAction func testAction(_ sender: Any) {
        self.navigationController?.pushViewController(self.moviesVC, animated: true)
        dataServiceAPI.request(.getPopularMovies(page: String(1))) { result in
            switch result {
            case let .success(moyaResponse):
                
                do {
                    try moyaResponse.filterSuccessfulStatusCodes()
                    let data = try moyaResponse.mapJSON()
                    let statusCode = moyaResponse.statusCode // Int - 200, 401, 500, etc
                    
                    print(data)
                }
                catch {
                    print("error")
                }
                
            case let .failure(error):
                print("error")
            }
        }
    }
    
}
