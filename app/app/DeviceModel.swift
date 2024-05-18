//
//  DeviceModel.swift
//  app
//
//  Created by Elviro Dominguez Soriano on 18/05/24.
//

import Foundation

struct DeviceModel: Decodable {
    let _id: String
    let name: String
    let status: Bool
    let ip: String
    let consumption: Int
    
    enum CodingKeys: String, CodingKey {
        case _id
        case name
        case status
        case ip
        case consumption
    }
}
