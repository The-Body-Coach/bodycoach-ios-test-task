//
//  ContentView.swift
//  BCTestTask
//
//  Created by Emilia Tothova on 21/02/2024.
//
import SwiftUI

private struct ContentInsetsKey: EnvironmentKey {
    static var defaultValue = EdgeInsets()
}

extension EnvironmentValues {
    var contentInsets: EdgeInsets {
        get { self[ContentInsetsKey.self] }
        set { self[ContentInsetsKey.self] = newValue }
    }
}

extension View {
    /// Sets the `contentInsets` environment value. Child views can use this value to inset their own content.
    /// This is a similar concept to safe area insets, except these are opt-in as opposed to safe area insets which
    /// are opt-out.
    /// - Parameter insets: Insets to set in the environment
    /// - Returns: A view which has the corresponding `contentInsets` value set in its environment
    func contentInsets(_ insets: EdgeInsets) -> some View {
        environment(\.contentInsets, insets)
    }

    /// Sets the `contentInsets` environment value. Child views can use this value to inset their own content.
    /// This is a similar concept to safe area insets, except these are opt-in as opposed to safe area insets which
    /// are opt-out.
    ///
    /// - Parameter insets: Insets to set in the environment
    /// - Parameters:
    ///   - edges: The set of edges along which to define insets for this view
    ///   - length: The amount to inset this view on the specified edges
    /// - Returns: A view which has the corresponding `contentInsets` value set in its environment
    func contentInsets(_ edges: Edge.Set, _ length: CGFloat) -> some View {
        var insets = EdgeInsets()

        if edges.contains(.top) {
            insets.top = length
        }

        if edges.contains(.bottom) {
            insets.bottom = length
        }

        if edges.contains(.leading) {
            insets.leading = length
        }

        if edges.contains(.trailing) {
            insets.trailing = length
        }

        return environment(\.contentInsets, insets)
    }

    /// Sets the `contentInsets` environment value to zero for the provided edges.
    /// - Parameter edges: The set of edges along which to remove insets for this view
    /// - Returns: A view which has the corresponding `contentInsets` value set in its environment
    func edgesIgnoringContentInsets(_ edges: Edge.Set) -> some View {
        contentInsets(edges, 0)
    }
}

