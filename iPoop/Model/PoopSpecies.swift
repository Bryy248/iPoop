//
//  PoopSpecies.swift
//  Pugupigiy
//
//  Created by Brian Chang on 29/07/26.
//
import Foundation
import SwiftData

enum Rarity: String, Codable, CaseIterable, Identifiable {
    case common
    case rare
    case epic

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .common: return "Common"
        case .rare:   return "Rare"
        case .epic:   return "Epic"
        }
    }
}

@Model
final class PoopSpecies {
    @Attribute(.unique) var speciesID: String   // "common_1", "rare_2", dst
    var name: String
    var rarity: Rarity
    var spriteName: String
    var detail: String
    var spawnWeight: Double                       // peluang muncul
    var minWeight: Double                         // batas bawah berat varian ini
    var maxWeight: Double                         // batas atas berat varian ini

    @Relationship(deleteRule: .nullify, inverse: \OwnedPoop.species)
    var ownedInstances: [OwnedPoop] = []

    init(speciesID: String,
         name: String,
         rarity: Rarity,
         spriteName: String,
         detail: String = "",
         spawnWeight: Double = 1.0,
         minWeight: Double,
         maxWeight: Double) {
        self.speciesID = speciesID
        self.name = name
        self.rarity = rarity
        self.spriteName = spriteName
        self.detail = detail
        self.spawnWeight = spawnWeight
        self.minWeight = minWeight
        self.maxWeight = maxWeight
    }
}
