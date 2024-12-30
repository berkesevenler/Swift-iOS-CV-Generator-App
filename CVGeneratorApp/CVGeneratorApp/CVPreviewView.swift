//
//  CVPreviewView.swift
//  CVGeneratorApp
//
//  Created by Berke Sevenler on 31.12.24.
//

import SwiftUI
import PDFKit
import UIKit

struct CVPreviewView: View {
    var user: User
    var profileImage: UIImage?
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    if let profileImage = profileImage {
                        Image(uiImage: profileImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                            .clipShape(Circle())
                            .padding(.bottom, 20)
                    }
                    
                    Text(user.fullName)
                        .font(.largeTitle)
                        .bold()
                    Text(user.contactInfo)
                        .font(.subheadline)
                    Text(user.address)
                        .font(.subheadline)
                    
                    Divider()
                    
                    Text("Education")
                        .font(.headline)
                    ForEach(user.education, id: \.self) { education in
                        Text("• \(education)")
                    }
                    
                    Divider()
                    
                    Text("Work Experience")
                        .font(.headline)
                    ForEach(user.workExperience, id: \.self) { experience in
                        Text("• \(experience)")
                    }
                    
                    Divider()
                    
                    Text("Skills")
                        .font(.headline)
                    ForEach(user.skills, id: \.self) { skill in
                        Text("• \(skill)")
                    }
                    
                    Divider()
                    
                    Text("Hobbies")
                        .font(.headline)
                    ForEach(user.hobbies, id: \.self) { hobby in
                        Text("• \(hobby)")
                    }
                }
                .padding()
            }
            .navigationTitle("Preview CV")
            
            Button("Save to Files") {
                saveToFiles()
            }
            .padding()
        }
    }
    
    func renderViewAsImage() -> UIImage {
        let hostingController = UIHostingController(rootView: self)
        let targetSize = CGSize(width: 612, height: 792) // Standard A4 size in points
        
        hostingController.view.bounds = CGRect(origin: .zero, size: targetSize)
        hostingController.view.backgroundColor = .white
        
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        
        return renderer.image { context in
            hostingController.view.drawHierarchy(in: hostingController.view.bounds, afterScreenUpdates: true)
        }
    }

    
    func saveToFiles() {
        // 1. Render the view as an image
        let renderedImage = renderViewAsImage()
        
        // 2. Define the file path for saving the PDF
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = documentsURL.appendingPathComponent("GeneratedCV.pdf")
        
        // 3. Create the PDF renderer
        let pdfRenderer = UIGraphicsPDFRenderer(bounds: CGRect(origin: .zero, size: renderedImage.size))
        
        do {
            try pdfRenderer.writePDF(to: fileURL) { context in
                context.beginPage()
                renderedImage.draw(in: CGRect(origin: .zero, size: renderedImage.size))
            }
            print("PDF successfully saved to \(fileURL.path)")
            
            // 4. Present the Save to Files dialog
            let documentPicker = UIDocumentPickerViewController(forExporting: [fileURL])
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let rootVC = windowScene.windows.first?.rootViewController {
                rootVC.present(documentPicker, animated: true, completion: nil)
            }
        } catch {
            print("Failed to save PDF: \(error.localizedDescription)")
        }
    }

}
