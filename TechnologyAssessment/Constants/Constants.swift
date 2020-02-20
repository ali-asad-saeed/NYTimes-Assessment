//
//  Constants.swift
//  TechnologyAssessment
//
//  Created by MACBOOK on 20/02/2020.
//  Copyright © 2020 MACBOOK. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    
    private init() {}
    
    static let tableViewSubHeaderSize:CGFloat = 28.0
    
    struct Colors {
        static let appBlueColor = #colorLiteral(red: 0, green: 0.4392156863, blue: 0.8392156863, alpha: 1)
        static let appTitleColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        static let appDetailsColor = #colorLiteral(red: 0.7098039216, green: 0.8196078431, blue: 0.9607843137, alpha: 1)
        static let appButtonBlackColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        static let appButtonYellowColor = #colorLiteral(red: 0.9764705882, green: 0.8666666667, blue: 0.1137254902, alpha: 1)
        static let appTextFieldBackgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.9725490196, alpha: 1)
        static let appInactiveButtonColor = #colorLiteral(red: 0.7568627451, green: 0.7568627451, blue: 0.7568627451, alpha: 1)
        static let appPlaceHolderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.65)
        static let appWarningColor = #colorLiteral(red: 0.9803921569, green: 0.6274509804, blue: 0.2235294118, alpha: 1)
        static let appSuccessColor = #colorLiteral(red: 0.4352941176, green: 0.7294117647, blue: 0.2, alpha: 1)
        static let appErrorColor = #colorLiteral(red: 0.968627451, green: 0.2039215686, blue: 0.3803921569, alpha: 1)
    }
    
    struct API {
        static let populatArticlesBaseURL = "http://api.nytimes.com/svc/mostpopular/v2/"
    }
}
