//
//  User.swift
//  CVGeneratorApp
//
//  Created by Berke Sevenler on 31.12.24.
//

import Foundation

struct User {
    var fullName: String = ""
    var contactInfo: String = ""
    var address: String = ""
    var education: [String] = []
    var workExperience: [String] = []
    var skills: [String] = []
    var hobbies: [String] = []
    var profileImage: Data? = nil
}
