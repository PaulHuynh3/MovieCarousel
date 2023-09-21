//
//  ContentView.swift
//  MovieCarousel
//
//  Created by Paul Huynh on 2023-09-20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(0..<20) { num in
                            Text(num.description)
                                .padding()
                                .background(.red)
                        }
                    }
                }
                
            }.navigationTitle("Movies Carousel")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
