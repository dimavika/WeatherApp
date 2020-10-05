//
//  ApiService.swift
//  WeatherApp
//
//  Created by Димас on 05.10.2020.
//

import Foundation
import Alamofire

class ApiService<Entity: Codable> {
    
    var onComplition: ((Entity) -> Void)?
    
    public init() {}
    
    func fetchData(forURL url: URL) {
        let dataRequest = AF.request(url)
        dataRequest.responseDecodable(of: Entity.self) { res in
            if let entity = res.value {
                self.onComplition?(entity)
            }
        }
        
    }
}
