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
    
    var image = UIImage()
    let session = URLSession.shared
    var documentURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//    var id = Int()
    var localmageURL: String {
        return imageFileName
    }
    private var imageFileName = ""
    
    init() {}
    
    private func generatePhotoName(_ id: Int) -> String {
        return "Event_Image_" + String(id) + ".png"
    }
    
    func save(eventID: Int) -> String {
       let imgName =  generatePhotoName(eventID)
        do {
            if let pngImageData = image.pngData() {
                try? pngImageData.write(to: documentURL.appendingPathComponent(imgName) , options: .atomic)
            }
        }
        return imgName
    }
    
    func load(image fromPath: String) -> UIImage? {
        var image = UIImage()
        let fileURL = documentURL.appendingPathComponent(fromPath)
        image = UIImage(contentsOfFile: fileURL.path)!
        return image
    }
}
