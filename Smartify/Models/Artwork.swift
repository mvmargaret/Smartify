//
//  Artwork.swift
//  Smartify
//
//  Created by Margarita Mayer on 17/11/23.
//

import Foundation
import SwiftUI

struct Artwork: Identifiable {
    var imageName: String
    var name: String
    var author: String
    var imageOfAuthor: String
    var description: String?
    var details: String = "Details"
    var yearOfCreation: String
    var technique: String
    var size: String
    var reference: String
    var whereStored = "Where you'll find this"
    var imageOfGallery: String
    var placeOfStorage: String
    var id: String
    var image1 = Image(systemName: "hourglass")
    var image2 = Image(systemName: "paintbrush.pointed")
    var image3 = Image(systemName: "ruler")
    var image4 = Image(systemName: "c.circle.fill")
}


