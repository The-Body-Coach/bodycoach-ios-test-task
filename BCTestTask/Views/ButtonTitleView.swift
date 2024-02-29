//
//  ButtonTitleView.swift
//  BCTestTask
//
//  Created by Emilia Tothova on 26/02/2024.
//

import SwiftUI

struct ButtonTitleView {
    private let text: Text

    init(text: Text) {
        self.text = text
    }

    init(_ titleKey: LocalizedStringKey) {
        self.init(text: Text(titleKey))
    }

    @_disfavoredOverload
    init<S: StringProtocol>(_ title: S) {
        self.init(text: Text(title))
    }
}

extension ButtonTitleView: View {
    var body: some View {
        text
            .kerning(DesignConstants.buttonKerning)
            .textCase(.uppercase)
            .multilineTextAlignment(.center)
            .font(.body)
            .fixedSize(horizontal: false, vertical: true)
    }
}
