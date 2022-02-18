//
//  ContentView.swift
//  AniWall
//
//  Created by Adam O. on 2/4/22.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
            ZStack(alignment: .bottom) {
                AsyncImage(
                    url: URL(string: networkManager.imageModel?.url ?? ""),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                            .ignoresSafeArea()
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                
                LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom)
                    .frame(height: 450)
                
                VStack {
                    HStack {
                        Spacer()
                        Button {
                            // The function here
                        } label: {
                            Image(systemName: "square.and.arrow.down.on.square.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 55, height: 55, alignment: .bottomLeading)
                                .foregroundStyle(.white)
//                                .padding(.bottom)
                        }
                        Spacer()
                    }
                    Spacer()
                        .frame(height: 80)
                }
                
            }
            .onTapGesture {
                networkManager.fetch()
            }
            .onAppear { networkManager.fetch() }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//let imageArray = ["Image1", "Image2", "Image3"]
