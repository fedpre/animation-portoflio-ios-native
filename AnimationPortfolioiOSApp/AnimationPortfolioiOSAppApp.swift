//
//  AnimationPortfolioiOSAppApp.swift
//  AnimationPortfolioiOSApp
//
//  Created by Federico Pregnolato on 24/12/23.
//

import SwiftUI

@main
struct AnimationPortfolioiOSAppApp: App {
    var body: some Scene {
        WindowGroup {
            ProjectList(projects: Project.sampleData)
                .preferredColorScheme(.dark)
        }
    }
}
