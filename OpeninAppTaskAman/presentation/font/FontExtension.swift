//
//  FontExtension.swift
//  OpeninAppTaskAman
//
//  Created by Aman Kumar on 05/04/24.
//

import SwiftUI

enum Figtree: String {
    case regular = "Figtree-Black"
    case bold = "Figtree-Bold"
}

enum FontSize: CGFloat {
    case smallBody = 8
    case mediumBody = 10
    case largeBody = 12
    case smallTitle = 14
    case mediumTitle = 16
    case largeTitle = 18
    case smallHeading = 20
    case mediumHeading = 24
    case largeHeading = 35
}

// TODO: Setup with relative to later on
extension Font {
    static func figtreeFont(_ font: Figtree, fontSize: FontSize) -> Font {
        custom(font.rawValue, size: fontSize.rawValue)
    }
}
