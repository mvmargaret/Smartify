//
//  ArtworksCollection.swift
//  Smartify
//
//  Created by Margarita Mayer on 17/11/23.
//

import Foundation
import SwiftUI

class ArtworksCollection {
    
    var artwork: [Artwork] = [
        Artwork(imageName: "starry-night", 
                name: "The Starry Night",
                author: "Vincent van Gogh",
                imageOfAuthor: "van-gogh",
                yearOfCreation: "Saint Rèmy, June 1889",
                technique: "Oil on canvas",
                size: "73.7 x 92.1 cm",
                reference: "Image and text - Museum of Modern Art, New York, 2019",
                imageOfGallery: "museum of modern art",
                placeOfStorage: "The Museum of Modern Art, New York",
                id: "Vincent van Gogh The Starry Night"),
        
        Artwork(imageName: "Over the Town...",
                name: "Over the town",
                author: "Marc Chagall",
                imageOfAuthor: "Shagal",
                yearOfCreation: "1918",
                technique: "Oil on canvas",
                size: "45.0 x 56.0 cm",
                reference: "Image courtesy of WikiArt",
                imageOfGallery: "tretyakovgallery", 
                placeOfStorage: "Tretyakov Gallery, Moscow",
                id: "Marc Chagall Over The Town"),
        
        Artwork(imageName: "Morning in a Pine Forest", 
                name: "Morning in a Pine Forest",
                author: "Ivan Shishkin and Konstantin Savitsky",
                imageOfAuthor: "ivan-shishkin",
                yearOfCreation: "1889",
                technique: "Oil on canvas",
                size: "139.0 x 213.0 cm",
                reference: "Image and text courtesy of Wikipedia, 2021",
                imageOfGallery: "tretyakovgallery",
                placeOfStorage: "Tretyakov Gallery, Moscow",
                id: "Shishkin The morning in a pine forest"),
        
        Artwork(imageName: "Demon Sitting....", 
                name: "The Demon Seated",
                author: "Mikhail Vrubel",
                imageOfAuthor: "mikhail-vrubel",
                yearOfCreation: "1890",
                technique: "Oil on canvas",
                size: "114.0 x 211.0 cm",
                reference: "Image and text courtesy of Wikipedia, 2021",
                imageOfGallery: "tretyakovgallery",
                placeOfStorage: "Tretyakov Gallery, Moscow",
                id: "Vrubel The Demon Seated"),
        
        Artwork(imageName: "Boyarynya Morozova....", 
                name: "Boyarynya Morozova",
                author: "Vasily Suricov",
                imageOfAuthor: "surikov",
                yearOfCreation: "1887",
                technique: "Oil on canvas",
                size: "304.0 x 587.5 cm",
                reference: "Image and text courtesy of Wikipedia, 2021",
                imageOfGallery: "tretyakovgallery",
                placeOfStorage: "Tretyakov Gallery, Moscow",
                id: "Surikov Boyarynya Morozova")
    ]
    
}



struct ImagesForArtworks {
    
    var imagesForArtworks: [Image] = [
     Image(systemName: "hourglass"),
     Image(systemName: "paintbrush.pointed"),
     Image(systemName: "ruler"),
     Image(systemName: "c.circle.fill")
    ]
}


