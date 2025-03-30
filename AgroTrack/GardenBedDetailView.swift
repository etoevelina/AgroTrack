//
//  GardenBedDetailView.swift
//  AgroTrack
//
//  Created by Эвелина Пенькова on 29.03.2025.
//

import SwiftUI

struct GardenBedDetailView: View {
    var cardImageName: String
    @Binding var isAddNewNotePresented: Bool

    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        let (courseCardName, bgColor) = getCourseProperties()
        VStack(spacing: 0) {
            
            ZStack(alignment: .topLeading) {

                Image(courseCardName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: 300)
                    .clipped()
                    .padding(.top, -(UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0) ?? 0)


                

                    
                
                VStack(alignment: .leading) {
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Spacer()
                        Text("Mustard")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(.black)
                            .lineLimit(2)
                            .minimumScaleFactor(0.5)
                        Text("Grass bed 1")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(Color(red: 0.22, green: 0.22, blue: 0.22))
                    }
                    .frame(maxHeight: 190)
                  //  .padding(.top, 20)
                }
               .padding()
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "arrow.left")
                            .font(.title)
                            .foregroundColor(.white)
                        
                    }
                    .padding()
                    .padding(.horizontal, 3)
                    .background(Color.black.opacity(0.5))
                    .clipShape(Capsule())
                }
                .padding(.leading)
                .padding(.top, 10)
            }
            .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                .onEnded({ value in
                    if value.translation.width > 75 {
                        presentationMode.wrappedValue.dismiss()
                    }
                    
                }))
            .padding(.bottom)
            
            CustomPickerView(isAddNewNotePresented: $isAddNewNotePresented, backgroundColor: bgColor)
                
        }
        .background(LinearGradient(
            stops: [
                Gradient.Stop(color: Color(red: 0.15, green: 0.71, blue: 1), location: 0),
                Gradient.Stop(color: Color(red: 1, green: 0.97, blue: 0.56), location: 1),
            ],
            startPoint: UnitPoint(x: 1, y: 0),
            endPoint: UnitPoint(x: 0, y: 1)
        )
        .ignoresSafeArea())
        .navigationBarHidden(true)
    }
    
    private func getCourseProperties() -> (String, Color) {
        switch cardImageName {
        case "home1":
            return ("detail2", Color(red: 0.87, green: 1, blue: 0.97))
        case "home2":
            return ("detail1", Color(red: 0.92, green: 1, blue: 0.87))
        case "home3":
            return ("detail3", Color(red: 1, green: 0.99, blue: 0.87))
        default:
            return ("detail2", Color(red: 0.87, green: 1, blue: 0.97))
        }
    }
}

//#Preview {
//    GardenBedDetailView(cardImageName: "detail1")
//}
