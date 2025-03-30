//
//  StatisticsView.swift
//  AgroTrack
//
//  Created by Эвелина Пенькова on 30.03.2025.
//

import SwiftUI
import Charts

struct StatisticsView: View {
    @ObservedObject var csvManager = CsvManager()

    var body: some View {
        ScrollView{
            VStack(spacing: 20) {
                GrowthChartView()
                    .frame(width: 350, height: 300)
                SensorChartView(sensorData: csvManager.sensorData, title: "Temperature", color: .red, keyPath: \.temperature)
                    .frame(width: 350, height: 400)
                SensorChartView(sensorData: csvManager.sensorData, title: "Humidity", color: .blue, keyPath: \.humidity)
                    .frame(width: 350, height: 400)
                SensorChartView(sensorData: csvManager.sensorData, title: "Light", color: .yellow, keyPath: \.light)
                    .frame(width: 350, height: 400)
            }
           // .padding()
                
        }
        .onAppear{
            csvManager.loadSensorData(from: "2025-03-20")
        }
    }
}


struct GrowthChartView: View {
    let sampleReports: [Note] = [
//        Note(text: "Watering was increased due to high temperature.",
//               plantChanges: "Leaves look greener",
//               plantHeight: 6,
//               date: Date(),
//               hasImage: true),
//        
//        Note(text: "Lighting adjusted to 14 hours per day.",
//               plantChanges: "Plant seems to be growing faster",
//               plantHeight: 8,
//               date: Date().addingTimeInterval(-86400),
//               hasImage: false),
//        
//        Note(text: "Added fertilizer.",
//               plantChanges: "Growth accelerated.",
//               plantHeight: 12,
//               date: Date().addingTimeInterval(-172800),
//               hasImage: false)
    ]

    var body: some View {
        VStack {
            Text("Growth Progress")
                .font(.title2.bold())
                .padding(.top)
            
//            Chart(sampleReports.sorted(by: { $0.date < $1.date })) { report in
//                LineMark(
//                    x: .value("Date", report.date),
//                    y: .value("Height", report.plantHeight)
//                )
//                .foregroundStyle(Color.green)
//                .symbol(Circle())
//            }
            .chartXAxis {
                AxisMarks { value in
                    AxisValueLabel(format: .dateTime.day().month(), centered: true)
                }
            }
            .frame(width: 300, height: 200)
            .background(Color.white.opacity(0.8))
            .cornerRadius(12)
            .padding()
        }
    }
}

