//
//  WelcomeView.swift
//  Task
//
//  Created by Marat Shagiakhmetov on 29.12.2024.
//

import SwiftUI

enum Screen: Hashable {
    case mainListView
    case welcomeSecondView
}

struct WelcomeView: View {
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                VStack {
                    Text("Welcome to Documents!")
                        .bold()
                        .font(.title)
                        .padding(10)
                    Text("The app will help you create PDF files. You can edit documents and share them with your fiends.")
                        .font(.title3)
                    HStack {
                        NavigationLink(value: Screen.mainListView) {
                            Text("Skip")
                                .font(.title2)
                        }
                        Spacer()
                        NavigationLink(value: Screen.welcomeSecondView) {
                            Text("Next")
                                .font(.title2)
                            Image(systemName: "chevron.right")
                        }
                    }
                    .padding(20)
                    .navigationDestination(for: Screen.self) { screen in
                        switch screen {
                        case .mainListView:
                            MainListView()
                                .navigationBarBackButtonHidden(true)
                                .onAppear {
                                    welcomeScreenToggle()
                                }
                        case .welcomeSecondView:
                            WelcomeSecondView()
                                .navigationBarBackButtonHidden(true)
                        }
                    }
                }
                .padding(15)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .toolbar(.hidden)
            }
        }
    }
    
    private func welcomeScreenToggle() {
        UserDefaults.standard.welcomeScreen = false
    }
}

#Preview {
    WelcomeView()
}
