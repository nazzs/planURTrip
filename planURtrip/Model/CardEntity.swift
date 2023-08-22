//
//  CardEntity.swift
//  planURtrip
//
//  Created by Naz Sevim on 17.08.2023.
//

import Foundation

struct CardEntity: Codable {
    let id: String
    let name: String
    let image: String
    let rate: Float
    let type: Int
    let pricePerNight: Float
    let cityEntity: CityEntity
    let locationEntity: LocationEntity
}
