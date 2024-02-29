//
//  ButtonStyling.swift
//  BCTestTask
//
//  Created by Emilia Tothova on 26/02/2024.
//

import SwiftUI

protocol ButtonStyling {
    var size: ButtonSize { get }

    var backgroundColor: Color { get }

    var foregroundColor: Color { get }

    var outlineColor: Color? { get }

    var pressedBackgroundColor: Color { get }

    var pressedForegroundColor: Color { get }

    var pressedOutlineColor: Color? { get }
}

extension ButtonStyling {
    var pressedBackgroundColor: Color {
        backgroundColor.opacity(0.6)
    }

    var pressedForegroundColor: Color {
        foregroundColor
    }

    var pressedOutlineColor: Color? {
        outlineColor?.opacity(0.6)
    }

    func foregroundColor(for configuration: ButtonStyleConfiguration) -> Color {
        configuration.isPressed ? pressedForegroundColor : foregroundColor
    }

    func backgroundColor(for configuration: ButtonStyleConfiguration) -> Color {
        configuration.isPressed ? pressedBackgroundColor : backgroundColor
    }

    func outlineColor(for configuration: ButtonStyleConfiguration) -> Color? {
        configuration.isPressed ? pressedOutlineColor : outlineColor
    }
}
