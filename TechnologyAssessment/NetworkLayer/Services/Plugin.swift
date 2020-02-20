//
//  Plugin.swift
//  Ali
//
//  Created by Ali Asad on 20/02/2020.
//  Copyright © 2019 Ali Asad. All rights reserved.
//

import Foundation
import Moya

struct Plugin {
    
    private init () {}
    
    static let networkPlugin = NetworkActivityPlugin(networkActivityClosure: { (changeType, _) in
        switch changeType {
        case .began:
            print("🌍 ==>> Network Call Started... ==>> \(Date()) <<==")
            UIApplication.startActivity()
        case .ended:
            UIApplication.stopActivity()
            print("🌍 ==>> Network Call Ended... ==>> \(Date()) <<==")
        }
    })
    
//    static let loggerPlugin = NetworkLoggerPlugin(verbose: true)
}
