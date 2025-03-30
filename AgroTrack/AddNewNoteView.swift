import SwiftUI
import PhotosUI

struct AddNewNoteView: View {
    @Environment(\.dismiss) var dismiss

    @State private var text: String = ""
    @State private var plantChanges: String = ""
    @State private var plantHeight: String = ""

    @State private var selectedImage: UIImage?
    @State private var showImagePicker = false
    @State private var useCamera = false

    var body: some View {
        
        Form {
            
            Section(header: Text("")) {
            }
            
            Section(header: Text("Observation")) {
                TextField("Notes on lighting and watering", text: $text)
            }
            
            Section(header: Text("Visual changes")) {
                TextField("Describe changes", text: $plantChanges)
            }
            
            Section(header: Text("Plant Height")) {
                TextField("Enter height in cm", text: $plantHeight)
                    .keyboardType(.numberPad)
            }
            
            Section(header: Text("Attach Image")) {
                if let selectedImage {
                    Image(uiImage: selectedImage)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        .cornerRadius(12)
                }
                
                Button("Choose Image") {
                    showImagePicker = true
                }
                .foregroundColor(.blue)
            }
            
            Section {
                Button("Save") {
                    dismiss()
                }
                .frame(maxWidth: .infinity)
            }
        }
            .actionSheet(isPresented: $showImagePicker) {
                ActionSheet(title: Text("Select Source"), buttons: [
                    .default(Text("Camera")) {
                        useCamera = true
                        showImagePicker = false
                    },
                    .default(Text("Photo Library")) {
                        useCamera = false
                        showImagePicker = false
                    },
                    .cancel()
                ])
            }
            .fullScreenCover(isPresented: $showImagePicker) {
                ImagePicker(selectedImage: $selectedImage, useCamera: useCamera)
            }
        }
    
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    var useCamera: Bool

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            picker.dismiss(animated: true)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = useCamera ? .camera : .photoLibrary
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}

#Preview {
    AddNewNoteView()
}
