//
//  UIViewPreview.swift
//  
//
//  Created by Andreas Osberghaus on 04.10.21.
//

import Foundation
import UIKit

#if canImport(SwiftUI)
import SwiftUI

// MARK: SwiftUI Preview

@available(iOS 13.0, *)
public struct UIViewPreview<View>: UIViewRepresentable where View: UIView {
    public let view: View

    public init(_ builder: @escaping () -> View) {
        view = builder()
    }

    // MARK: - UIViewRepresentable
    public func makeUIView(context: Context) -> UIView {
        view
    }

    public func updateUIView(_ view: UIView, context: Context) {}
}

#endif
