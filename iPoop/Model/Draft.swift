//
//  Draft.swift
//  iPoop
//
//  Created by Brian Chang on 17/06/26.
//

struct PoopDraft {
    var name: String
    var details: String
    var food: String
    var drink: String

    // isi draft dari poop yang ada
    init(from poop: Poop) {
        name    = poop.name
        details = poop.details
        food    = poop.food
        drink   = poop.drink
    }

    // tulis balik draft ke poop (dipanggil pas Save)
    func apply(to poop: Poop) {
        poop.name    = name
        poop.details = details
        poop.food    = food
        poop.drink   = drink
    }
}
