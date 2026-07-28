//
//  OwnedPoop.swift
//  Pugupigiy
//
//  Created by Brian Chang on 29/07/26.
//
import Foundation
import SwiftData

@Model
final class OwnedPoop {
    @Attribute(.unique) var id: UUID
    var customName: String
    var species: PoopSpecies?                     // referensi ke katalog
    var weight: Double                            // diundi dari min...max species, permanen
    var obtainedAt: Date
    var fieldX: Double?                           // posisi di field; nil = di inventory
    var fieldY: Double?
    var isFavorite: Bool                          // dilindungi biar nggak kebuang

    init(id: UUID = UUID(),
         customName: String,
         species: PoopSpecies?,
         weight: Double,
         isFavorite: Bool = false) {
        self.id = id
        self.customName = customName
        self.species = species
        self.weight = weight
        self.obtainedAt = .now
        self.isFavorite = isFavorite
    }

    var isPlacedOnField: Bool { fieldX != nil && fieldY != nil }
}
