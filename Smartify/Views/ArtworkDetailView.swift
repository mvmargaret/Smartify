//
//  ArtworkDetailView.swift
//  Smartify
//
//  Created by Margarita Mayer on 17/11/23.
//

import SwiftUI

struct ArtworkDetailView: View {
    
    var artworkCollection = ArtworksCollection()
    var artwork: Artwork
    
    @Binding var isRecognised: Bool
    
    var body: some View {
        
        ScrollView {
            
            HStack {
                Spacer()
                Button("Close") {
                    withAnimation {
                        isRecognised.toggle()
                    }
                }
                .padding(.trailing) // Optional: Add padding to the button for better appearance
            }
            
            Image(artwork.imageName)
                .resizable()
                .scaledToFit()
//                .frame(height: UIScreen.main.bounds.height / 4)
                .clipped()
                .edgesIgnoringSafeArea(.top)
                .padding(EdgeInsets(top: 0, leading: 30, bottom: 10, trailing: 30))
//                .padding()
            
            
            VStack(alignment: .leading, spacing: 10) {
                

                Text(artwork.name)
                    .multilineTextAlignment(.leading)
                    .font(.title2)
                    .bold()
                
                HStack {
                    Image(artwork.imageOfAuthor)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 30)
                        .clipShape(Circle())
                    
                    Text(artwork.author)
                        .font(.subheadline)
                        .foregroundStyle(.black)
                        .multilineTextAlignment(.leading)
                    
                }
                
                Text(artwork.details)
                    .font(.title3)
                    .bold()
                    .padding(.top)
                
                    
                    HStack {
                        Image(systemName: "hourglass")
                        Text(artwork.yearOfCreation)
                    }
                    .font(.subheadline)
                    
                    HStack {
                        Image(systemName: "paintbrush.pointed")
                        Text(artwork.technique)
                    }
                    .font(.subheadline)
                    
                    HStack {
                        Image(systemName: "ruler")
                        Text(artwork.size)
                    }
                    .font(.subheadline)
                    
                    HStack {
                        Image(systemName: "c.circle")
                        Text(artwork.reference)
                    }
                    .font(.subheadline)
    
                
                Text(artwork.whereStored)
                    .font(.title3)
                    .bold()
                    .padding(.top)
                
                Text(artwork.placeOfStorage)
                    .font(.subheadline)
                
                Image(artwork.imageOfGallery)
                    .resizable()
                    .scaledToFit()
                    .frame(height: UIScreen.main.bounds.height / 3.6)
                
            }
            .multilineTextAlignment(.leading)
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
            
          
                
            
        }
        .offset(y: isRecognised ? 0 : UIScreen.main.bounds.height)
        
    }
    
}


#Preview {
    ArtworkDetailView(artwork:  Artwork(imageName: "Demon Sitting....",
                                        name: "The Demon Seated",
                                        author: "Mikhail Vrubel",
                                        imageOfAuthor: "mikhail-vrubel",
                                        yearOfCreation: "1890",
                                        technique: "Oil on canvas",
                                        size: "114.0 x 211.0 cm",
                                        reference: "Image and text courtesy of Wikipedia, 2021",
                                        imageOfGallery: "tretyakovgallery",
                                        placeOfStorage: "Tretyakov Gallery, Moscow",
                                        id: "Vrubel The Demon Seated"), isRecognised: .constant(true))
}
