//
//  ContentEdgeInset.swift
//  BCTestTask
//
//  Created by Emilia Tothova on 25/02/2024.
//

import SwiftUI

// MARK: - Bounds Preference

private struct BoundsPreferences: PreferenceKey {
    typealias Value = [String: Anchor<CGRect>]

    static var defaultValue: Value = [:]

    static func reduce(value: inout Value, nextValue: () -> Value) {
        value.merge(nextValue()) { $1 }
    }
}

private struct BoundsChangeObserver: ViewModifier {
    let key: String
    let block: (GeometryProxy, Anchor<CGRect>) -> Void

    func body(content: Content) -> some View {
        content
            .overlayPreferenceValue(BoundsPreferences.self) { preferences in
                GeometryReader { geometry in
                    preferences[self.key].map { anchor in
                        Color.clear
                            .onAppear {
                                self.block(geometry, anchor)
                            }
                    }
                }
            }
    }
}

extension View {
    func anchorBounds(key: String) -> some View {
        anchorPreference(key: BoundsPreferences.self, value: .bounds, transform: { [key: $0] })
    }

    func onBoundsChange(key: String, perform block: @escaping (GeometryProxy, Anchor<CGRect>) -> Void) -> some View {
        modifier(BoundsChangeObserver(key: key, block: block))
    }

    func onBoundsChange(key: String, update binding: Binding<CGRect>) -> some View {
        modifier(BoundsChangeObserver(key: key, block: { geometry, anchor in
            binding.wrappedValue = geometry[anchor]
        }))
    }
}
