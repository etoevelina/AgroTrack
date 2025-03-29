//
//  RecomendationView.swift
//  AgroTrack
//
//  Created by Эвелина Пенькова on 29.03.2025.
//

import SwiftUI

struct RecomendationView: View {
    var body: some View {
            ScrollView {
                VStack(alignment: .center, spacing: 15) {
                    HStack {
                        infoCard(title: "Temperature", value: "50°C", width: 190)
                        Spacer()
                        infoCard(title: "Humidity", value: "50%", width: 170)
                    }
                    .frame(maxWidth: .infinity)
                    
                    recomendationCard(title: "Lighting", description: "Provide 12-16 hours of full-spectrum light per day")
                    recomendationCard(title: "Watering", description: "Water the plants when the soil is dry to the touch")
                    recomendationCard(title: "Ventilation", description: "Ensure proper airflow to prevent mold and diseases")
                    recomendationCard(title: "Other characteristics", description: "Use nutrient-rich soil for better growth")
                   // recomendationCard(title: "General recommendations", description: "Monitor plant health and adjust conditions accordingly")
                }
                .padding(.horizontal)
            }
        }

    
    private func infoCard(title: String, value: String, width: CGFloat) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 21, weight: .semibold))
                    .foregroundStyle(Color.black)
                Text(value)
                    .font(.system(size: 35, weight: .medium))
                    .foregroundStyle(Color.black)
            }
            .padding(.horizontal)
            Spacer()
        }
        .frame(maxWidth: width)
        .frame(height: 90)
        .background(Color.white.opacity(0.7))
        .cornerRadius(19)
        .scrollTransition(.interactive, axis: .vertical){ view, phase in
            view.opacity(phase.value < 0  ? 0 : 1)
        }
    }
    
    private func recomendationCard(title: String, description: String) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.system(size: 21, weight: .bold))
                .foregroundStyle(Color.black)
                .padding(.horizontal)
            Text(description)
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(Color.black.opacity(0.8))
                .padding(.horizontal)
        }
        
        .frame(maxWidth: .infinity, minHeight: 100)
        .background(Color.white.opacity(0.7))
        .cornerRadius(19)
        .scrollTransition(.interactive, axis: .vertical) { view, phase in
            view.opacity(phase.value < 0 ? 0 : 1)
        }
    }

}
//
//#Preview {
//    RecomendationView()
//}
