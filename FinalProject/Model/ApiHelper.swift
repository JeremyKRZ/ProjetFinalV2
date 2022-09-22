//
//  ApiHelper.swift
//  FinalProject
//
//  Created by Nicolas Davenne on 22/09/2022.
//

import Foundation

class ApiHelper {
    static let shared = ApiHelper()
    
    let apiEntryPoint = "https://randomuser.me/api/"
    let results = "results"
    let gender = "gender"
    
    
    func getUrl(results:Int, gender:GenderEnum) -> URL? {
        var urlString = apiEntryPoint + "?" + "\(self.results)=\(results)"
        if gender != .noGender {
            urlString += "&\(self.gender)=\(gender.rawValue)"
        }
        
        return URL(string: urlString)
    }
    
    func performRequest(results: Int, gender: GenderEnum, completion: @escaping(([ApiUser]) -> Void)) {
        if let url = getUrl(results: results, gender: gender) {
            URLSession.shared.dataTask(with: url) { data, _, _ in
                if let d = data {
                    let decoder = JSONDecoder()
                    do {
                        let results = try decoder.decode(ApiResults.self, from: d)
                        completion(results.results)
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                } else {
                    completion([])
                }
            }.resume()
        } else {
            completion([])
        }
    }
}

