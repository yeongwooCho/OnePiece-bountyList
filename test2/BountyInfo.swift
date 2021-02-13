//
//  BountyInfo.swift
//  test2
//
//  Created by 조영우 on 2021/02/13.
//

import UIKit

struct BountyInfo {
    var name: String
    var bounty: Int
    var image: UIImage? {
        return UIImage(named: "\(name).jpg")
    }

    init(name: String, bounty: Int) {
        self.name = name
        self.bounty = bounty
        
    }
}
