//
//  EditPoop.swift
//  iPoop
//
//  Created by Brian Chang on 20/06/26.
//

import SwiftUI
import SwiftData

struct EditPoop: View {
    @Environment(AppRouter.self) private var router
    @Environment(\.modelContext) private var context
    
    let poop: Poop
    @State private var draft: PoopDraft
    
    init(poop: Poop) {
        self.poop = poop
        _draft = State(initialValue: PoopDraft(from: poop))  // kosong kalau poop baru
    }
    var body: some View {
        NavigationStack{
            VStack (alignment: .leading) {
                PoopCard(poop: poop)
                
                Text("Edit Poop Detail")
                    .font(.body)
                    .padding(.top, 16)
                    .padding(.bottom, 8)
                
//                VStack (spacing: 8) {
//                    VStack (alignment: .leading, spacing: 4) {
//                        HStack {
//                            Text("Poop Name")
//                            Spacer()
//                            Image(systemName: "square.and.pencil")
//                        }
//                        .font(.subheadline)
//                        Text("GoPoop")
//                            .font(.footnote)
//                    }
//                    .padding(16)
//                    .background(
//                        RoundedRectangle(cornerRadius: 8, style: .continuous)
//                            .fill(Color(.systemBackground))
//                    )
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 8, style: .continuous)
//                            .stroke(Color.black, lineWidth: 2)
//                    )
//                    
//                    VStack (alignment: .leading, spacing: 4) {
//                        HStack {
//                            Text("Poop Description")
//                            Spacer()
//                            Image(systemName: "square.and.pencil")
//                        }
//                        .font(.subheadline)
//                        Text("GoPoop")
//                            .font(.footnote)
//                    }
//                    .padding(16)
//                    .background(
//                        RoundedRectangle(cornerRadius: 8, style: .continuous)
//                            .fill(Color(.systemBackground))
//                    )
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 8, style: .continuous)
//                            .stroke(Color.black, lineWidth: 2)
//                    )
//                    VStack (alignment: .leading, spacing: 4) {
//                        HStack {
//                            Text("Food")
//                            Spacer()
//                            Image(systemName: "square.and.pencil")
//                        }
//                        .font(.subheadline)
//                        Text("GoPoop")
//                            .font(.footnote)
//                    }
//                    .padding(16)
//                    .background(
//                        RoundedRectangle(cornerRadius: 8, style: .continuous)
//                            .fill(Color(.systemBackground))
//                    )
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 8, style: .continuous)
//                            .stroke(Color.black, lineWidth: 2)
//                    )
//                    VStack (alignment: .leading, spacing: 4) {
//                        HStack {
//                            Text("Drink")
//                            Spacer()
//                            Image(systemName: "square.and.pencil")
//                        }
//                        .font(.subheadline)
//                        Text("GoPoop")
//                            .font(.footnote)
//                    }
//                    .padding(16)
//                    .background(
//                        RoundedRectangle(cornerRadius: 8, style: .continuous)
//                            .fill(Color(.systemBackground))
//                    )
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 8, style: .continuous)
//                            .stroke(Color.black, lineWidth: 2)
//                    )
//                }
                VStack(spacing: 8) {
                    field("Poop Name", text: $draft.name)
                    field("Poop Description", text: $draft.details)
                    field("Food", text: $draft.food)
                    field("Drink", text: $draft.drink)
                }
                
                Button(action: {
                    draft.apply(to: poop)                 // tulis draft ke model
                    if poop.modelContext == nil {         // poop baru → simpan
                        context.insert(poop)
                    }
                    router.editingPoop = nil              // pop EditPoop
                    router.selectedTab = .poop            // pindah ke tab Poop
                }) {
                    Text("Save Poop")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 40)
                        .background(
                            Capsule()
                                .fill(.blue)
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
        }
    }
    @ViewBuilder
        private func field(_ title: String, text: Binding<String>) -> some View {
            VStack(alignment: .leading, spacing: 4) {
                Text(title).font(.subheadline)
                TextField(title, text: text)        // sekarang beneran bisa diketik
                    .font(.footnote)
            }
            .padding(16)
            .background(RoundedRectangle(cornerRadius: 8, style: .continuous).fill(Color(.systemBackground)))
            .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous).stroke(.black, lineWidth: 2))
        }
}

#Preview {
    EditPoop(poop: Poop())
        .environment(AppRouter())
        .modelContainer(for: Poop.self, inMemory: true)
}

