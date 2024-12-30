//
//  CustomCell.swift
//  Task
//
//  Created by Marat Shagiakhmetov on 28.12.2024.
//

import SwiftUI

struct CustomCell: View {
    @Binding var name: String
    @Binding var data: String
    
    var body: some View {
        HStack {
            Image(systemName: "text.document")
                .resizable()
                .scaledToFit()
                .frame(width: 35)
                .foregroundStyle(
                    Color(red: 230/255, green: 80/255, blue: 80/255))
                .padding(5)
            VStack {
                Text(name)
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("PDF" + " ∙ " + data)
                    .opacity(0.4)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    CustomCell(
        name: .constant("Theme"), data: .constant("31.12.2024"))
}
