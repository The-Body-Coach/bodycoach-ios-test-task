//
//  ComfortableReadingWidth.swift
//  BCTestTask
//
//  Created by Emilia Tothova on 26/02/2024.
//

import SwiftUI

struct ComfortableReadingWidth: ViewModifier {
    let minimum: CGFloat

    var width: CGFloat {
        min(minimum, DesignConstants.comfortableReadingWidth)
    }

    func body(content: Content) -> some View {
        content
            .frame(idealWidth: width, maxWidth: width)
    }
}

extension View {
    func comfortableReadingWidth(minimum: CGFloat = .infinity) -> some View {
        modifier(ComfortableReadingWidth(minimum: minimum))
    }
}
