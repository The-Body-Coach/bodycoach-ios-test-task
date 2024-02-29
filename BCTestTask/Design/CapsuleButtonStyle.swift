//
//  CapsuledButtonStyle.swift
//  BCTestTask
//
//  Created by Emilia Tothova on 26/02/2024.
//


import SwiftUI

struct CapsuleButtonStyle {
    let model: ButtonStyling
}

extension CapsuleButtonStyle {
    struct Options: ButtonStyling {
        var size: ButtonSize = .init(.lion, .wide)
        let backgroundColor: Color
        let foregroundColor: Color
        var outlineColor: Color?
    }

    init(_ options: Options) {
        self.init(model: options)
    }
}

extension CapsuleButtonStyle.Options {
    static let cobaltWhite = CapsuleButtonStyle.Options(
        size: .init(.lion, .wide),
        backgroundColor: .cobalt_500_1000,
        foregroundColor: .white_0_cobalt_500
    )
}

extension CapsuleButtonStyle: ButtonStyle {
    func makeBody(configuration: ButtonStyle.Configuration) -> some View {
        CapsuleButton(configuration: configuration, model: model)
    }

    struct CapsuleButton: View {
        @Environment(\.isEnabled) private var isEnabled: Bool

        let configuration: ButtonStyle.Configuration
        let model: ButtonStyling

        private var opacity: CGFloat {
            isEnabled ? 1 : 0.4
        }

        var body: some View {
            configuration
                .label
                .accentColor(model.foregroundColor(for: configuration).opacity(opacity))
                .foregroundColor(model.foregroundColor(for: configuration).opacity(opacity))
                .padding(size: model.size)
                .frame(size: model.size)
                .background(Capsule().fill(model.backgroundColor(for: configuration)).opacity(opacity))
                .overlay(optionalOutline)
        }

        var optionalOutline: some View {
            model.outlineColor(for: configuration).map { color in
                Capsule().stroke(color, lineWidth: 2).opacity(opacity)
            }
        }
    }
}

private extension View {
    func padding(size: ButtonSize) -> some View {
        padding(horizontal: size.width).padding(vertical: size.height)
    }

    func padding(horizontal: ButtonSize.Width) -> some View {
        switch horizontal {
        case .wide:
            return padding(.horizontal, DesignConstants.gutterNarrow)
        default:
            return padding(.horizontal, 12)
        }
    }

    func padding(vertical: ButtonSize.Height) -> some View {
        switch vertical {
        case .lion, .horse:
            return padding(.vertical, 19)
        case .rabbit, .mouse:
            return padding(.vertical, 0)
        }
    }

    func frame(size: ButtonSize) -> some View {
        frame(width: size.width).frame(height: size.height)
    }

    func frame(width: ButtonSize.Width) -> some View {
        switch width {
        case .narrow:
            return frame(minWidth: 0)
        case .wide:
            return frame(maxWidth: .infinity)
        }
    }

    func frame(height: ButtonSize.Height) -> some View {
        switch height {
        case .horse:
            return frame(minHeight: 60)
        case .lion:
            return frame(minHeight: 52)
        case .rabbit:
            return frame(minHeight: 44)
        case .mouse:
            return frame(minHeight: 32)
        }
    }
}
