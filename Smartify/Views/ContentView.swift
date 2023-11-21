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
    @State var isRecognised: Bool = false
    
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
                   
                    
                VStack {
                    if isRecognised {
                        if let filteredArtwork = artworksCollection.artwork.filter({ $0.id == prediction }).first {
                            ArtworkDetailView(artwork: filteredArtwork)
                        }
                    } else {
                        ScannerViewController(prediction: $prediction, isRecognised: $isRecognised)
                            
                    }
                }
                .tabItem { Label("Scan", systemImage: "camera") }
                .tag(3)
                Text("")
                    .tabItem { Label("Shop", systemImage: "cart") }
                    .tag(4)
                
                Text("")
                    .tabItem { Label("Profile", systemImage: "person") }
                    .tag(5)
                
                    
                
            }
            //            .fullScreenCover(isPresented: $isRecognised, content: {
            //                if let filteredArtwork = artworksCollection.artwork.filter({ $0.id == prediction }).first {
            //                    ArtworkDetailView(artwork: filteredArtwork)
            //                }
            //            })
            //            .sheet(isPresented: $isRecognised, content: {
            //                if let filteredArtwork = artworksCollection.artwork.filter({ $0.id == prediction }).first {
            //                    ArtworkDetailView(artwork: filteredArtwork)
            //                }
            //            })
        }
    }
}



#Preview {
    ContentView()
}
