//
//  ContentView.swift
//  Task
//
//  Created by Marat Shagiakhmetov on 28.12.2024.
//

import SwiftUI

extension UserDefaults {
    var welcomeScreen: Bool {
        get {
            UserDefaults.standard.value(forKey: "welcomeScreen") as? Bool ?? true
        }
        
        set {
            UserDefaults.standard.setValue(newValue, forKey: "welcomeScreen")
        }
    }
}

struct ListView: View {
    var body: some View {
        if UserDefaults.standard.welcomeScreen {
            WelcomeView()
        } else {
            MainListView()
        }
    }
}

#Preview {
    ListView()
}
