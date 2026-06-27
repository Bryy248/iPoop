//
//  iPoopApp.swift
//  iPoop
//
//  Created by Brian Chang on 16/06/26.
//

import SwiftUI
import SwiftData

@main
struct iPoopApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Poop.self)
    }
}
