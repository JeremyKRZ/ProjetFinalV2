//
//  ImageDownloader.swift
//  TestAPIProject
//
//  Created by Nicolas Davenne on 22/09/2022.
//

import Foundation

class ImageDownloader {
    static let shared = ImageDownloader()
    
    func fromUrlString(urlString: String, completion: @escaping((Data?) -> Void)) {
        guard let url = URL(string: urlString) else { completion(nil); return }
        URLSession.shared.dataTask(with: url, completionHandler: {d, _, _ in
            DispatchQueue.main.async {
                completion(d)
            }
        }).resume()
        
    }
}
