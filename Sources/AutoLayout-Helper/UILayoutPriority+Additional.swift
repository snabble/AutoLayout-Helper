//
//  File.swift
//  
//
//  Created by Andreas Osberghaus on 23.09.21.
//

import Foundation
import UIKit

extension UILayoutPriority {
    /// Creates a priority which is almost required, but not 100%.
    public static var almostRequired: UILayoutPriority {
        UILayoutPriority(rawValue: 999)
    }

    /// Creates a priority which is not required at all.
    public static var notRequired: UILayoutPriority {
        UILayoutPriority(rawValue: 0)
    }
}
