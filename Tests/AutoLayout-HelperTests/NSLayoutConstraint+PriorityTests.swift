//
//  NSLayoutConstraint+PriorityTests.swift
//  
//
//  Created by Andreas Osberghaus on 23.09.21.
//

import XCTest
@testable import AutoLayout_Helper
import UIKit

final class NSLayoutConstraints_PriorityTests: XCTestCase {
    func testUsingIdentifier() throws {
        var constraint = UIView().topAnchor.constraint(equalTo: UIView().topAnchor, constant: 2)
        XCTAssertEqual(constraint.priority, .required)
        constraint = constraint.usingPriority(.defaultLow)
        XCTAssertEqual(constraint.priority, .defaultLow)
    }
}
