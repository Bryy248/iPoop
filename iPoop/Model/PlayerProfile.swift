//
//  PlayerProfile.swift
//  Pugupigiy
//
//  Created by Brian Chang on 29/07/26.
//
import Foundation
import SwiftData

@Model
final class PlayerProfile {
    @Attribute(.unique) var pugupigiyID: String
    var username: String
    var createdAt: Date
    var lastLoginAt: Date

    init(pugupigiyID: String, username: String) {
        self.pugupigiyID = pugupigiyID
        self.username = username
        self.createdAt = .now
        self.lastLoginAt = .now
    }
}
