//
//  PoopCard.swift
//  iPoop
//
//  Created by Brian Chang on 20/06/26.
//

import SwiftUI

struct PoopCard: View {
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
        VStack (spacing: 16){
            Grid(alignment: .leading, horizontalSpacing: 8, verticalSpacing: 8) {
                GridRow {
                    Rectangle()
                        .foregroundStyle(.secondary)
                        .frame(width: 100, height: 100)

                    VStack(alignment: .leading, spacing: 8) {
                        Text("GoPoop")
                            .font(.title3)
                            .fontWeight(.bold)
                        Text("Poop pas lagi di toilet GOP 9, mules banget bray")
                            .font(.subheadline)
                    }
                    .gridCellAnchor(.topLeading)
                }

                DetailRow(label: "Food", value: "Sosis Kasturi")
                DetailRow(label: "Drink", value: "Es Teh Manis")
                DetailRow(label: "Age", value: "9 months 12 days")
            }
            
            HStack {
                Label("24.0g", systemImage: "scalemass.fill")
                    .font(.subheadline)
                Spacer()
                Label("9.0cm", systemImage: "arrow.up.and.down")
                    .font(.subheadline)
                Spacer()
                Label("24.0cm", systemImage: "ruler.fill")
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
    PoopCard()
}
