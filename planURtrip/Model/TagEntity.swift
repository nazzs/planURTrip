//
//  TagEntity.swift
//  planURtrip
//
//  Created by Naz Sevim on 17.08.2023.
//

import Foundation

struct TagEntity: Codable {
    let id: Int
    let name: String
    let dinnerEntity: DinnerEntity
}
