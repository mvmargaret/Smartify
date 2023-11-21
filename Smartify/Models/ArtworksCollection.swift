//
//  ArtworksCollection.swift
//  Smartify
//
//  Created by Margarita Mayer on 17/11/23.
//

import Foundation

class ArtworksCollection {
    
    var artwork: [Artwork] = [
        Artwork(imageName: "starry-night", 
                name: "The Starry Night",
                author: "Vincent van Gogh",
                imageOfAuthor: "van-gogh",
                aboutDetails: """
Saint Rèmy, June 1889
Oil on canvas
73.7 x 92.1 cm
Image and text - Museum of Modern Art, New York, 2019
""", 
                imageOfGallery: "museum of modern art",
                placeOfStorage: "The Museum of Modern Art, New York",
                id: "Vincent van Gogh The Starry Night"),
        
        Artwork(imageName: "Over the Town...", name: "Over the town", author: "Marc Chagall", imageOfAuthor: "Shagal", aboutDetails: """
1918
Oil on canvas
45.0 x 56.0 cm
Image courtesy of WikiArt
""", imageOfGallery: "tretyakovgallery", placeOfStorage: "Tretyakov Gallery, Moscow", id: "Marc Chagall Over The Town"),
        
        Artwork(imageName: "Morning in a Pine Forest", name: "Morning in a Pine Forest", author: "Ivan Shishkin and Konstantin Savitsky", imageOfAuthor: "ivan-shishkin", aboutDetails: """
1889
Oil on canvas
139.0 x 213.0 cm
Image and text courtesy of Wikipedia, 2021
""", imageOfGallery: "tretyakovgallery", placeOfStorage: "Tretyakov Gallery, Moscow", id: "Shishkin The morning in a pine forest"),
        
        Artwork(imageName: "Demon Sitting....", name: "The Demon Seated", author: "Mikhail Vrubel", imageOfAuthor: "mikhail-vrubel", aboutDetails: """
1890
Oil on canvas
114.0 x 211.0 cm
Image and text courtesy of Wikipedia, 2021
""", imageOfGallery: "tretyakovgallery", placeOfStorage: "Tretyakov Gallery, Moscow", id: "Vrubel The Demon Seated"),
        
        Artwork(imageName: "Boyarynya Morozova....", name: "Boyarynya Morozova", author: "Vasily Suricov", imageOfAuthor: "surikov", aboutDetails: """
1887
Oil on canvas
304.0 x 587.5 cm
Image and text courtesy of Wikipedia, 2021
""", imageOfGallery: "tretyakovgallery", placeOfStorage: "Tretyakov Gallery, Moscow", id: "Surikov Boyarynya Morozova")
    ]
    
}
