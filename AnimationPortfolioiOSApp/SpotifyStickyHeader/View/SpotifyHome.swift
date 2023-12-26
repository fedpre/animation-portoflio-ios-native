//
//  SpotifyHome.swift
//  AnimationPortfolioiOSApp
//
//  Created by Federico Pregnolato on 26/12/23.
//

import SwiftUI

struct SpotifyHome: View {
    @Environment(\.dismiss) var dismiss
    var safeArea: EdgeInsets
    var size: CGSize
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack{
                ArtWork()
                MainButton()
                AlbumView()
            }
            .overlay(alignment: .top) {
                HeaderView()
            }
        }
        .coordinateSpace(name: "SCROLL")
        .background(.customBlack)
    }
    
    @ViewBuilder
    func HeaderView()->some View {
        
        GeometryReader{proxy in
            let minY = proxy.frame(in: .named("SCROLL")).minY
            let height = size.height * 0.45
            let progress = minY / (height * (minY > 0 ? 0.5 : 0.8))
            let titleProgress = minY / height
            HStack(spacing: 15) {
                Button {
                    dismiss()
                } label: {
                   Image(systemName: "chevron.left")
                        .font(.title3)
                        .foregroundStyle(.white)
                }
                
                Spacer(minLength: 0)
                
                Button {
                    
                } label: {
                    Text("FOLLOWING")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .border(.white, width: 1.5)
                }
                .opacity(1 + progress)
                Button {
                    
                } label: {
                   Image(systemName: "ellipsis")
                        .font(.title3)
                        .foregroundStyle(.white)
                }
            }
            .overlay(content: {
                Text("Jan Blomqvist")
                    .fontWeight(.semibold)
                    .offset(y: -titleProgress > 0.75 ? 0 : 54)
                    .clipped()
                    .animation(.easeInOut(duration: 0.25), value: -titleProgress > 0.75)
            })
            .padding(.top, safeArea.top + 10)
            .padding([.horizontal, .bottom], 15)
            .background(content: {
                Color.customBlack
                    .opacity(-progress > 1 ? 1 : 0)
            })
            .offset(y: -minY)
        }
        .frame(height: 35)
    }
    
    @ViewBuilder
    func AlbumView()->some View {
        VStack(spacing: 25){
            ForEach(albums.indices, id: \.self){index in
                HStack(spacing: 25){
                    Text("\(index + 1)")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundStyle(.gray)
                    VStack(alignment: .leading, spacing: 6) {
                        Text(albums[index].albumName)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                        
                        Text("2,282,982")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Image(systemName: "ellipsis")
                        .foregroundStyle(.gray)
                    
                }
            }
        }
        .padding(15)
    }
    
    @ViewBuilder
    func MainButton()->some View {
        GeometryReader{proxy in
            let minY = proxy.frame(in: .named("SCROLL")).minY - safeArea.top
            Button {
                
            } label: {
                Text("SHUFFLE PLAY")
                    .font(.callout)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 45)
                    .padding(.vertical, 12)
                    .background {
                        Capsule()
                            .fill(Color("SpotifyGreen").gradient)
                    }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .offset(y: minY < 50 ? -(minY - 50) : 0)
        }
        .frame(height: 50)
        .padding(.top, -34)
        .zIndex(1)
        
        VStack {
            GeometryReader{proxy in
                let minY = proxy.frame(in: .named("SCROLL")).minY - safeArea.top
                 Text("Popular")
                    .fontWeight(.heavy)
                    .opacity(minY < 65 ? 0 : 1)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .padding(.top, 10)
        .zIndex(0)
    }
    
    @ViewBuilder
    func ArtWork()->some View {
        let height = size.height * 0.45
        
        GeometryReader{proxy in
           let size = proxy.size
            let minY = proxy.frame(in: .named("SCROLL")).minY
            let progress = minY / (height * (minY > 0 ? 0.5 : 0.8))
            
            Image("Artwork")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: size.width, height: size.height + (minY > 0 ? minY : 0))
                .clipped()
                .overlay(content: {
                    ZStack(alignment: .bottom) {
                        Rectangle()
                            .fill(
                                .linearGradient(colors: [
                                    .customBlack.opacity(0 - progress),
                                    .customBlack.opacity(0.1 - progress),
                                    .customBlack.opacity(0.3 - progress),
                                    .customBlack.opacity(0.5 - progress),
                                    .customBlack.opacity(0.8 - progress),
                                    .customBlack.opacity(1),
                                ], startPoint: .top, endPoint: .bottom)
                            )
                        
                        VStack(spacing: 0) {
                            Text("Jan\nBlomqvist")
                                .font(.system(size: 45))
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                            Text("509,082 Monthly Listeners".uppercased())
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundStyle(.gray)
                                .padding(.top, 15)
                        }
                        .padding(.bottom, 55)
                        .opacity(1 + (minY > 0 ? -progress : progress))
                        .offset(y: minY < 0 ? minY : 0)
                    }
                })
                .offset(y: -minY)
        }
        .frame(height: height)
    }
}

#Preview {
    GeometryReader{
        let safeArea = $0.safeAreaInsets
        let size = $0.size
        SpotifyHome(safeArea: safeArea, size: size)
            .ignoresSafeArea(.container, edges: .top)
    }
    .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
