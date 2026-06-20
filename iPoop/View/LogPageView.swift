//  LogPageView.swift
//  iPoop
//
//  Created by Haikal Izzanour on 20/06/26.
//

import SwiftUI

struct LogPageView: View {
    @State private var goToEdit = false
    var body: some View {
        
        NavigationStack {
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Log Your Poop!")
                            .font(.system(size: 36, weight: .bold))
                            .foregroundColor(.black)
                        
                        Text("Click Add to create log of your poop!")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 16)
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(.systemGray6))
                    
                    Text("Gambar Poop")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 400)
                .padding(.horizontal)
                
                Button(action: {
                    goToEdit = true
                }) {
                    Text("Add Poop")
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
            .navigationDestination(isPresented: $goToEdit) {
                EditPoop()
            }
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
    LogPageView()
}
