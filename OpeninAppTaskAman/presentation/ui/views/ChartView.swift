//
//  ChartView.swift
//  OpeninAppTaskAman
//
//  Created by Aman Kumar on 05/04/24.
//

import SwiftUI
import Charts

struct ChartView: View {
    let plotDataList: [PlotData]
    let linearGradient = LinearGradient(gradient: Gradient(colors: [Color(hex: 0x0E6FFF),
                                                                    Color(hex: 0x0E6FFF, alpha: 0)]),
                                        startPoint: .top,
                                        endPoint: .bottom)
    var body: some View {
        Chart {
            ForEach(plotDataList) { data in
                LineMark(x: .value("Month", data.month),
                         y: .value("Value", data.value))
                .lineStyle(StrokeStyle(lineWidth: 3))
                .foregroundStyle(Color(hex: 0x0E6FFF))
            }
            .interpolationMethod(.cardinal(tension: 0.9))
            
            ForEach(plotDataList) { data in
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
            AxisMarks(values: availableMonth(plotDataList: plotDataList) ) { value in
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
    ChartView(plotDataList: PlotData.sampleExample)
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

func availableMonth(plotDataList: [PlotData]) -> [Int]{
    var xValues = Set<Int>()

    // Extract unique month indices from plotDataList
    for plotData in plotDataList {
        xValues.insert(plotData.month)
    }

    // Convert the Set to an array and sort it
    var xValueArray = Array(xValues)
    xValueArray.append(0)
    xValueArray.append(13)
    xValueArray.sort()
    
    return xValueArray
}
