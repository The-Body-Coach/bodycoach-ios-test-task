//
//  Colours.swift
//  BCTestTask
//
//  Created by Emilia Tothova on 21/02/2024.
//

import SwiftUI

// MARK: - Color Creators

protocol ColorPrimitive {
    static func make(withAssetCatalogName: String) -> Self
}

extension ColorPrimitive {
   
    // MARK: Cobalt

    static var cobalt_50_550: Self {
        make(withAssetCatalogName: "cobalt 50 > 550")
    }

    static var cobalt_100_900: Self {
        make(withAssetCatalogName: "cobalt 100 > 900")
    }

    static var cobalt_150_250: Self {
        make(withAssetCatalogName: "cobalt 150 > 250")
    }

    static var cobalt_200_700: Self {
        make(withAssetCatalogName: "cobalt 200 > 700")
    }

    static var cobalt_225_700: Self {
        make(withAssetCatalogName: "cobalt 225 > 700")
    }

    static var cobalt_300: Self {
        make(withAssetCatalogName: "cobalt 300")
    }

    static var cobalt_400_800: Self {
        make(withAssetCatalogName: "cobalt 400 > 800")
    }

    static var cobalt_425_850: Self {
        make(withAssetCatalogName: "cobalt 425 > 850")
    }

    static var cobalt_450_1050: Self {
        make(withAssetCatalogName: "cobalt 450 > 1050")
    }

    static var cobalt_500_1000: Self {
        make(withAssetCatalogName: "cobalt 500 > 1000")
    }

    static var cobalt_500_250: Self {
        make(withAssetCatalogName: "cobalt 500 > 250")
    }

    static var cobalt_500_white_0: Self {
        make(withAssetCatalogName: "cobalt 500 > white 0")
    }

    static var cobalt_400: Self {
        make(withAssetCatalogName: "cobalt 400")
    }

    static var cobalt_500: Self {
        make(withAssetCatalogName: "cobalt 500")
    }

    static var cobalt_650: Self {
        make(withAssetCatalogName: "cobalt 650")
    }
    
    static var white_0_cobalt_500: Self {
        make(withAssetCatalogName: "white 0 > cobalt 500")
    }
}

extension Color: ColorPrimitive {
    static func make(withAssetCatalogName name: String) -> Self { Color(name) }
}

extension UIColor: ColorPrimitive {
    static func make(withAssetCatalogName name: String) -> Self {
        guard let color = Self(named: name) else {
            fatalError("Unknown color name: \(name)")
        }
        return color
    }
}
