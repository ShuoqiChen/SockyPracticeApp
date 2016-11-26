//
//  Common.swift
//  OneDay
//
//  Created by Shuoqi Chen on 11/23/16.
//  Copyright © 2016 Shuoqi Chen. All rights reserved.
//

import Foundation
import UIKit

//Save tablet screen height and width
struct Common {

    static let screenWidth = UIScreen.main.bounds.width
    static let screenHeight = UIScreen.main.bounds.height
    
    // deprecated in iOS 9
    //    static let screenWidth = UIScreen.main.applicationFrame.maxX
    //    static let screenHeight = UIScreen.main.applicationFrame.maxY
    
    
    static let rootViewController = UIApplication.shared.keyWindow?.rootViewController as! SlideViewController
    static let contactsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "unknown")
}

