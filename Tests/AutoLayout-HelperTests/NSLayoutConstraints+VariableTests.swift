//
//  NSLayoutConstraints+VariableTests.swift
//  
//
//  Created by Andreas Osberghaus on 23.09.21.
//

import XCTest
@testable import AutoLayout_Helper
import UIKit

final class NSLayoutConstraints_VariableTests: XCTestCase {
    var constraint: NSLayoutConstraint?

    func testUsingIdentifier() throws {
        let constraint = UIView().topAnchor.constraint(equalTo: UIView().topAnchor, constant: 2).usingVariable(&constraint)
        XCTAssertEqual(constraint, self.constraint)
    }
}
