//
//  SpotifyStickyHeaderDetail.swift
//  AnimationPortfolioiOSApp
//
//  Created by Federico Pregnolato on 24/12/23.
//

import SwiftUI

struct SpotifyStickyHeaderDetail: View {
    var body: some View {
        GeometryReader{
            let safeArea = $0.safeAreaInsets
            let size = $0.size
            SpotifyHome(safeArea: safeArea, size: size)
                .ignoresSafeArea(.container, edges: .top)
                .navigationBarBackButtonHidden()
        }
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    SpotifyStickyHeaderDetail()
}
