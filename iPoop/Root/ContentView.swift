//
//  ContentView.swift
//  iPoop
//
//  Created by Brian Chang on 16/06/26.
//

import SwiftUI

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

@Observable
final class AppRouter {
    var selectedTab: AppTab = .home
    var editingPoop: Poop?
}

struct ContentView: View {
    @State private var router = AppRouter()

    var body: some View {
        TabView(selection: $router.selectedTab) {
            ForEach(AppTab.allCases, id: \.self) { tab in
                tabView(for: tab)
                    .tabItem {
                        Label(tab.rawValue, systemImage: tab.icon)
                    }
                    .tag(tab)
            }
        }
        .environment(router)   // sebarkan router ke semua child view (termasuk EditPoop)
    }

    @ViewBuilder
    func tabView(for tab: AppTab) -> some View {
        switch tab {
        case .home: LogPageView()
        case .poop: PoopCollectionView()
        }
    }
}

#Preview {
    ContentView()
}
