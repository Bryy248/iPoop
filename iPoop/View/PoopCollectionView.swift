//
//  PoopCollectionView.swift
//  iPoop
//
//  Created by Rafi Rasendrya Favian on 24/06/26.
//

import SwiftUI

struct PoopCollectionView: View {
    @State private var today: Date = .now
    @State private var didInitialScroll = false
    private let calendar = Calendar.current
    
    private struct DayItem: Identifiable {
        private let calendar = Calendar.current
        let id = UUID()
        let date: Date
        var monthAbbrev: String {
            let f = DateFormatter()
            f.locale = .current
            f.calendar = calendar
            f.setLocalizedDateFormatFromTemplate("MMM")
            return f.string(from: date).uppercased()
        }
        var dayNumber: String {
            let day = calendar.component(.day, from: date)
            return String(format: "%02d", day)
        }
    }
    
    private func generateDays(
        daysBefore: Int = 3,
        daysAfter: Int = 30
    ) -> [DayItem] {
        let start = calendar.startOfDay(for: today)
        var items: [DayItem] = []
        items.append(DayItem(date: start))
        
        for i in 1...daysAfter {
            if let d = calendar.date(byAdding: .day, value: i, to: start) {
                items.append(DayItem(date: d))
            }
        }
        
        var previous: [DayItem] = []
        for i in 1...daysBefore {
            if let d = calendar.date(byAdding: .day, value: -i, to: start) {
                previous.append(DayItem(date: d))
            }
        }
        items.insert(contentsOf: previous.reversed(), at: 0)
        
        return items
    }
    
    private var days: [DayItem] {
        generateDays(daysBefore: 3, daysAfter: 30)
    }
    
    private var todayID: UUID? {
        let start = calendar.startOfDay(for: today)
        return days.first(where: { calendar.isDate($0.date, inSameDayAs: start) })?.id
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("Poop Collection")
                    .font(.largeTitle).bold()
                    .padding(.top, 8)
                
                Text("Here is your poop collection so far!")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 12)
                
                ScrollViewReader { proxy in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(days) { item in
                                let isToday = calendar.isDate(item.date, inSameDayAs: today)
                                VStack(spacing: 4) {
                                    Text(item.monthAbbrev)
                                        .font(.caption2)
                                        .foregroundColor(.secondary)
                                    Text(item.dayNumber)
                                        .font(.caption).bold()
                                }
                                .padding(8)
                                .background(
                                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                                        .fill(isToday ? Color.blue.opacity(0.15) : Color.clear)
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                                        .stroke(isToday ? Color.blue : Color.black, lineWidth: 2)
                                )                                .id(item.id)
                            }
                        }
                        .padding(.vertical, 8)
                    }
                    .onAppear {
                        today = Date()
                        
                        guard !didInitialScroll, let id = todayID else { return }
                        didInitialScroll = true
                        
                        DispatchQueue.main.async {
                            withAnimation(.easeOut(duration: 0.25)) {
                                proxy.scrollTo(id, anchor: .leading)
                            }
                        }
                    }
                    .onDisappear {
                        didInitialScroll = false
                    }
                }
                ScrollView {
                    VStack(spacing: 12) {
                        PoopCard()
                        PoopCard()
                        PoopCard()
                    }
                }
            }
        }
        .padding(.horizontal, 16)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                HStack(spacing: 15) {
                    Image(systemName: "toilet")
                }
                .font(.title3)
                .foregroundColor(.black)
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                HStack(spacing: 15) {
                    Image(systemName: "person.circle")
                    Image(systemName: "bell")
                }
                .font(.title3)
                .foregroundColor(.black)
            }
        }
    }
}

#Preview {
    PoopCollectionView()
}
