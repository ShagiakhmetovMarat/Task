//
//  ReaderDocument.swift
//  Task
//
//  Created by Marat Shagiakhmetov on 28.12.2024.
//

import SwiftUI
import PDFKit

struct PDFReaderView: View {
    var pdfURL: URL
    
    var body: some View {
        PDFKitView(url: pdfURL)
            .ignoresSafeArea()
    }
}

struct PDFKitView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.document = PDFDocument(url: url)
        pdfView.autoScales = true
        pdfView.displayDirection = .vertical
        return pdfView
    }
    
    func updateUIView(_ uiView: PDFView, context: Context) {
    }
}

struct ReaderDocument: View {
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                VStack {
                    if let pdfPath = Bundle.main.url(forResource: "Тестовое задание", withExtension: "pdf") {
                        PDFReaderView(pdfURL: pdfPath)
                    } else {
                        Text("PDF file not found")
                            .foregroundStyle(.red)
                    }
                }
            }
        }
    }
}

#Preview {
    ReaderDocument()
}
