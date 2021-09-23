//
//  AutoLayout-PropertyWrapperTests.swift
//  
//
//  Created by Andreas Osberghaus on 23.09.21.
//

import XCTest
@testable import AutoLayout_Helper
import UIKit

final class AutoLayout_PropertyWrapperTests: XCTestCase {
    @AutoLayout
    var view = UIView()

    func testAutoLayout() throws {
        let view = UIView()
        XCTAssertTrue(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertFalse(self.view.translatesAutoresizingMaskIntoConstraints)
    }

}
