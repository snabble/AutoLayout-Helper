//
//  AutoLayout-PropertyWrapper.swift
//  
//
//  Created by Andreas Osberghaus on 23.09.21.
//

import UIKit

@propertyWrapper
public struct AutoLayout {
    public var wrappedValue: UIView {
        didSet {
            wrappedValue.translatesAutoresizingMaskIntoConstraints = false
        }
    }

    public init(wrappedValue: UIView) {
        self.wrappedValue = wrappedValue
        wrappedValue.translatesAutoresizingMaskIntoConstraints = false
    }
}
