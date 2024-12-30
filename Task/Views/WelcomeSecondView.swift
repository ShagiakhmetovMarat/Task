//
//  WelcomeSecondView.swift
//  Task
//
//  Created by Marat Shagiakhmetov on 29.12.2024.
//

import SwiftUI

struct WelcomeSecondView: View {
    @State private var destination: String?
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                VStack {
                    Text("You can add texts and images to PDF documents. You can also save and delete them in you library. Tap 'Start' to begin.")
                        .font(.title3)
                    HStack {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                            Text("Previous")
                                .font(.title2)
                        }
                        Spacer()
                        NavigationLink(value: "MainListView") {
                            Text("Start")
                                .font(.title2)
                        }
                    }
                    .padding(20)
                    .navigationDestination(for: String.self) { destination in
                        if destination == "MainListView" {
                            MainListView()
                                .navigationBarBackButtonHidden(true)
                                .onAppear {
                                    welcomeScreenToggle()
                                }
                        }
                    }
                    
                }
                .padding(15)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
    
    private func welcomeScreenToggle() {
        UserDefaults.standard.welcomeScreen = false
    }
}

#Preview {
    WelcomeSecondView()
}
