//
//  UIView+Constraints.swift
//  
//
//  Created by Andreas Osberghaus on 23.09.21.
//

import Foundation
import UIKit

extension UIView {

    /// Returns a collection of constraints to anchor the bounds of the current view to the given view.
    ///
    /// - Parameter view: The view to anchor to.
    /// - Returns: The layout constraints needed for this constraint.
    public func constraintsForAnchoringTo(boundsOf view: UIView) -> [NSLayoutConstraint] {
        [
            topAnchor.constraint(equalTo: view.topAnchor),
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]
    }

    /// Returns a collection of constraints to anchor the bounds of the current view to the given view with spacing
    ///
    /// - Parameter view: The view to anchor to.
    /// - Parameter edgeInset: The `NSDirectionalEdgeInsets` for the spacing
    /// - Returns: The layout constraints needed for this constraint.
    public func constraintsForAnchoringTo(boundsOf view: UIView, withEdgeInset edgeInset: NSDirectionalEdgeInsets) -> [NSLayoutConstraint] {
        [
            topAnchor.constraint(equalTo: view.topAnchor, constant: edgeInset.top),
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: edgeInset.leading),
            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: edgeInset.bottom),
            view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: edgeInset.trailing)
        ]
    }

    /// Returns a collection of constraints to anchor the bounds of the current view to the given view with system spacing
    ///
    /// - Parameter view: The view to anchor to.
    /// - Parameter multiplier: The multiplier for the system spacing
    /// - Returns: The layout constraints needed for this constraint.
    public func constraintsForAnchoringTo(boundsOf view: UIView, withSystemSpacingMultiplier multiplier: CGFloat) -> [NSLayoutConstraint] {
        [
            topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: multiplier),
            leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: multiplier),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: bottomAnchor, multiplier: multiplier),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: trailingAnchor, multiplier: multiplier)
        ]
    }

    /// Returns a collection of constraints to anchor the bounds of the current view to the given view top and leading anchors with the given margins
    /// - Parameters:
    ///   - view: The view to anchor to
    ///   - margins: The margins for the view
    /// - Returns: The layout constraints needed for this constraint
    public func constraintsForTopLeadingAnchoringTo(
        boundsOf view: UIView,
        withMargins margins: (top: CGFloat, leading: CGFloat)
    ) -> [NSLayoutConstraint] {
        [
            topAnchor.constraint(equalTo: view.topAnchor, constant: margins.top),
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margins.leading),
            view.bottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor),
            view.trailingAnchor.constraint(greaterThanOrEqualTo: trailingAnchor)
        ]
    }

    /// Returns a collection of constraints to anchor the bounds of the current view to the given view top and trailing anchors with the given margins
    /// - Parameters:
    ///   - view: The view to anchor to
    ///   - margins: The margins for the view
    /// - Returns: The layout constraints needed for this constraint
    public func constraintsForTopTrailingAnchoringTo(
        boundsOf view: UIView,
        withMargins margins: (top: CGFloat, trailing: CGFloat)
    ) -> [NSLayoutConstraint] {
        [
            topAnchor.constraint(equalTo: view.topAnchor, constant: margins.top),
            leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor),
            view.bottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: margins.trailing)
        ]
    }

    /// Returns a collection of constraints to anchor the bounds of the current view to the given view bottom and trailing anchors with the given margins
    /// - Parameters:
    ///   - view: The view to anchor to
    ///   - margins: The margins for the view
    /// - Returns: The layout constraints needed for this constraint
    public func constraintsForBottomTrailingAnchoringTo(
        boundsOf view: UIView,
        withMargins margins: (bottom: CGFloat, trailing: CGFloat)
    ) -> [NSLayoutConstraint] {
        [
            topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor),
            leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: margins.bottom),
            view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: margins.trailing)
        ]
    }

    /// Returns a collection of constraints to anchor the bounds of the current view to the given view bottom and leading anchors with the given margins
    /// - Parameters:
    ///   - view: The view to anchor to
    ///   - margins: The margins for the view
    /// - Returns: The layout constraints needed for this constraint
    public func constraintsForBottomLeadingAnchoringTo(
        boundsOf view: UIView,
        withMargins margins: (bottom: CGFloat, leading: CGFloat)
    ) -> [NSLayoutConstraint] {
        [
            topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor),
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margins.leading),
            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: margins.bottom),
            view.trailingAnchor.constraint(greaterThanOrEqualTo: trailingAnchor)
        ]
    }

    /// Returns a collection of constraints to center the bounds of the current view to the given view
    /// - Parameter view: The view to center in
    /// - Returns: The layout constraints needed for this constraint
    public func constraintsForCenterIn(boundsOf view: UIView) -> [NSLayoutConstraint] {
        [
            centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerYAnchor.constraint(equalTo: view.centerYAnchor),

            topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor),
            leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor),
            view.bottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor),
            view.trailingAnchor.constraint(greaterThanOrEqualTo: trailingAnchor)
        ]
    }

    /// Returns a constraint to define an aspect ratio of `Self`
    /// - Parameter ratio: The aspect ratio for the constraint
    /// - Returns: The layout constraint needed
    public func constraintForAspectRatio(_ ratio: CGFloat) -> NSLayoutConstraint {
        NSLayoutConstraint(
            item: self,
            attribute: .height,
            relatedBy: .equal,
            toItem: self,
            attribute: .width,
            multiplier: ratio,
            constant: 0
        )
    }
}
