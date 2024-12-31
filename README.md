# CV Generator App

A SwiftUI-based application that allows users to create professional CVs by inputting personal details, education, work experience, skills, and hobbies. Users can upload a profile picture and export the CV as a PDF, saving it to the Files app.

## Features

- **Personalized Input Fields:** Users can fill out personal details, education, work experience, skills, and hobbies.
- **Profile Picture Upload:** Add a profile picture to the CV using the device's photo picker.
- **CV Preview:** View the completed CV before exporting it.
- **PDF Export:** Save the generated CV as a PDF file and store it in the Files app.
		
## Technologies Used

- **SwiftUI:** For building the user interface.
- **UIGraphicsPDFRenderer:** For generating PDFs.
- **PHPickerViewController:** For selecting profile pictures.
- **UIDocumentPickerViewController:** For saving files to the Files app.

## Usage

- **Fill Out Details:** Enter your personal details, education, work experience, skills, and hobbies in the provided fields.
- **Upload a Profile Picture:** Click on the "Upload Picture" button to select a photo from your device.
- **Preview the CV:** Navigate to the preview screen to review your details.
- **Export to PDF:** Tap on "Save to Files" to export the CV as a PDF.
- **Choose a location in the Files app to save the PDF.**

## File Structure

CVGeneratorApp/ ├── ContentView.swift # Main user interface ├── User.swift # Data model for user details ├── ImagePicker.swift # Handles image selection ├── CVPreviewView.swift # CV preview and PDF generation ├── CVGeneratorAppApp.swift # App entry point └── Assets.xcassets # Assets (e.g., app icons)


## Known Issues

- **Simulator Files Directory:** The simulator does not have a Downloads folder. PDFs are saved to the app's sandboxed Documents directory by default.
- **Blank PDF:** Ensure all fields are filled and properly rendered before exporting the PDF.

## Future Enhancements

- Add support for multiple CV templates.
- Provide options to edit and reorder sections.
- Integrate iCloud storage for saved CVs.
- Allow direct sharing via email or messaging apps.

## License

This project is licensed under the MIT License.

## Acknowledgments

Special thanks to Apple Documentation for providing resources on SwiftUI and UIKit.
