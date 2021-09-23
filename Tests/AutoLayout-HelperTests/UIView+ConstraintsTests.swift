//
//  File.swift
//  
//
//  Created by Andreas Osberghaus on 23.09.21.
//

import Foundation
import XCTest
@testable import AutoLayout_Helper
import UIKit

final class UIView_ConstraintsTests: XCTestCase {
    func testAnchoring() throws {
        let view1 = UIView()
        let view2 = UIView()
        let constraints = view1.constraintsForAnchoringTo(boundsOf: view2)
        XCTAssertEqual(constraints.count, 4)

        let topAnchorConstraint = try XCTUnwrap(constraints.first(where: { $0.firstAnchor == view1.topAnchor }))
        XCTAssertFalse(topAnchorConstraint.isActive)
        XCTAssertEqual(topAnchorConstraint.priority, .required)
        XCTAssertEqual(topAnchorConstraint.constant, 0)
        XCTAssertEqual(topAnchorConstraint.firstItem as? UIView, view1)
        XCTAssertEqual(topAnchorConstraint.secondItem as? UIView, view2)
        XCTAssertEqual(topAnchorConstraint.firstAnchor, view1.topAnchor)
        XCTAssertEqual(topAnchorConstraint.secondAnchor, view2.topAnchor)
        XCTAssertEqual(topAnchorConstraint.relation, .equal)

        let leadingAnchorConstraint = try XCTUnwrap(constraints.first(where: { $0.firstAnchor == view1.leadingAnchor }))
        XCTAssertFalse(leadingAnchorConstraint.isActive)
        XCTAssertEqual(leadingAnchorConstraint.priority, .required)
        XCTAssertEqual(leadingAnchorConstraint.constant, 0)
        XCTAssertEqual(leadingAnchorConstraint.firstItem as? UIView, view1)
        XCTAssertEqual(leadingAnchorConstraint.secondItem as? UIView, view2)
        XCTAssertEqual(leadingAnchorConstraint.firstAnchor, view1.leadingAnchor)
        XCTAssertEqual(leadingAnchorConstraint.secondAnchor, view2.leadingAnchor)
        XCTAssertEqual(leadingAnchorConstraint.relation, .equal)

        let bottomAnchorConstraint = try XCTUnwrap(constraints.first(where: { $0.firstAnchor == view2.bottomAnchor }))
        XCTAssertFalse(bottomAnchorConstraint.isActive)
        XCTAssertEqual(bottomAnchorConstraint.priority, .required)
        XCTAssertEqual(bottomAnchorConstraint.constant, 0)
        XCTAssertEqual(bottomAnchorConstraint.firstItem as? UIView, view2)
        XCTAssertEqual(bottomAnchorConstraint.secondItem as? UIView, view1)
        XCTAssertEqual(bottomAnchorConstraint.firstAnchor, view2.bottomAnchor)
        XCTAssertEqual(bottomAnchorConstraint.secondAnchor, view1.bottomAnchor)
        XCTAssertEqual(bottomAnchorConstraint.relation, .equal)

        let trailingAnchorConstraint = try XCTUnwrap(constraints.first(where: { $0.firstAnchor == view2.trailingAnchor }))
        XCTAssertFalse(trailingAnchorConstraint.isActive)
        XCTAssertEqual(trailingAnchorConstraint.priority, .required)
        XCTAssertEqual(trailingAnchorConstraint.constant, 0)
        XCTAssertEqual(trailingAnchorConstraint.firstItem as? UIView, view2)
        XCTAssertEqual(trailingAnchorConstraint.secondItem as? UIView, view1)
        XCTAssertEqual(trailingAnchorConstraint.firstAnchor, view2.trailingAnchor)
        XCTAssertEqual(trailingAnchorConstraint.secondAnchor, view1.trailingAnchor)
        XCTAssertEqual(trailingAnchorConstraint.relation, .equal)
    }

    func testAnchoringWithInset() throws {
        let view1 = UIView()
        let view2 = UIView()
        let constraints = view1.constraintsForAnchoringTo(
            boundsOf: view2,
            withEdgeInset: .init(top: 5, leading: 10, bottom: 15, trailing: 20)
        )
        XCTAssertEqual(constraints.count, 4)

        let topAnchorConstraint = try XCTUnwrap(constraints.first(where: { $0.firstAnchor == view1.topAnchor }))
        XCTAssertFalse(topAnchorConstraint.isActive)
        XCTAssertEqual(topAnchorConstraint.priority, .required)
        XCTAssertEqual(topAnchorConstraint.constant, 5)
        XCTAssertEqual(topAnchorConstraint.firstItem as? UIView, view1)
        XCTAssertEqual(topAnchorConstraint.secondItem as? UIView, view2)
        XCTAssertEqual(topAnchorConstraint.firstAnchor, view1.topAnchor)
        XCTAssertEqual(topAnchorConstraint.secondAnchor, view2.topAnchor)
        XCTAssertEqual(topAnchorConstraint.relation, .equal)

        let leadingAnchorConstraint = try XCTUnwrap(constraints.first(where: { $0.firstAnchor == view1.leadingAnchor }))
        XCTAssertFalse(leadingAnchorConstraint.isActive)
        XCTAssertEqual(leadingAnchorConstraint.priority, .required)
        XCTAssertEqual(leadingAnchorConstraint.constant, 10)
        XCTAssertEqual(leadingAnchorConstraint.firstItem as? UIView, view1)
        XCTAssertEqual(leadingAnchorConstraint.secondItem as? UIView, view2)
        XCTAssertEqual(leadingAnchorConstraint.firstAnchor, view1.leadingAnchor)
        XCTAssertEqual(leadingAnchorConstraint.secondAnchor, view2.leadingAnchor)
        XCTAssertEqual(leadingAnchorConstraint.relation, .equal)

        let bottomAnchorConstraint = try XCTUnwrap(constraints.first(where: { $0.firstAnchor == view2.bottomAnchor }))
        XCTAssertFalse(bottomAnchorConstraint.isActive)
        XCTAssertEqual(bottomAnchorConstraint.priority, .required)
        XCTAssertEqual(bottomAnchorConstraint.constant, 15)
        XCTAssertEqual(bottomAnchorConstraint.firstItem as? UIView, view2)
        XCTAssertEqual(bottomAnchorConstraint.secondItem as? UIView, view1)
        XCTAssertEqual(bottomAnchorConstraint.firstAnchor, view2.bottomAnchor)
        XCTAssertEqual(bottomAnchorConstraint.secondAnchor, view1.bottomAnchor)
        XCTAssertEqual(bottomAnchorConstraint.relation, .equal)

        let trailingAnchorConstraint = try XCTUnwrap(constraints.first(where: { $0.firstAnchor == view2.trailingAnchor }))
        XCTAssertFalse(trailingAnchorConstraint.isActive)
        XCTAssertEqual(trailingAnchorConstraint.priority, .required)
        XCTAssertEqual(trailingAnchorConstraint.constant, 20)
        XCTAssertEqual(trailingAnchorConstraint.firstItem as? UIView, view2)
        XCTAssertEqual(trailingAnchorConstraint.secondItem as? UIView, view1)
        XCTAssertEqual(trailingAnchorConstraint.firstAnchor, view2.trailingAnchor)
        XCTAssertEqual(trailingAnchorConstraint.secondAnchor, view1.trailingAnchor)
        XCTAssertEqual(trailingAnchorConstraint.relation, .equal)
    }

    func testAnchoringWithMultiplier() throws {
        let view1 = UIView()
        let view2 = UIView()
        let constraints = view1.constraintsForAnchoringTo(
            boundsOf: view2,
            withSystemSpacingMultiplier: 2
        )
        XCTAssertEqual(constraints.count, 4)

        let topAnchorConstraint = try XCTUnwrap(constraints.first(where: { $0.firstAnchor == view1.topAnchor }))
        XCTAssertFalse(topAnchorConstraint.isActive)
        XCTAssertEqual(topAnchorConstraint.priority, .required)
        XCTAssertEqual(topAnchorConstraint.constant, 16)
        XCTAssertEqual(topAnchorConstraint.firstItem as? UIView, view1)
        XCTAssertEqual(topAnchorConstraint.secondItem as? UIView, view2)
        XCTAssertEqual(topAnchorConstraint.firstAnchor, view1.topAnchor)
        XCTAssertEqual(topAnchorConstraint.secondAnchor, view2.topAnchor)

        let leadingAnchorConstraint = try XCTUnwrap(constraints.first(where: { $0.firstAnchor == view1.leadingAnchor }))
        XCTAssertFalse(leadingAnchorConstraint.isActive)
        XCTAssertEqual(leadingAnchorConstraint.priority, .required)
        XCTAssertEqual(leadingAnchorConstraint.constant, 16)
        XCTAssertEqual(leadingAnchorConstraint.firstItem as? UIView, view1)
        XCTAssertEqual(leadingAnchorConstraint.secondItem as? UIView, view2)
        XCTAssertEqual(leadingAnchorConstraint.firstAnchor, view1.leadingAnchor)
        XCTAssertEqual(leadingAnchorConstraint.secondAnchor, view2.leadingAnchor)

        let bottomAnchorConstraint = try XCTUnwrap(constraints.first(where: { $0.firstAnchor == view2.bottomAnchor }))
        XCTAssertFalse(bottomAnchorConstraint.isActive)
        XCTAssertEqual(bottomAnchorConstraint.priority, .required)
        XCTAssertEqual(bottomAnchorConstraint.constant, 16)
        XCTAssertEqual(bottomAnchorConstraint.firstItem as? UIView, view2)
        XCTAssertEqual(bottomAnchorConstraint.secondItem as? UIView, view1)
        XCTAssertEqual(bottomAnchorConstraint.firstAnchor, view2.bottomAnchor)
        XCTAssertEqual(bottomAnchorConstraint.secondAnchor, view1.bottomAnchor)

        let trailingAnchorConstraint = try XCTUnwrap(constraints.first(where: { $0.firstAnchor == view2.trailingAnchor }))
        XCTAssertFalse(trailingAnchorConstraint.isActive)
        XCTAssertEqual(trailingAnchorConstraint.priority, .required)
        XCTAssertEqual(trailingAnchorConstraint.constant, 16)
        XCTAssertEqual(trailingAnchorConstraint.firstItem as? UIView, view2)
        XCTAssertEqual(trailingAnchorConstraint.secondItem as? UIView, view1)
        XCTAssertEqual(trailingAnchorConstraint.firstAnchor, view2.trailingAnchor)
        XCTAssertEqual(trailingAnchorConstraint.secondAnchor, view1.trailingAnchor)
    }

    func testTopLeadingAnchoring() throws {
        let view1 = UIView()
        let view2 = UIView()
        let constraints = view1.constraintsForTopLeadingAnchoringTo(
            boundsOf: view2,
            withMargins: (16, 8)
        )
        XCTAssertEqual(constraints.count, 4)

        let topAnchorConstraint = try XCTUnwrap(constraints.first(where: { $0.firstAnchor == view1.topAnchor }))
        XCTAssertFalse(topAnchorConstraint.isActive)
        XCTAssertEqual(topAnchorConstraint.priority, .required)
        XCTAssertEqual(topAnchorConstraint.constant, 16)
        XCTAssertEqual(topAnchorConstraint.firstItem as? UIView, view1)
        XCTAssertEqual(topAnchorConstraint.secondItem as? UIView, view2)
        XCTAssertEqual(topAnchorConstraint.firstAnchor, view1.topAnchor)
        XCTAssertEqual(topAnchorConstraint.secondAnchor, view2.topAnchor)
        XCTAssertEqual(topAnchorConstraint.relation, .equal)

        let leadingAnchorConstraint = try XCTUnwrap(constraints.first(where: { $0.firstAnchor == view1.leadingAnchor }))
        XCTAssertFalse(leadingAnchorConstraint.isActive)
        XCTAssertEqual(leadingAnchorConstraint.priority, .required)
        XCTAssertEqual(leadingAnchorConstraint.constant, 8)
        XCTAssertEqual(leadingAnchorConstraint.firstItem as? UIView, view1)
        XCTAssertEqual(leadingAnchorConstraint.secondItem as? UIView, view2)
        XCTAssertEqual(leadingAnchorConstraint.firstAnchor, view1.leadingAnchor)
        XCTAssertEqual(leadingAnchorConstraint.secondAnchor, view2.leadingAnchor)
        XCTAssertEqual(leadingAnchorConstraint.relation, .equal)

        let bottomAnchorConstraint = try XCTUnwrap(constraints.first(where: { $0.firstAnchor == view2.bottomAnchor }))
        XCTAssertFalse(bottomAnchorConstraint.isActive)
        XCTAssertEqual(bottomAnchorConstraint.priority, .required)
        XCTAssertEqual(bottomAnchorConstraint.constant, 0)
        XCTAssertEqual(bottomAnchorConstraint.firstItem as? UIView, view2)
        XCTAssertEqual(bottomAnchorConstraint.secondItem as? UIView, view1)
        XCTAssertEqual(bottomAnchorConstraint.firstAnchor, view2.bottomAnchor)
        XCTAssertEqual(bottomAnchorConstraint.secondAnchor, view1.bottomAnchor)
        XCTAssertEqual(bottomAnchorConstraint.relation, .greaterThanOrEqual)

        let trailingAnchorConstraint = try XCTUnwrap(constraints.first(where: { $0.firstAnchor == view2.trailingAnchor }))
        XCTAssertFalse(trailingAnchorConstraint.isActive)
        XCTAssertEqual(trailingAnchorConstraint.priority, .required)
        XCTAssertEqual(trailingAnchorConstraint.constant, 0)
        XCTAssertEqual(trailingAnchorConstraint.firstItem as? UIView, view2)
        XCTAssertEqual(trailingAnchorConstraint.secondItem as? UIView, view1)
        XCTAssertEqual(trailingAnchorConstraint.firstAnchor, view2.trailingAnchor)
        XCTAssertEqual(trailingAnchorConstraint.secondAnchor, view1.trailingAnchor)
        XCTAssertEqual(trailingAnchorConstraint.relation, .greaterThanOrEqual)
    }

    func testTopTrailingAnchoring() throws {
        let view1 = UIView()
        let view2 = UIView()
        let constraints = view1.constraintsForTopTrailingAnchoringTo(
            boundsOf: view2,
            withMargins: (24, 13)
        )
        XCTAssertEqual(constraints.count, 4)

        let topAnchorConstraint = try XCTUnwrap(constraints.first(where: { $0.firstAnchor == view1.topAnchor }))
        XCTAssertFalse(topAnchorConstraint.isActive)
        XCTAssertEqual(topAnchorConstraint.priority, .required)
        XCTAssertEqual(topAnchorConstraint.constant, 24)
        XCTAssertEqual(topAnchorConstraint.firstItem as? UIView, view1)
        XCTAssertEqual(topAnchorConstraint.secondItem as? UIView, view2)
        XCTAssertEqual(topAnchorConstraint.firstAnchor, view1.topAnchor)
        XCTAssertEqual(topAnchorConstraint.secondAnchor, view2.topAnchor)
        XCTAssertEqual(topAnchorConstraint.relation, .equal)

        let leadingAnchorConstraint = try XCTUnwrap(constraints.first(where: { $0.firstAnchor == view1.leadingAnchor }))
        XCTAssertFalse(leadingAnchorConstraint.isActive)
        XCTAssertEqual(leadingAnchorConstraint.priority, .required)
        XCTAssertEqual(leadingAnchorConstraint.constant, 0)
        XCTAssertEqual(leadingAnchorConstraint.firstItem as? UIView, view1)
        XCTAssertEqual(leadingAnchorConstraint.secondItem as? UIView, view2)
        XCTAssertEqual(leadingAnchorConstraint.firstAnchor, view1.leadingAnchor)
        XCTAssertEqual(leadingAnchorConstraint.secondAnchor, view2.leadingAnchor)
        XCTAssertEqual(leadingAnchorConstraint.relation, .greaterThanOrEqual)

        let bottomAnchorConstraint = try XCTUnwrap(constraints.first(where: { $0.firstAnchor == view2.bottomAnchor }))
        XCTAssertFalse(bottomAnchorConstraint.isActive)
        XCTAssertEqual(bottomAnchorConstraint.priority, .required)
        XCTAssertEqual(bottomAnchorConstraint.constant, 0)
        XCTAssertEqual(bottomAnchorConstraint.firstItem as? UIView, view2)
        XCTAssertEqual(bottomAnchorConstraint.secondItem as? UIView, view1)
        XCTAssertEqual(bottomAnchorConstraint.firstAnchor, view2.bottomAnchor)
        XCTAssertEqual(bottomAnchorConstraint.secondAnchor, view1.bottomAnchor)
        XCTAssertEqual(bottomAnchorConstraint.relation, .greaterThanOrEqual)

        let trailingAnchorConstraint = try XCTUnwrap(constraints.first(where: { $0.firstAnchor == view2.trailingAnchor }))
        XCTAssertFalse(trailingAnchorConstraint.isActive)
        XCTAssertEqual(trailingAnchorConstraint.priority, .required)
        XCTAssertEqual(trailingAnchorConstraint.constant, 13)
        XCTAssertEqual(trailingAnchorConstraint.firstItem as? UIView, view2)
        XCTAssertEqual(trailingAnchorConstraint.secondItem as? UIView, view1)
        XCTAssertEqual(trailingAnchorConstraint.firstAnchor, view2.trailingAnchor)
        XCTAssertEqual(trailingAnchorConstraint.secondAnchor, view1.trailingAnchor)
        XCTAssertEqual(trailingAnchorConstraint.relation, .equal)
    }

    func testBottomTrailingAnchoring() throws {
        let view1 = UIView()
        let view2 = UIView()
        let constraints = view1.constraintsForBottomTrailingAnchoringTo(
            boundsOf: view2,
            withMargins: (18, 12)
        )
        XCTAssertEqual(constraints.count, 4)

        let topAnchorConstraint = try XCTUnwrap(constraints.first(where: { $0.firstAnchor == view1.topAnchor }))
        XCTAssertFalse(topAnchorConstraint.isActive)
        XCTAssertEqual(topAnchorConstraint.priority, .required)
        XCTAssertEqual(topAnchorConstraint.constant, 0)
        XCTAssertEqual(topAnchorConstraint.firstItem as? UIView, view1)
        XCTAssertEqual(topAnchorConstraint.secondItem as? UIView, view2)
        XCTAssertEqual(topAnchorConstraint.firstAnchor, view1.topAnchor)
        XCTAssertEqual(topAnchorConstraint.secondAnchor, view2.topAnchor)
        XCTAssertEqual(topAnchorConstraint.relation, .greaterThanOrEqual)

        let leadingAnchorConstraint = try XCTUnwrap(constraints.first(where: { $0.firstAnchor == view1.leadingAnchor }))
        XCTAssertFalse(leadingAnchorConstraint.isActive)
        XCTAssertEqual(leadingAnchorConstraint.priority, .required)
        XCTAssertEqual(leadingAnchorConstraint.constant, 0)
        XCTAssertEqual(leadingAnchorConstraint.firstItem as? UIView, view1)
        XCTAssertEqual(leadingAnchorConstraint.secondItem as? UIView, view2)
        XCTAssertEqual(leadingAnchorConstraint.firstAnchor, view1.leadingAnchor)
        XCTAssertEqual(leadingAnchorConstraint.secondAnchor, view2.leadingAnchor)
        XCTAssertEqual(leadingAnchorConstraint.relation, .greaterThanOrEqual)

        let bottomAnchorConstraint = try XCTUnwrap(constraints.first(where: { $0.firstAnchor == view2.bottomAnchor }))
        XCTAssertFalse(bottomAnchorConstraint.isActive)
        XCTAssertEqual(bottomAnchorConstraint.priority, .required)
        XCTAssertEqual(bottomAnchorConstraint.constant, 18)
        XCTAssertEqual(bottomAnchorConstraint.firstItem as? UIView, view2)
        XCTAssertEqual(bottomAnchorConstraint.secondItem as? UIView, view1)
        XCTAssertEqual(bottomAnchorConstraint.firstAnchor, view2.bottomAnchor)
        XCTAssertEqual(bottomAnchorConstraint.secondAnchor, view1.bottomAnchor)
        XCTAssertEqual(bottomAnchorConstraint.relation, .equal)

        let trailingAnchorConstraint = try XCTUnwrap(constraints.first(where: { $0.firstAnchor == view2.trailingAnchor }))
        XCTAssertFalse(trailingAnchorConstraint.isActive)
        XCTAssertEqual(trailingAnchorConstraint.priority, .required)
        XCTAssertEqual(trailingAnchorConstraint.constant, 12)
        XCTAssertEqual(trailingAnchorConstraint.firstItem as? UIView, view2)
        XCTAssertEqual(trailingAnchorConstraint.secondItem as? UIView, view1)
        XCTAssertEqual(trailingAnchorConstraint.firstAnchor, view2.trailingAnchor)
        XCTAssertEqual(trailingAnchorConstraint.secondAnchor, view1.trailingAnchor)
        XCTAssertEqual(trailingAnchorConstraint.relation, .equal)
    }

    func testBottomLeadingAnchoring() throws {
        let view1 = UIView()
        let view2 = UIView()
        let constraints = view1.constraintsForBottomLeadingAnchoringTo(
            boundsOf: view2,
            withMargins: (30, 20)
        )
        XCTAssertEqual(constraints.count, 4)

        let topAnchorConstraint = try XCTUnwrap(constraints.first(where: { $0.firstAnchor == view1.topAnchor }))
        XCTAssertFalse(topAnchorConstraint.isActive)
        XCTAssertEqual(topAnchorConstraint.priority, .required)
        XCTAssertEqual(topAnchorConstraint.constant, 0)
        XCTAssertEqual(topAnchorConstraint.firstItem as? UIView, view1)
        XCTAssertEqual(topAnchorConstraint.secondItem as? UIView, view2)
        XCTAssertEqual(topAnchorConstraint.firstAnchor, view1.topAnchor)
        XCTAssertEqual(topAnchorConstraint.secondAnchor, view2.topAnchor)
        XCTAssertEqual(topAnchorConstraint.relation, .greaterThanOrEqual)

        let leadingAnchorConstraint = try XCTUnwrap(constraints.first(where: { $0.firstAnchor == view1.leadingAnchor }))
        XCTAssertFalse(leadingAnchorConstraint.isActive)
        XCTAssertEqual(leadingAnchorConstraint.priority, .required)
        XCTAssertEqual(leadingAnchorConstraint.constant, 20)
        XCTAssertEqual(leadingAnchorConstraint.firstItem as? UIView, view1)
        XCTAssertEqual(leadingAnchorConstraint.secondItem as? UIView, view2)
        XCTAssertEqual(leadingAnchorConstraint.firstAnchor, view1.leadingAnchor)
        XCTAssertEqual(leadingAnchorConstraint.secondAnchor, view2.leadingAnchor)
        XCTAssertEqual(leadingAnchorConstraint.relation, .equal)

        let bottomAnchorConstraint = try XCTUnwrap(constraints.first(where: { $0.firstAnchor == view2.bottomAnchor }))
        XCTAssertFalse(bottomAnchorConstraint.isActive)
        XCTAssertEqual(bottomAnchorConstraint.priority, .required)
        XCTAssertEqual(bottomAnchorConstraint.constant, 30)
        XCTAssertEqual(bottomAnchorConstraint.firstItem as? UIView, view2)
        XCTAssertEqual(bottomAnchorConstraint.secondItem as? UIView, view1)
        XCTAssertEqual(bottomAnchorConstraint.firstAnchor, view2.bottomAnchor)
        XCTAssertEqual(bottomAnchorConstraint.secondAnchor, view1.bottomAnchor)
        XCTAssertEqual(bottomAnchorConstraint.relation, .equal)

        let trailingAnchorConstraint = try XCTUnwrap(constraints.first(where: { $0.firstAnchor == view2.trailingAnchor }))
        XCTAssertFalse(trailingAnchorConstraint.isActive)
        XCTAssertEqual(trailingAnchorConstraint.priority, .required)
        XCTAssertEqual(trailingAnchorConstraint.constant, 0)
        XCTAssertEqual(trailingAnchorConstraint.firstItem as? UIView, view2)
        XCTAssertEqual(trailingAnchorConstraint.secondItem as? UIView, view1)
        XCTAssertEqual(trailingAnchorConstraint.firstAnchor, view2.trailingAnchor)
        XCTAssertEqual(trailingAnchorConstraint.secondAnchor, view1.trailingAnchor)
        XCTAssertEqual(trailingAnchorConstraint.relation, .greaterThanOrEqual)
    }

    func testCenterIn() throws {
        let view1 = UIView()
        let view2 = UIView()
        let constraints = view1.constraintsForCenterIn(
            boundsOf: view2
        )
        XCTAssertEqual(constraints.count, 6)

        let centerXConstraint = try XCTUnwrap(constraints.first(where: { $0.firstAnchor == view1.centerXAnchor }))
        XCTAssertFalse(centerXConstraint.isActive)
        XCTAssertEqual(centerXConstraint.priority, .required)
        XCTAssertEqual(centerXConstraint.constant, 0)
        XCTAssertEqual(centerXConstraint.firstItem as? UIView, view1)
        XCTAssertEqual(centerXConstraint.secondItem as? UIView, view2)
        XCTAssertEqual(centerXConstraint.firstAnchor, view1.centerXAnchor)
        XCTAssertEqual(centerXConstraint.secondAnchor, view2.centerXAnchor)
        XCTAssertEqual(centerXConstraint.relation, .equal)

        let centerYConstraint = try XCTUnwrap(constraints.first(where: { $0.firstAnchor == view1.centerYAnchor }))
        XCTAssertFalse(centerYConstraint.isActive)
        XCTAssertEqual(centerYConstraint.priority, .required)
        XCTAssertEqual(centerYConstraint.constant, 0)
        XCTAssertEqual(centerYConstraint.firstItem as? UIView, view1)
        XCTAssertEqual(centerYConstraint.secondItem as? UIView, view2)
        XCTAssertEqual(centerYConstraint.firstAnchor, view1.centerYAnchor)
        XCTAssertEqual(centerYConstraint.secondAnchor, view2.centerYAnchor)
        XCTAssertEqual(centerYConstraint.relation, .equal)

        let topAnchorConstraint = try XCTUnwrap(constraints.first(where: { $0.firstAnchor == view1.topAnchor }))
        XCTAssertFalse(topAnchorConstraint.isActive)
        XCTAssertEqual(topAnchorConstraint.priority, .required)
        XCTAssertEqual(topAnchorConstraint.constant, 0)
        XCTAssertEqual(topAnchorConstraint.firstItem as? UIView, view1)
        XCTAssertEqual(topAnchorConstraint.secondItem as? UIView, view2)
        XCTAssertEqual(topAnchorConstraint.firstAnchor, view1.topAnchor)
        XCTAssertEqual(topAnchorConstraint.secondAnchor, view2.topAnchor)
        XCTAssertEqual(topAnchorConstraint.relation, .greaterThanOrEqual)

        let leadingAnchorConstraint = try XCTUnwrap(constraints.first(where: { $0.firstAnchor == view1.leadingAnchor }))
        XCTAssertFalse(leadingAnchorConstraint.isActive)
        XCTAssertEqual(leadingAnchorConstraint.priority, .required)
        XCTAssertEqual(leadingAnchorConstraint.constant, 0)
        XCTAssertEqual(leadingAnchorConstraint.firstItem as? UIView, view1)
        XCTAssertEqual(leadingAnchorConstraint.secondItem as? UIView, view2)
        XCTAssertEqual(leadingAnchorConstraint.firstAnchor, view1.leadingAnchor)
        XCTAssertEqual(leadingAnchorConstraint.secondAnchor, view2.leadingAnchor)
        XCTAssertEqual(leadingAnchorConstraint.relation, .greaterThanOrEqual)

        let bottomAnchorConstraint = try XCTUnwrap(constraints.first(where: { $0.firstAnchor == view2.bottomAnchor }))
        XCTAssertFalse(bottomAnchorConstraint.isActive)
        XCTAssertEqual(bottomAnchorConstraint.priority, .required)
        XCTAssertEqual(bottomAnchorConstraint.constant, 0)
        XCTAssertEqual(bottomAnchorConstraint.firstItem as? UIView, view2)
        XCTAssertEqual(bottomAnchorConstraint.secondItem as? UIView, view1)
        XCTAssertEqual(bottomAnchorConstraint.firstAnchor, view2.bottomAnchor)
        XCTAssertEqual(bottomAnchorConstraint.secondAnchor, view1.bottomAnchor)
        XCTAssertEqual(bottomAnchorConstraint.relation, .greaterThanOrEqual)

        let trailingAnchorConstraint = try XCTUnwrap(constraints.first(where: { $0.firstAnchor == view2.trailingAnchor }))
        XCTAssertFalse(trailingAnchorConstraint.isActive)
        XCTAssertEqual(trailingAnchorConstraint.priority, .required)
        XCTAssertEqual(trailingAnchorConstraint.constant, 0)
        XCTAssertEqual(trailingAnchorConstraint.firstItem as? UIView, view2)
        XCTAssertEqual(trailingAnchorConstraint.secondItem as? UIView, view1)
        XCTAssertEqual(trailingAnchorConstraint.firstAnchor, view2.trailingAnchor)
        XCTAssertEqual(trailingAnchorConstraint.secondAnchor, view1.trailingAnchor)
        XCTAssertEqual(trailingAnchorConstraint.relation, .greaterThanOrEqual)
    }

    func testAspectRatio() throws {
        let view = UIView()
        let constraint = view.constraintForAspectRatio(4.0/3.0)
        XCTAssertNotNil(constraint)
        XCTAssertFalse(constraint.isActive)
        XCTAssertEqual(constraint.firstItem as? UIView, view)
        XCTAssertEqual(constraint.secondItem as? UIView, view)
        XCTAssertEqual(constraint.firstAttribute, .height)
        XCTAssertEqual(constraint.secondAttribute, .width)
        XCTAssertEqual(constraint.relation, .equal)
        XCTAssertEqual(constraint.multiplier, 4.0/3.0, accuracy: 0.001)
        XCTAssertEqual(constraint.constant, 0)
    }
}
