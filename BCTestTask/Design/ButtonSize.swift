//
//  ButtonSize.swift
//  BCTestTask
//
//  Created by Emilia Tothova on 26/02/2024.
//

import Foundation

struct ButtonSize: Equatable {
    enum Height {
        case horse, lion, rabbit, mouse
    }

    enum Width {
        case narrow, wide
    }

    let height: Height
    var width: Width = .wide

    init(_ height: Height, _ width: Width = .wide) {
        self.height = height
        self.width = width
    }
}
