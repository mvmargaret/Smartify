//
//  ContentView.swift
//  Smartify
//
//  Created by Margarita Mayer on 15/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 3
    @State private var scannedCode: String?
    
    var body: some View {
        NavigationView {
            TabView(selection: $selection) {
                Text("")
                    .tabItem { Label("Home", systemImage: "house") }
                    .tag(1)
                
                Text("")
                    .tabItem { Label("Explore", systemImage: "safari") }
                    .tag(2)
                
                Text("")
                    .tabItem { Label("Shop", systemImage: "cart") }
                    .tag(4)
                
                Text("")
                    .tabItem { Label("Profile", systemImage: "person") }
                    .tag(5)
                
                ScanningView { scannedCode in
                    
                    self.scannedCode = scannedCode
                }
                .tabItem { Label("Scan", systemImage: "camera") }
                .tag(3)
                .navigationTitle("Scanner")
                .navigationBarHidden(true)
                .background(
                    NavigationLink(
                        destination: scannedCode.map { code -> AnyView in
                            if let artwork = artworksCollection.artwork.first(where: { $0.name == code }) {
                                return AnyView(ArtworkDetailView(artwork: artwork))
                            } else {
                                return AnyView(Text("Artwork not found"))
                            }
                        },
                        label: { EmptyView() }
                    )
                )
                
            }
            
        }
    }
}


let artworksCollection = ArtworksCollection()


#Preview {
    ContentView()
}
