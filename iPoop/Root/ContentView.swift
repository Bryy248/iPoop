//
//  ContentView.swift
//  iPoop
//
//  Created by Brian Chang on 16/06/26.
//

import SwiftUI

struct ContentView: View {
    enum AppTab: String, CaseIterable {
        case home = "Home"
        case poop = "Poop"
        
        var icon: String {
            switch self {
            case .home: return "house.fill"
            case .poop: return "nose"
            }
        }
        
    }
    @State var selectedTab: AppTab = .home
    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(AppTab.allCases, id: \.self) { tab in
                tabView(for: tab)
                    .tabItem {
                        Label(tab.rawValue, systemImage: tab.icon)
                    }
                    .tag(tab)
            }
        }
    }
    @ViewBuilder
    func tabView(for tab: AppTab) -> some View {
        switch tab {
        case .home: LogPageView()
        case .poop: Text("Poop")
        }
    }
}

#Preview {
    ContentView()
}
