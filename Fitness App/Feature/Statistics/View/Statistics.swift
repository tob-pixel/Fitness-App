//
//  Statistics.swift
//  FitnessApp
//
//  Created by visortix on 13.02.2026.
//

import SwiftUI
import SwiftData

struct Statistics: View {
    
    // MARK: Data In
    @Environment(\.modelContext) private var modelContext
    
    // MARK: Data Owned by Me
    @State private var vm: StatisticsViewModel?
    
    let metrics: [MetricIdentifier]
    
    // MARK: - Init
    
    init(charts: [MetricIdentifier]) {
        self.metrics = charts
    }
    
    // MARK: - Body
    
    var body: some View {
        ScrollView {
            statisticsArea
        }
        .task { initViewModel(); loadSampleData() } // TODO: - Delete loadSampleData()
        .padding()
    }
    
    // MARK: - Views
    
    @ViewBuilder var statisticsArea: some View {
        if let vm, vm.noData {
            Text("No data.")
        } else if let vm, !vm.isLoading {
            statistics(vm: vm)
        } else {
            ProgressView()
        }
    }
    
    func statistics(vm: StatisticsViewModel) -> some View {
        VStack {
            periodPicker(for: vm)
            
            addWeightData
            textualInfo(for: vm)
            ChartRangeSlider(lowerThumbPosoition: vm.sliderSelection.lowerThumbPosition, upperThumbPosoition: vm.sliderSelection.upperThumbPosition)
        }
    }
    
    // MARK: - Functions
    
    private func initViewModel() {
        guard vm == nil else { return }
        let newVM = StatisticsViewModel(modelContext: modelContext)
        
        let metricsToFetch: [MetricIdentifier] = metrics
        
        newVM.setup(metricsToFetch)
        vm = newVM
    }
    
    private func periodPicker(for viewModel: StatisticsViewModel) -> some View {
        @Bindable var bindableVM = viewModel
        return Picker("Period", selection: $bindableVM.selectedPeriod) {
            ForEach(ChartPeriod.allCases) { type in
                Text(type.rawValue).tag(type)
            }
        }
        .pickerStyle(.segmented)
    }
}

#Preview(traits: .swiftData) {
    Statistics(charts: [.physical(.weight)])
}

// TODO: - Delete
extension Statistics {
    
    func loadSampleData() {
        vm?.metricsManager?.addRecord(timestamp: Date(), category: .physical, type: PhysicalMetricType.weight.rawValue, value: 20)
        vm?.metricsManager?.addRecord(timestamp: .daysAgo(days: 1), category: .physical, type: PhysicalMetricType.weight.rawValue, value: 19)
        vm?.metricsManager?.addRecord(timestamp: .daysAgo(days: 2), category: .physical, type: PhysicalMetricType.weight.rawValue, value: 17)
        vm?.metricsManager?.addRecord(timestamp: .daysAgo(days: 3), category: .physical, type: PhysicalMetricType.weight.rawValue, value: 17)
        vm?.metricsManager?.addRecord(timestamp: .daysAgo(days: 4), category: .physical, type: PhysicalMetricType.weight.rawValue, value: 17)
        vm?.metricsManager?.addRecord(timestamp: .daysAgo(days: 5), category: .physical, type: PhysicalMetricType.weight.rawValue, value: 15)
        vm?.metricsManager?.addRecord(timestamp: .daysAgo(days: 6), category: .physical, type: PhysicalMetricType.weight.rawValue, value: 14)
        vm?.metricsManager?.addRecord(timestamp: .daysAgo(days: 7), category: .physical, type: PhysicalMetricType.weight.rawValue, value: 12)
    }
    
    @ViewBuilder
    var addWeightData: some View {
        Button("Add weight data") {
            vm?.addRecord(type: .weight, value: 20)
        }
    }
    
    private func textualInfo(for vm: StatisticsViewModel) -> some View {
        @Bindable var bindableVM = vm
        
        return VStack{
            Text("Selected period: \(vm.selectedPeriod.rawValue)")
            Text("\n**ChartDisplayState**")
            Text("Visible days: \(vm.chartDisplayState.period.days)")
            Text("Visible domain: \(vm.chartDisplayState.visibleDomain)")
            Text("Scroll position: \(vm.chartDisplayState.scrollPosition)")
            Text("\n**sliderSelection**")
            Text("Slider range: \(vm.sliderSelection.sliderRange)")
//            Text("Lower thumb: \(vm.sliderSelection.lowerThumb)")
//            Text("Upper thumb: \(vm.sliderSelection.upperThumb)")
            Text("")
            Text("\(vm.recordsByMetric.count)")
            Text("\(vm.recordsByMetric.first)")
            // Відображення базової метрики
            if let weightRecords = vm.recordsByMetric[.physical(.weight)] {
                Text("Кількість записів ваги: \(weightRecords.count)")
                Text("First value: \(weightRecords.first?.value)")
                // Місце для інтеграції DataDifference та LinearChart
                let period = vm.selectedPeriod
                let visibleDomain = vm.chartDisplayState.visibleDomain
                LinearChart(
                    data: weightRecords,
                    period: period,
                    visibleDomain: visibleDomain,
                    scrollPosition: $bindableVM.chartDisplayState.scrollPosition
                )
            } else {
                Text("No data")
            }
        }
    }
}



/*
 var body: some View {
//        periodPicker
//        Text("Weight")
//        DataDifference(of: vm.weight, period: vm.period)
//        LinearChart(data: vm.weight.data, viewController: vm.viewController)
//        CartSlider()
//        ForEach(additionalCharts) { option in
//            ExactChart()
//        }
 }
*/
