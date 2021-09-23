//
//  NSLayoutConstraint+IdentifierTests.swift
//  
//
//  Created by Andreas Osberghaus on 23.09.21.
//

import XCTest
@testable import AutoLayout_Helper
import UIKit

final class NSLayoutConstraints_IdentifierTests: XCTestCase {
    func testUsingIdentifier() throws {
        var constraint = UIView().topAnchor.constraint(equalTo: UIView().topAnchor, constant: 2)
        XCTAssertNil(constraint.identifier)
        constraint = constraint.usingIdentifier("foobar")
        XCTAssertEqual(constraint.identifier, "foobar")
    }

    func testFirstIdentifier() throws {
        let constraint = UIView().topAnchor.constraint(equalTo: UIView().topAnchor, constant: 2).usingIdentifier("foobar")
        let constraints = [
            constraint,
            UIView().topAnchor.constraint(equalTo: UIView().topAnchor, constant: 2).usingIdentifier("foobar2"),
            UIView().topAnchor.constraint(equalTo: UIView().topAnchor, constant: 2).usingIdentifier("foobar3"),
            UIView().topAnchor.constraint(equalTo: UIView().topAnchor, constant: 2).usingIdentifier("foobar")
        ]
        XCTAssertEqual(constraints.first(with: "foobar"), constraint)
    }
}
