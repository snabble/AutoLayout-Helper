//
//  UILayoutPriority+AdditionalTests.swift
//  
//
//  Created by Andreas Osberghaus on 23.09.21.
//

import XCTest
@testable import AutoLayout_Helper
import UIKit

final class UILayoutPriority_AdditionalTests: XCTestCase {
    func testAlmostRequired() throws {
        let priority = UILayoutPriority.almostRequired
        XCTAssertEqual(priority, UILayoutPriority(rawValue: 999))
    }

    func testNotRequired() throws {
        let priority = UILayoutPriority.notRequired
        XCTAssertEqual(priority, UILayoutPriority(rawValue: 0))
    }
}
