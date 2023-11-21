//
//  ContentView.swift
//  Smartify
//
//  Created by Margarita Mayer on 15/11/23.
//

import SwiftUI
import CoreML
import Vision

struct ContentView: View {
    @State private var selection = 3
    @State private var recognisedArtwork: Bool = false
    @State var prediction: String = ""
    @State var isRecognised = false
    
    let artworksCollection = ArtworksCollection()
    
    
    var body: some View {
        NavigationView {
            
            TabView(selection: $selection) {
                Text("")
                    .tabItem { Label("Home", systemImage: "house") }
                    .tag(1)
                
                Text("")
                    .tabItem { Label("Explore", systemImage: "safari") }
                    .tag(2)
                
                ScannerViewController(prediction: $prediction, isRecognised: $isRecognised)
                    .tabItem { Label(prediction, systemImage: "camera") }
                    .tag(3)
//                    .background(
//                        NavigationLink(
//                            destination: recognisedArtwork.map { code -> AnyView in
//                                if let artwork = artworksCollection.artwork.first(where: { $0.name == code }) {
//                                    return AnyView(ArtworkDetailView(artwork: artwork))
//                                } else {
//                                    return AnyView(Text("Artwork not found"))
//                                }
//                            },
//                            label: { EmptyView() }
//                        )
//                    )
                Text("")
                    .tabItem { Label("Shop", systemImage: "cart") }
                    .tag(4)
                
                Text("")
                    .tabItem { Label("Profile", systemImage: "person") }
                    .tag(5)
            }
//            .sheet(isPresented: $isRecognised, content: {
//                ArtworkDetailView(artwork: artworksCollection.artwork[1])
//            })
        }
    }
}



#Preview {
    ContentView()
}
