//
//  Theme.swift
//  AnimationPortfolioiOSApp
//
//  Created by Federico Pregnolato on 24/12/23.
//

import SwiftUI

enum Theme: String {
   case customTeal
   case customPurple
   case customBlack

    var accentColor: Color {
        switch self {
        case .customPurple, .customTeal: return .black
        case .customBlack: return .white
        }
    }
    
    var mainColor: Color {
        Color(rawValue)
    }
}


