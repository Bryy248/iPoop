//
//  Helper.swift
//  iPoop
//
//  Created by Brian Chang on 17/06/26.
//
import Foundation

extension Float {
    func rounded(toPlaces places: Int) -> Float {
        let f = pow(10.0, Float(places))
        return (self * f).rounded() / f
    }
}

extension Date {
    static func make(
        _ year: Int,
        _ month: Int,
        _ day: Int,
        hour: Int = 0,
        minute: Int = 0,
        second: Int = 0
    ) -> Date {
        var c = DateComponents()
        c.year   = year
        c.month  = month
        c.day    = day
        c.hour   = hour
        c.minute = minute
        c.second = second
        return Calendar.current.date(from: c) ?? .now
    }
}
