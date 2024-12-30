//
//  AddNewDocumentView.swift
//  Task
//
//  Created by Marat Shagiakhmetov on 28.12.2024.
//

import SwiftUI
import PhotosUI

@available(iOS 16.0, *)
struct AddNewDocumentView: View {
    @State private var pickerItems = [PhotosPickerItem]()
    @State private var selectedImages = [Image]()
    @State private var isPhotoPicker = false
    
    var body: some View {
        NavigationStack {
            if #available(iOS 17.0, *) {
                VStack {
                    ScrollView {
                        ForEach(0..<selectedImages.count, id: \.self) { image in
                            selectedImages[image]
                                .resizable()
                                .scaledToFit()
                        }
                    }
                }
                .onChange(of: pickerItems) { oldValue, newValue in
                    Task {
                        selectedImages.removeAll()
                        
                        for item in pickerItems {
                            if let loadedImage = try await item.loadTransferable(type: Image.self) {
                                selectedImages.append(loadedImage)
                            }
                        }
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Menu {
                            Button {
                                isPhotoPicker = true
                            } label: {
                                Label("Add photos", systemImage: "photo.badge.plus")
                            }
                            Button {
                                
                            } label: {
                                Label("Save as PDF", systemImage: "square.and.arrow.down")
                            }
                        } label: {
                            Image(systemName: "ellipsis")
                        }
                    }
                }
                .photosPicker(isPresented: $isPhotoPicker, selection: $pickerItems, maxSelectionCount: 3, matching: .any(of: [.images, .screenshots, .livePhotos]))
            }
        }
    }
}

#Preview {
    if #available(iOS 16.0, *) {
        AddNewDocumentView()
    }
}
