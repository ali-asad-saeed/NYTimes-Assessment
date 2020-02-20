//
//  Provider.swift
//  Ali
//
//  Created by Ali Asad on 20/02/2020.
//  Copyright © 2019 Ali Asad. All rights reserved.
//

import Foundation
import Moya

struct Provider {
    static let service = MoyaProvider<NYTimesServices>(plugins: [Plugin.networkPlugin])
}


