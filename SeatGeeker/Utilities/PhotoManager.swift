//
//  PhotoManager.swift
//  Your Pet
//
//  Created by ArmanG on 6/23/1399 AP.
//  Copyright © 1399 Pars Digital. All rights reserved.
//

import Foundation
import UIKit

class PhotoManager {
    
    var images = [UIImage?]()
    let session = URLSession.shared
    var documentURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    var id = Int()
    var imageFileNames = [String]()
    
    init() {
    }
    
    private  func generatePhotoName() {
        for index in 0..<images.count {
            imageFileNames.append("Animal_Image_" + String(id) + "_And_Index" + String(index) + ".png")
        }
        
    }
    
    func save() {
        generatePhotoName()
        do {
            for index in 0..<images.count {
                if let pngImageData = images[index]!.pngData() {
                    try? pngImageData.write(to: documentURL.appendingPathComponent(imageFileNames[index]) , options: .atomic)
                }
            }
            
        }
    }
    
    
    func load(image fromPath: String) -> UIImage? {
        var image = UIImage()
        let fileURL = documentURL.appendingPathComponent(fromPath)
        image = UIImage(contentsOfFile: fileURL.path)!
        return image
        
        
    }
}
