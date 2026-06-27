//
//  PoopCard.swift
//  iPoop
//
//  Created by Brian Chang on 20/06/26.
//

import SwiftUI

struct PoopCard: View {
    let poop: Poop

    private struct DetailRow: View {
        let label: String
        let value: String

        var body: some View {
            GridRow {
                Text(label)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .gridColumnAlignment(.leading)
                Text(value)
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
                        Text(poop.name)
                            .font(.title3)
                            .fontWeight(.bold)
                        Text(poop.details)
                            .font(.subheadline)
                    }
                    .gridCellAnchor(.topLeading)
                }

                DetailRow(label: "Food",  value: poop.food)
                DetailRow(label: "Drink", value: poop.drink)
                DetailRow(label: "Age",   value: poop.age)
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
