//
//  Poop.swift
//  iPoop
//
//  Created by Brian Chang on 16/06/26.
//

import Foundation
import SwiftData

enum PoopImage: String, Codable, CaseIterable {
    // TODO: tambah case gambar lain di sini
    case classic //-> Image("classic") // ini nanti diubah mengikuti nama image nya
}

@Model
final class Poop {

    // Identity
    var id: UUID

    // Text details
    var name: String
    var details: String
    var food: String
    var drink: String

    // Measurements — "randomize"
    var weightGrams: Float
    var heightCm: Float
    var lengthCm: Float

    var image: PoopImage

    // Timestamp
    var createdAt: Date

    init(
        name: String = "",
        details: String = "",
        food: String = "",
        drink: String = "",
        createdAt: Date = .now
    ) {
        self.id = UUID()
        self.name = name
        self.details = details
        self.food = food
        self.drink = drink
        self.createdAt = createdAt
        
        // Randomized defaults
        self.weightGrams = Float.random(in: 20...250).rounded(toPlaces: 1)
        self.heightCm    = Float.random(in: 2...15).rounded(toPlaces: 1)
        self.lengthCm    = Float.random(in: 5...40).rounded(toPlaces: 1)
        
        self.image = PoopImage.classic
    }
}

extension Poop {

    var age: String {
        let c = Calendar.current.dateComponents(
            [.year, .month, .day, .hour, .minute, .second],
            from: createdAt, to: .now
        )

        let year   = c.year   ?? 0
        let month  = c.month  ?? 0
        let day    = c.day    ?? 0
        let hour   = c.hour   ?? 0
        let minute = c.minute ?? 0
        let second = c.second ?? 0

        // bikin "1 hour", "5 minutes", dst (pakai 's' kalau jamak)
        func unit(_ value: Int, _ name: String) -> String {
            "\(value) \(name)\(value == 1 ? "" : "s")"
        }

        // >= 1 hari  -> pakai format tanggal seperti semula
        if year > 0 || month > 0 || day > 0 {
            var parts: [String] = []
            if year  > 0 { parts.append(unit(year,  "year")) }
            if month > 0 { parts.append(unit(month, "month")) }
            if day   > 0 { parts.append(unit(day,   "day")) }
            return parts.joined(separator: " ")
        }

        // < 1 hari, >= 1 jam  -> jam + menit  (detik dibuang)
        if hour > 0 {
            return "\(unit(hour, "hour")) \(unit(minute, "minute"))"
        }

        // < 1 jam, >= 1 menit -> menit + detik
        if minute > 0 {
            return "\(unit(minute, "minute")) \(unit(second, "second"))"
        }

        // < 1 menit -> detik saja
        if second > 0 {
            return unit(second, "second")
        }

        return "Just now"
    }

    // Format sesuai label di mockup.
    var weightText: String { String(format: "%.1fg",  weightGrams) }
    var heightText: String { String(format: "%.1fcm", heightCm) }
    var lengthText: String { String(format: "%.1fcm", lengthCm) }

    // Kunci per-hari, buat grup Collection per tanggal.
    var day: Date { Calendar.current.startOfDay(for: createdAt) }
}
