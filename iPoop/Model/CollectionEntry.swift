//
//  CollectionEntry.swift
//  Pugupigiy
//
//  Created by Brian Chang on 29/07/26.
//
import Foundation
import SwiftData

@Model
final class CollectionEntry {
    @Attribute(.unique) var speciesID: String
    var isDiscovered: Bool
    var timesObtained: Int
    var firstObtainedAt: Date?

    init(speciesID: String,
         isDiscovered: Bool = false,
         timesObtained: Int = 0,
         firstObtainedAt: Date? = nil) {
        self.speciesID = speciesID
        self.isDiscovered = isDiscovered
        self.timesObtained = timesObtained
        self.firstObtainedAt = firstObtainedAt
    }
}
