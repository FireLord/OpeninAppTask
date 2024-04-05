//
//  ChartView.swift
//  OpeninAppTaskAman
//
//  Created by Aman Kumar on 05/04/24.
//

import SwiftUI
import Charts

struct ChartView: View {
    let linearGradient = LinearGradient(gradient: Gradient(colors: [Color(hex: 0x0E6FFF),
                                                                    Color(hex: 0x0E6FFF, alpha: 0)]),
                                        startPoint: .top,
                                        endPoint: .bottom)
    var body: some View {
        Chart {
            ForEach(PlotData.sampleExample) { data in
                LineMark(x: .value("Month", data.month),
                         y: .value("Value", data.value))
                .lineStyle(StrokeStyle(lineWidth: 3))
                .foregroundStyle(Color(hex: 0x0E6FFF))
            }
            .interpolationMethod(.cardinal(tension: 0.9))
            
            ForEach(PlotData.sampleExample) { data in
                AreaMark(x: .value("Month", data.month),
                         y: .value("Value", data.value))
            }
            .interpolationMethod(.cardinal(tension: 0.9))
            .foregroundStyle(linearGradient).opacity(0.24)
        }
        .chartYAxis {
            AxisMarks(position: .leading)
        }
        .chartXAxis {
            AxisMarks(values: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]) { value in
                AxisGridLine()
                AxisTick()
                if let month = value.as(Int.self) {
                    AxisValueLabel(monthName(for: month),
                                   centered: false,
                                   anchor: .top)
                }
            }
        }
        .chartLegend(.hidden)
        .padding()
    }
}

#Preview {
    ChartView()
}

func monthName(for monthNumber: Int) -> String {
    switch monthNumber {
    case 1:  return "Jan"
    case 2:  return "Feb"
    case 3:  return "Mar"
    case 4:  return "Apr"
    case 5:  return "May"
    case 6:  return "Jun"
    case 7:  return "Jul"
    case 8:  return "Aug"
    case 9:  return "Sep"
    case 10: return "Oct"
    case 11: return "Nov"
    case 12: return "Dec"
    default: return ""
    }
}
