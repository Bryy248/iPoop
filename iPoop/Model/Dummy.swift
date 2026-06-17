//
//  Dummy.swift
//  iPoop
//
//  Created by Brian Chang on 17/06/26.
//

extension Poop {
    static var sampleData: [Poop] {
        [
            Poop(name: "Gopoop", details: "Poop pas lagi di toilet GOP 9, mules banget bray",
                 food: "Sosis Kasturi", drink: "Kopi Anak Hukum",
                 createdAt: .make(2026, 6, 17, hour: 7,  minute: 12)),

            Poop(name: "Mantul", details: "Lega banget abis ini",
                 food: "Nasi Padang", drink: "Es Teh",
                 createdAt: .make(2026, 6, 17, hour: 11, minute: 45)),

            Poop(name: "Gercep", details: "Cepet kelar, gas lagi kerja",
                 food: "Indomie", drink: "Kopi Hitam",
                 createdAt: .make(2026, 6, 16, hour: 20, minute: 30, second: 5)),

            Poop(name: "Santuy", details: "Sambil scroll HP, no rush",
                 food: "Seblak", drink: "Es Kopi Susu",
                 createdAt: .make(2026, 6, 15, hour: 9,  minute: 5)),

            Poop(name: "Lemes", details: "Abis makan pedes kemarin",
                 food: "Ayam Geprek", drink: "Teh Tarik",
                 createdAt: .make(2026, 6, 14, hour: 18, minute: 22)),

            Poop(name: "Ngebut", details: "Kebelet pas di jalan",
                 food: "Gorengan", drink: "Es Jeruk",
                 createdAt: .make(2026, 6, 12, hour: 13, minute: 50)),

            Poop(name: "Sigma", details: "Pagi-pagi udah produktif",
                 food: "Bakso", drink: "Kopi Anak Hukum",
                 createdAt: .make(2026, 6, 11, hour: 6,  minute: 40)),
        ]
    }
}
