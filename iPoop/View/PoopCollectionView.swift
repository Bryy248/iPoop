//
//  PoopCollectionView.swift
//  iPoop
//
//  Created by Rafi Rasendrya Favian on 24/06/26.
//

import SwiftUI

struct PoopCollectionView: View {
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

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(0..<8, id: \.self) { i in
                            VStack(spacing: 4) {
                                Text("JUN")
                                    .font(.caption2)
                                    .foregroundColor(.secondary)
                                Text(String(format: "%02d", 8 + i))
                                    .font(.caption).bold()
                            }
                            .padding(8)
                            .background(
                                RoundedRectangle(cornerRadius: 8, style: .continuous)
                                    .stroke(Color.black, lineWidth: 2)
                            )
                        }
                    }
                    .padding(.vertical, 8)
                }

                ScrollView {
                    LazyVStack(spacing: 12) {
                        PoopCard()
                        PoopCard()
                        PoopCard()
                    }
                    .padding(.vertical, 8)
                }

                Spacer()
            }
            .padding(16)
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
}

#Preview {
    PoopCollectionView()
}
