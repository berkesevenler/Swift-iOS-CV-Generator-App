//
//  ContentView.swift
//  CVGeneratorApp
//
//  Created by Berke Sevenler on 31.12.24.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    @State private var user = User()
    @State private var selectedImage: UIImage?
    @State private var showImagePicker = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Details")) {
                    TextField("Full Name", text: $user.fullName)
                    TextField("Contact Info", text: $user.contactInfo)
                    TextField("Address", text: $user.address)
                }
                
                Section(header: Text("Education")) {
                    ForEach($user.education, id: \.self) { $education in
                        TextField("School/College", text: $education)
                    }
                    Button("Add Education") {
                        user.education.append("")
                    }
                }
                
                Section(header: Text("Work Experience")) {
                    ForEach($user.workExperience, id: \.self) { $experience in
                        TextField("Company/Role", text: $experience)
                    }
                    Button("Add Experience") {
                        user.workExperience.append("")
                    }
                }
                
                Section(header: Text("Skills")) {
                    ForEach($user.skills, id: \.self) { $skill in
                        TextField("Skill", text: $skill)
                    }
                    Button("Add Skill") {
                        user.skills.append("")
                    }
                }
                
                Section(header: Text("Hobbies")) {
                    ForEach($user.hobbies, id: \.self) { $hobby in
                        TextField("Hobby", text: $hobby)
                    }
                    Button("Add Hobby") {
                        user.hobbies.append("")
                    }
                }
                
                Section(header: Text("Profile Picture")) {
                    if let selectedImage = selectedImage {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                            .clipShape(Circle())
                    }
                    Button("Upload Picture") {
                        showImagePicker = true
                    }
                }
            }
            .navigationTitle("CV Generator")
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(image: $selectedImage)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink("Generate CV", destination: CVPreviewView(user: user, profileImage: selectedImage))
                }
            }
        }
    }
}
