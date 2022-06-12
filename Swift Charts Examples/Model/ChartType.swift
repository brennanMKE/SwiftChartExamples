//
//  ChartType.swift
//  Swift Charts Examples
//
//  Created by Jordi Bruin on 12/06/2022.
//

import Foundation
import SwiftUI

enum ChartType: String, Identifiable, CaseIterable {
    case lineChartSimple
    
    var id: String { self.rawValue }
    
    var title: String {
        switch self {
        case .lineChartSimple:
            return "Line Chart Simple"
        }
    }
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .lineChartSimple:
            LineChartSimpleView()
        }
    }
}