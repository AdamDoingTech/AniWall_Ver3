//
//  ContentView.swift
//  AniWall
//
//  Created by Adam O. on 2/4/22.
//

import SwiftUI
import SwURL

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        NavigationView {
            VStack {
                
                    Color.black
                    AsyncImage(
                             url: URL(string: networkManager.imageModel?.url ?? ""),
                             content: { image in
                                 image.resizable()
                                      .aspectRatio(contentMode: .fill)
                                      .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                             },
                             placeholder: {
                                 ProgressView()
                             }
                         )
                        .onTapGesture {
                            networkManager.fetch()
                        }
                        .onAppear { networkManager.fetch() }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//let imageArray = ["Image1", "Image2", "Image3"]
