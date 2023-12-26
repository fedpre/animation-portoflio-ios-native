//
//  ProjectCardView.swift
//  AnimationPortfolioiOSApp
//
//  Created by Federico Pregnolato on 24/12/23.
//

import SwiftUI

struct ProjectCardView: View {
    let project: Project
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(project.title)
                    .font(.headline)
                    .bold()
                    
                Text(project.date)
                    .font(.caption)
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ProjectCardView(project: Project.sampleData[0])
        .previewLayout(.fixed(width: 400, height: 600))
}
