//
//  PoopCard.swift
//  iPoop
//
//  Created by Brian Chang on 20/06/26.
//

import SwiftUI

struct PoopCard: View {
    let poop: Poop
    var draft: PoopDraft? = nil   // optional, buat live preview

    // pakai draft kalau ada, kalau nggak fallback ke model
    private var name: String    { draft?.name    ?? poop.name }
    private var details: String { draft?.details ?? poop.details }
    private var food: String    { draft?.food    ?? poop.food }
    private var drink: String   { draft?.drink   ?? poop.drink }
    
    @ViewBuilder
        private func valueText(_ value: String, placeholder: String) -> some View {
            if value.isEmpty {
                Text(placeholder)
                    .foregroundStyle(.secondary)   // pudar/abu-abu
            }
            else {
                Text(value)
            }
        }

    private struct DetailRow: View {
        let label: String
        let valueView: AnyView

        var body: some View {
            GridRow {
                Text(label)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .gridColumnAlignment(.leading)
                valueView
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }

    var body: some View {
        VStack(spacing: 16) {
            Grid(alignment: .leading, horizontalSpacing: 8, verticalSpacing: 8) {
                GridRow {
                    Rectangle()
                        .foregroundStyle(.secondary)
                        .frame(width: 100, height: 100)

                    VStack(alignment: .leading, spacing: 8) {
                        valueText(name, placeholder: "Poop Name")
                            .font(.title3)
                            .fontWeight(.bold)
                        valueText(details, placeholder: "Poop Description")
                            .font(.subheadline)
                    }
                    .gridCellAnchor(.topLeading)
                }

                DetailRow(label: "Food", valueView: AnyView(valueText(food, placeholder: "Food")))
                DetailRow(label: "Drink", valueView: AnyView(valueText(drink, placeholder: "Drink")))
                DetailRow(label: "Age",  valueView: AnyView(Text(poop.age)))
            }

            HStack {
                Label(poop.weightText, systemImage: "scalemass.fill")
                    .font(.subheadline)
                Spacer()
                Label(poop.heightText, systemImage: "arrow.up.and.down")
                    .font(.subheadline)
                Spacer()
                Label(poop.lengthText, systemImage: "ruler.fill")
                    .font(.subheadline)
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(Color(.systemBackground))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .stroke(Color.black, lineWidth: 2)
        )
    }
}

#Preview {
    PoopCard(poop: Poop(name: "GoPoop",
                        details: "Poop pas lagi di toilet GOP 9, mules banget bray",
                        food: "Sosis Kasturi",
                        drink: "Es Teh Manis"))
}
