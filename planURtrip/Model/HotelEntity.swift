//
//  HotelEntity.swift
//  planURtrip
//
//  Created by Naz Sevim on 17.08.2023.
//

import Foundation

struct HotelEntity: Codable {
    let id: String
    let name: String
    let image: String
    let rate: Float
    let type: Int
    let pricePerNight: Float
    let cardEntity: CardEntity
}
