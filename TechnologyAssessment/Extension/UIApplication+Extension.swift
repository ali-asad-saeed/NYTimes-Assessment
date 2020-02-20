//
//  UIApplication+Extension.swift
//  TechnologyAssessment
//
//  Created by MACBOOK on 20/02/2020.
//  Copyright © 2020 MACBOOK. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    class func startActivity(with message: String = "") {
        //im here
        /*
        DispatchQueue.main.async {
            let hud = JGProgressHUD(style: .dark)
            hud?.tag = 999
            hud?.textLabel.text = message
            if let view = UIApplication.shared.keyWindow {
                hud?.show(in: view)
            }
        }
 */
    }
    
    class func stopActivity() {
        /*
        DispatchQueue.main.async {
            if let hud = UIApplication.shared.keyWindow?.viewWithTag(999) as? JGProgressHUD {
                hud.dismiss()
                hud.removeFromSuperview()
            }
        }
 */
    }
}

