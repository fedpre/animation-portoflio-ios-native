//
//  Project.swift
//  AnimationPortfolioiOSApp
//
//  Created by Federico Pregnolato on 24/12/23.
//

import Foundation
import SwiftUI

struct Project: Identifiable {
    var id: UUID
    var title: String
    var date: String
    var detailPage: AnyView
    
    init<V: View>(id: UUID = UUID(), title: String, date: String, detailPage: V) {
        self.id = id
        self.title = title
        self.date = date
        self.detailPage = AnyView(detailPage)
    }
}

extension Project {
    static let sampleData: [Project] = [
        Project(title: "Spotify Stick Header", date: "2023-12-26", detailPage: SpotifyStickyHeaderDetail()),
    ]
}
