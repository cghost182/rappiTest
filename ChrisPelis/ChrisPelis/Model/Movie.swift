//
//  Movie.swift
//  ChrisPelis
//
//  Created by Christian Collazos on 6/14/19.
//  Copyright © 2019 Christian Collazos. All rights reserved.
//

import Foundation

struct Movie {
    private(set) public var name:String
    private(set) public var duration:Int
    private(set) public var category:Category
    private(set) public var rating:Int
    
    init(name:String, duration:Int, category:Category , rating:Int){
        self.name = name
        self.duration = duration
        self.category = category
        self.rating = rating
    }
    
}
