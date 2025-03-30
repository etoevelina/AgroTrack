//
//  GardenBedView.swift
//  AgroTrack
//
//  Created by Эвелина Пенькова on 29.03.2025.
//

import SwiftUI

struct GardenBedCardView: View {
//    let gardenBed: Course
    let cardImageName: String

    var body: some View {
        ZStack {
            VStack(alignment: .leading){
                HStack {
                    Text("Grass bed 1")
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(.black)
                        .padding(.vertical, 7)
                        .padding(.horizontal, 13)
                        .fixedSize(horizontal: false, vertical: true)
                        .background(Color.black.opacity(0.25))
                        .cornerRadius(14)
                    Spacer()
                    ZStack {
                        Ellipse()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                        
                        Image(systemName: "arrow.right")
                            .foregroundColor(.black)
                            .rotationEffect(Angle(degrees: -45))
                    }
                    .padding(.trailing, 8)
                }
                
                .padding(.top, 7)
                
                Spacer().frame(maxHeight: 28)
                
                    //if let teacher = course.teacher {
                
                    
                    //   }
                    VStack (alignment: .leading){
                        //    if let courseName = course.name {
                        Text("Mustard")
                            .font(.system(size: 20, weight: .bold))
                            
                        //     }
                        Text("05.05.2025")
                            .font(.system(size: 15, weight: .semibold))
                            
                    }
                    .foregroundColor(.black)
                    .frame(maxWidth: 300, alignment: .leading)
                    .padding(.bottom, 12)
                    
                
            }
            .padding(.leading)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 136)
        .background(
            Image(cardImageName)
                .resizable()
                .scaledToFill()
        )
        .cornerRadius(10)
        //.shadow(radius: 5)
    }
}

struct GardenBed {
    let gardenBedName: String
    let microGrassName: String
    let dateOfSowing: Date
}

struct GardenBedView: View {
    @Binding var isAddNewNotePresented: Bool
    let cardImageNames = ["home1", "home2", "home3"]
    let gardenBeds: [GardenBed] = [
        GardenBed(gardenBedName: "Грядка 1", microGrassName: "Руккола", dateOfSowing: Date()),
        GardenBed(gardenBedName: "Грядка 2", microGrassName: "Горчица", dateOfSowing: Date().addingTimeInterval(-86400)),
        GardenBed(gardenBedName: "Грядка 3", microGrassName: "Базилик", dateOfSowing: Date().addingTimeInterval(-172800))
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(gardenBeds.enumerated().map { $0 }, id: \.element.gardenBedName) { index, bed in

                    let cardImageName = cardImageNames[index % cardImageNames.count]
                    NavigationLink(destination: GardenBedDetailView(cardImageName: cardImageName, isAddNewNotePresented: $isAddNewNotePresented)){
                        GardenBedCardView(cardImageName: cardImageName)
                            .scrollTransition(.interactive, axis: .vertical) { view, phase in
                                view.opacity(phase.value < 0 ? 0 : 1)
                            }
                          //  .padding(.horizontal, 30)
                    }
                }
            }
        }
    }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}


//#Preview {
//    GardenBedView()
//}
