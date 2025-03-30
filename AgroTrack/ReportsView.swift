//
//  ReportsView.swift
//  AgroTrack
//
//  Created by Эвелина Пенькова on 29.03.2025.
//

import SwiftUI
import Charts

struct ReportsView: View {
    @Binding var isAddNewNotePresented: Bool
    @ObservedObject var csvManager = CsvManager()
//    let sensorData: [SensorData] = vmCSV.loadSensorData(from: "2025-03-20")

    
    let sampleReports: [Report] = [
        Report(text: "Watering was increased due to high temperature.",
               plantChanges: "Leaves look greener",
               plantHeight: 6,
               date: Date(),
               hasImage: true),
        
        Report(text: "Lighting adjusted to 14 hours per day.",
               plantChanges: "Plant seems to be growing faster",
               plantHeight: 8,
               date: Date().addingTimeInterval(-86400),
               hasImage: false),
        
        Report(text: "Added fertilizer.",
               plantChanges: "Growth accelerated.",
               plantHeight: 12,
               date: Date().addingTimeInterval(-172800),
               hasImage: false)
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Do you want to add new note?")
                        .font(.system(size: 19, weight: .medium))
                        .foregroundStyle(Color.black)
                    Spacer()
                    Button {
                        isAddNewNotePresented = true
                    } label: {
                        Text("+")
                            .font(.system(size: 25, weight: .medium))
                            .foregroundStyle(Color.black)
                            .padding(.vertical, 4)
                            .padding(.horizontal, 10)
                            .background(Color(red: 0.73, green: 0.82, blue: 0.49))
                            .cornerRadius(18)
                    }
                }
                .padding(.horizontal)
                
                ForEach(sampleReports) { report in
                    reportCard(report: report)
                }
            }
            .padding(.horizontal)
        }
    }
    
    private func reportCard(report: Report) -> some View {
        VStack(alignment: .leading, spacing: 15) {
            VStack(alignment: .leading) {
                Text("Visual changes:")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(Color.black)
                Text(report.plantChanges)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundStyle(Color.black)
            }
            
            HStack {
                Text("Plant height: ")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(Color.black)
                Text("\(report.plantHeight) cm")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundStyle(Color.black)
            }
            
            VStack(alignment: .leading) {
                Text("Notes on lighting and watering:")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(Color.black)
                Text(report.text)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundStyle(Color.black.opacity(0.8))
            }
            
            HStack {
                Text(report.date, format: .dateTime.day().month().year())
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(Color.gray)
                Spacer()
                
                if report.hasImage {
                    Button {
                        
                    } label: {
                        Text("Show image")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundStyle(Color.black)
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                            .frame(width: 135, height: 37)
                            .background(Color.green.opacity(0.6))
                            .cornerRadius(24)
                    }
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 100)
        .background(Color.white.opacity(0.7))
        .cornerRadius(19)
        .padding(.bottom)
    }
}

