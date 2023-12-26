//
//  ContentView.swift
//  AnimationPortfolioiOSApp
//
//  Created by Federico Pregnolato on 24/12/23.
//

import SwiftUI

struct ProjectList: View {
    let projects: [Project]
    var body: some View {
        NavigationStack {
            List(projects, id: \.id) { project in
                NavigationLink(destination: project.detailPage) {
                    ProjectCardView(project: project)
                }
            }
            .navigationTitle("Animation Projects")
        }
    }
}

#Preview {
    ProjectList(projects: Project.sampleData)
}
