// CsvManager.swift
import Foundation

class CsvManager: ObservableObject {
    @Published var sensorData: [SensorData] = []
    
    func loadSensorData(from fileName: String) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "csv") else {
            print("❌ CSV file not found")
            self.sensorData = []
            return
        }

        do {
            let content = try String(contentsOf: url, encoding: .utf8)
            let lines = content.components(separatedBy: "\n").dropFirst().filter { !$0.isEmpty }
            print("🔍 Total lines to parse: \(lines.count)")

            var sensorData: [SensorData] = []
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS" // Формат для "2025-03-20T11:59:24.633565"
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)

            for (index, line) in lines.enumerated() {
                let columns = line.components(separatedBy: ",").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
                
                if columns.count >= 11 {
                    guard let date = dateFormatter.date(from: columns[0]) else {
                        print("⚠️ Failed to parse date in line \(index): \(columns[0])")
                        continue
                    }
                    guard let temperature = Double(columns[8]) else {
                        print("⚠️ Failed to parse temperature in line \(index): \(columns[8])")
                        continue
                    }
                    guard let humidity = Double(columns[9]) else {
                        print("⚠️ Failed to parse humidity in line \(index): \(columns[9])")
                        continue
                    }
                    guard let light = Double(columns[10]) else {
                        print("⚠️ Failed to parse light in line \(index): \(columns[10])")
                        continue
                    }
                    
                    let entry = SensorData(date: date, temperature: temperature, humidity: humidity, light: light)
                    sensorData.append(entry)
                } else {
                    print("⚠️ Line \(index) has insufficient columns: \(columns.count), content: \(columns)")
                }
            }
            print("📊 Loaded \(sensorData.count) records")
            self.sensorData = sensorData
        } catch {
            print("❌ CSV reading error: \(error)")
            self.sensorData = []
        }
    }
}
