
//
//  NetworkManager.swift
//  TechnologyAssessment
//
//  Created by MACBOOK on 20/02/2020.
//  Copyright © 2020 MACBOOK. All rights reserved.
//

import Foundation
import UIKit

struct NetworkManager {
    
    func getPopularArticles(forPeriod : Int, completion: @escaping (APIResult<MostPopularArticles>)-> Void) {
        NetworkProvider.provider.request(.getArticles(period: forPeriod)) { (result) in
            switch result {
                
            case .success(_):
                do {
                    let resultent = try JSONDecoder().decode(MostPopularArticles.self, from: result.get().data )
                    completion(.success(resultent))
                }
                catch let error {
                    completion(.failure(error.localizedDescription))
                }
            case .failure(let error):
                completion(.failure(error.errorDescription ?? ""))
            }
        }
    }
}
