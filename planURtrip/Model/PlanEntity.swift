//
//  Plan.swift
//  planURtrip
//
//  Created by Naz Sevim on 14.08.2023.
//

import Foundation

struct PlanEntity: Codable {
    let id: Int
    let day: Int
    let hotelEntity: HotelEntity
    let dinnerEntity: DinnerEntity
    let placeEntity: PlaceEntity
}
