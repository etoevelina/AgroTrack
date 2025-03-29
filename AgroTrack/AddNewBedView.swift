import SwiftUI

struct AddNewBedView: View {
    @State private var bedName: String = ""
    @State private var selectedMicrogreen: String = "Arugula"
    @State private var selectedSubstrate: String = "Coconut"
    @State private var sowingDate: Date = Date() 
    @State private var estimatedHarvestDate: Date = Calendar.current.date(byAdding: .day, value: 10, to: Date()) ?? Date()
    @State private var specialConditions: String = ""

    let microgreens = ["Arugula", "Mustard", "Lettuce", "Basil", "Radish", "Sunflower", "Pea Shoots", "Broccoli", "Kale", "Cilantro"]
    let substrates = ["Coconut", "Soil", "Perlite", "Rockwool", "Hydroponic"]

    var isFormValid: Bool {
        !bedName.isEmpty
    }

    var body: some View {
        
            Form {
                Section(header: Text("Garden Bed Details")) {
                    TextField("Enter bed name", text: $bedName)
                }

                Section(header: Text("Microgreens")) {
                    Picker("Select Microgreen", selection: $selectedMicrogreen) {
                        ForEach(microgreens, id: \.self) { microgreen in
                            Text(microgreen)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }

                Section(header: Text("Substrate Type")) {
                    Picker("Select Substrate", selection: $selectedSubstrate) {
                        ForEach(substrates, id: \.self) { substrate in
                            Text(substrate)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }

                Section(header: Text("Sowing Date")) {
                    DatePicker("Select Sowing Date", selection: $sowingDate, displayedComponents: .date)
                }

                Section(header: Text("Estimated Harvest Date")) {
                    DatePicker("Select Harvest Date", selection: $estimatedHarvestDate, displayedComponents: .date)
                }

                Section(header: Text("Special Conditions")) {
                    TextField("Enter any special conditions", text: $specialConditions)
                }

                Section {
                    Button(action: saveBed) {
                        Text("Save Garden Bed")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(isFormValid ? Color.green : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                           
                    }
                    .disabled(!isFormValid)
                }
            }
        
    }

    private func saveBed() {
        print("Saving: \(bedName), \(selectedMicrogreen), \(selectedSubstrate), \(sowingDate), \(estimatedHarvestDate), \(specialConditions)")
    }
}
//
//#Preview {
//    AddNewBedView()
//}
