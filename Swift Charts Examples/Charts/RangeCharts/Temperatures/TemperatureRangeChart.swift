//
// Copyright © 2022 Swift Charts Examples.
// Open Source - MIT License

import SwiftUI
import Charts

struct TemperatureRangeChartDetail: View {
    enum Selection {
        case sf
        case cupertino
        case both
    }

    @State var barWidth = 10.0
    @State var chartColors: [Color] = [.blue, .green]
    @State var selection: Selection = .sf

    var data: [WeatherData.Series] {
        switch selection {
        case .sf:
            return WeatherData.last7Days.filter { $0.city == "San Francisco" }
        case .cupertino:
            return WeatherData.last7Days.filter { $0.city == "Cupertino" }
        default:
            return WeatherData.last7Days
        }
    }

    var body: some View {
        List {
            Section {
                Chart(data) { series in
                    ForEach(series.temperatures, id: \.day) { temperature in
                            BarMark(
                                x: .value("Day", temperature.day),
                                yStart: .value("Low", temperature.low),
                                yEnd: .value("High", temperature.high),
                                width: .fixed(barWidth)
                            )
//                        .clipShape(Capsule())
                    }
//                    BarMark(
//                        x: .value("Day", $0.day, unit: .day),
//                        yStart: .value("Low", $0.low),
//                        yEnd: .value("High", $0.high),
//                        width: .fixed(barWidth)
//                    )
//                    .clipShape(Capsule())
//                    .foregroundStyle(chartColor.gradient)

                }
                .frame(height: 300)
            }

//            customisation
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TemperatureRangeChartDetail_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureRangeChartDetail()
    }
}

