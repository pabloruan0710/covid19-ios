//
//  Charts.swift
//  coronavirus covid19
//
//  Created by Pablo Ruan on 27/03/20.
//  Copyright © 2020 Pablo Ruan. All rights reserved.
//

import Foundation
import Charts
import UIKit

struct ChartCOVID {
    private init() {}
    static func getSetChart(values: [ChartDataEntry], label: String, gradientColors: [UIColor]) -> LineChartDataSet {
           let setValue = LineChartDataSet(entries: values, label: label)
           setValue.drawIconsEnabled = false
           setValue.setColor(gradientColors[1])
           setValue.setCircleColor(gradientColors[1])
           setValue.lineWidth = 2
           setValue.lineCapType = .round
           setValue.mode = .linear
           setValue.circleRadius = 4
           setValue.drawCircleHoleEnabled = false
           setValue.valueFont = Theme.font.medium(size: 7)
           setValue.valueTextColor = .darkGray
           setValue.formLineWidth = 2.5
           setValue.formSize = 15
           let gradientColors = [gradientColors[0].cgColor,
                                 gradientColors[1].cgColor]
           let gradient = CGGradient(colorsSpace: nil, colors: gradientColors as CFArray, locations: nil)!
           setValue.fillAlpha = 1
           setValue.fill = Fill(linearGradient: gradient, angle: 90)
           //setValue.drawFilledEnabled = true
           return setValue
       }
       
    static func createLineChart(chart: LineChartView, delegate: ChartViewDelegate) {
                   
           chart.delegate = delegate
           chart.drawBordersEnabled = false
           chart.chartDescription?.enabled = false
           chart.dragEnabled = true
           chart.setScaleEnabled(true)
           chart.pinchZoomEnabled = true
           chart.layoutMargins = UIEdgeInsets(top: 10, left: 20, bottom: 30, right: 10)
           
           let l = chart.legend
           l.form = .line
           l.font = Theme.font.light(size: 11)
           l.textColor = .black
           l.horizontalAlignment = .left
           l.verticalAlignment = .top
           l.orientation = .horizontal
           l.drawInside = false
           
           let xAxis = chart.xAxis
           xAxis.labelFont = Theme.font.bold(size: 11)
           xAxis.labelTextColor = .black
           xAxis.drawAxisLineEnabled = false
           xAxis.drawGridLinesEnabled = false
           xAxis.drawLabelsEnabled = false
           xAxis.avoidFirstLastClippingEnabled = true
           xAxis.drawLimitLinesBehindDataEnabled = false
           
           let leftAxis = chart.leftAxis
           leftAxis.labelTextColor = UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1)
           leftAxis.axisMinimum = 0
           leftAxis.drawGridLinesEnabled = false
           leftAxis.granularityEnabled = true
           leftAxis.drawZeroLineEnabled = false
           leftAxis.drawLabelsEnabled = true
           leftAxis.labelTextColor = .darkGray
           leftAxis.drawAxisLineEnabled = false
           leftAxis.drawLimitLinesBehindDataEnabled = false
           
           let rightAxis = chart.rightAxis
           rightAxis.labelTextColor = .red
           rightAxis.axisMinimum = 0
           rightAxis.granularityEnabled = false
           rightAxis.drawAxisLineEnabled = false
           rightAxis.drawGridLinesEnabled = true
           rightAxis.drawLabelsEnabled = false
           rightAxis.drawLimitLinesBehindDataEnabled = false
           rightAxis.drawZeroLineEnabled = false
           rightAxis.axisLineColor = UIColor.lightText
           rightAxis.gridColor = UIColor.lightGray.withAlphaComponent(0.3)
           
       }
}
