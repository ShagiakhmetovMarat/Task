//
//  MainListView.swift
//  Task
//
//  Created by Marat Shagiakhmetov on 29.12.2024.
//

import SwiftUI

struct MainListView: View {
    @State var items = [
        Items(name: "Food", data: "12.12.2024"),
        Items(name: "Gifts", data: "23.12.2024"),
        Items(name: "Other tech", data: "24.12.2024")
    ]
    @State private var navigateToReader = false
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                List($items) { item in
                    NavigationLink {
                        ReaderDocument()
                    } label: {
                        CustomCell(name: item.name, data: item.data)
                            .contextMenu {
                                Button {
                                    
                                } label: {
                                    Label("Share", systemImage: "square.and.arrow.up")
                                }
                                Button(role: .destructive) {
                                    
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                                Button {
                                    
                                } label: {
                                    Label("Merge", systemImage: "document.on.document")
                                }
                            }
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Documents")
                .toolbar {
                    ToolbarItem {
                        NavigationLink {
                            AddNewDocumentView()
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                    ToolbarItem(placement: .bottomBar) {
                        Text("Files: \(items.count)")
                    }
                }
            }
        }
    }
}

#Preview {
    MainListView()
}
