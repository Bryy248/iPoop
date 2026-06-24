//
//  EditPoop.swift
//  iPoop
//
//  Created by Brian Chang on 20/06/26.
//

import SwiftUI

struct EditPoop: View {
    @State private var goToCollection = false

    var body: some View {
        NavigationStack{
            VStack (alignment: .leading) {
                PoopCard()
                
                Text("Edit Poop Detail")
                    .font(.body)
                    .padding(.top, 16)
                    .padding(.bottom, 8)
                
                VStack (spacing: 8) {
                    VStack (alignment: .leading, spacing: 4) {
                        HStack {
                            Text("Poop Name")
                            Spacer()
                            Image(systemName: "square.and.pencil")
                        }
                        .font(.subheadline)
                        Text("GoPoop")
                            .font(.footnote)
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
                    
                    VStack (alignment: .leading, spacing: 4) {
                        HStack {
                            Text("Poop Description")
                            Spacer()
                            Image(systemName: "square.and.pencil")
                        }
                        .font(.subheadline)
                        Text("GoPoop")
                            .font(.footnote)
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
                    VStack (alignment: .leading, spacing: 4) {
                        HStack {
                            Text("Food")
                            Spacer()
                            Image(systemName: "square.and.pencil")
                        }
                        .font(.subheadline)
                        Text("GoPoop")
                            .font(.footnote)
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
                    VStack (alignment: .leading, spacing: 4) {
                        HStack {
                            Text("Drink")
                            Spacer()
                            Image(systemName: "square.and.pencil")
                        }
                        .font(.subheadline)
                        Text("GoPoop")
                            .font(.footnote)
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
                
                Button(action: {
                    goToCollection = true
                }) {
                    
                    Text("Save Poop")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 40)
                        .background(
                            Capsule()
                                .tint(.blue)
                        )
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.vertical, 24)
                
                Spacer()
            }
            .frame(alignment: .top)
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
            
            NavigationLink(isActive: $goToCollection) {
                PoopCollectionView()
            } label: {
                EmptyView()
            }
            .hidden()
        }
    }
}

#Preview {
    EditPoop()
}
