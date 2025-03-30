//
//  SensorChartsView.swift
//  AgroTrack
//
//  Created by Эвелина Пенькова on 30.03.2025.
//
import SwiftUI
import Charts


struct SensorChartView: View {
    let sensorData: [SensorData]
    let title: String
    let color: Color
    let keyPath: KeyPath<SensorData, Double>

    var body: some View {
        VStack {
            Text(title)
                .font(.title2.bold())
                .padding(.top)

            if sensorData.isEmpty {
                Text("No data")
                    .foregroundColor(.red)
                    .padding()
            } else {
                Chart(sensorData) {
                    LineMark(
                        x: .value("Date", $0.date),
                        y: .value(title, $0[keyPath: keyPath])
                    )
                    .foregroundStyle(color)
                    .symbol(Circle())
                }
                .chartXAxis {
                    AxisMarks { value in
                        if let date = value.as(Date.self) {
                            AxisValueLabel {
                                Text(date, format: .dateTime.hour().minute())
                                    .font(.caption)
                                   // .rotationEffect(.degrees(-45))
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 350)
                .background(Color.white.opacity(0.8))
                .cornerRadius(12)
                .padding()
            }
        }
        .onAppear {
            print("Sensor data: \(sensorData)")
        }
    }
}
