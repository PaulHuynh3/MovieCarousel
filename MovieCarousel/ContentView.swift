//
//  ContentView.swift
//  MovieCarousel
//
//  Created by Paul Huynh on 2023-09-20.
//

import SwiftUI

struct ContentView: View {
    
    private func getScale(proxy: GeometryProxy) -> CGFloat {
        var scale: CGFloat = 1
        
        let x = proxy.frame(in: .global).minX
        let diff = abs(x - 32)
        if diff < 100 {
            scale = 1 + (100 - diff) / 500
        }
        return scale
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                ScrollView(.horizontal) {
                    HStack(spacing: 50) {
                        ForEach(0..<20) { num in
                            GeometryReader { proxy in
                                
                                NavigationLink(destination: Image("ww1984")) {
                                    VStack {
                                        let scale = getScale(proxy: proxy)
                                        
                                        Image("ww1984")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 150)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 0.5)
                                            ) //Creates rectangular frame on the outside of image
                                            .clipped() //makes it alligned with Movie when using padding
                                            .cornerRadius(5)
                                            .shadow(radius: 5)
                                            .scaleEffect(CGSize(width: scale, height: scale)) //scale animation that cause it to zoom in/out with the help of geometryReader
                                            .animation(.easeOut(duration: 0.5)) //after coming back from detailedVC this gives easeOut effect
                                        
                                        Text("Wonder Woman 1984")
                                            .padding(.top)
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(Color.black)
                                    }
                                }
                            }
                            .frame(width: 125, height: 300)
                            
                        }
                    }.padding(32)
                    
                }.navigationTitle("Movies Carousel")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
