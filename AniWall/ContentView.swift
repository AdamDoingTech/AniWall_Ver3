//
//  ContentView.swift
//  AniWall
//
//  Created by Adam O. on 2/4/22.
//

import SwiftUI
import SwURL

struct ContentView: View {
    var body: some View {
        VStack {
            GeometryReader { geo in
                Image("Image3")
                    .resizable()
                // Because I want the images to fill the whole screen no matter what the size is.
                    .scaledToFill()
                // in order to fill the screen to the edges.
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: .infinity)
                // The magic code snippit where, the safe ares is ignored in order to fill the screen as a whole.
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: geo.size.width, height: geo.size.height)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
          
    }
}


//let imageArray = ["Image1", "Image2", "Image3"]
