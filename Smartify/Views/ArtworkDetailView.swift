//
//  ArtworkDetailView.swift
//  Smartify
//
//  Created by Margarita Mayer on 17/11/23.
//

import SwiftUI

struct ArtworkDetailView: View {
    
    var artwork: Artwork
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading, spacing: 10) {
                
                Image(artwork.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: UIScreen.main.bounds.height / 4)
                    .clipped()
                    .edgesIgnoringSafeArea(.top)
                    .padding()
                
                
//                VStack(alignment: .leading, spacing: 8) {
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
                    
                    Text(artwork.aboutDetails)
                        .font(.subheadline)
                    
                    
                    Text(artwork.whereStored)
                        .font(.title3)
                        .bold()
                        .padding(.top)
                    
                    Text(artwork.placeOfStorage)
                        .font(.subheadline)
                    
//                }
                
                Image(artwork.imageOfGallery)
                    .resizable()
                    .scaledToFit()
                    .frame(height: UIScreen.main.bounds.height / 3.8)
                
            }
            .multilineTextAlignment(.leading)
            .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 1))
            
           
        }
        
    }
    
}


#Preview {
    ArtworkDetailView(artwork:  Artwork(imageName: "starry-night", name: "The Starry Night", author: "Vincent van Gogh", imageOfAuthor: "van-gogh", aboutDetails: """
Saint Rèmy, June 1889
Oil on canvas
73.7 x 92.1 cm
Image and text - Museum of Modern Art, New York, 2019
""", imageOfGallery: "museum of modern art", placeOfStorage: "The Museum of Modern Art, New York"))
}
