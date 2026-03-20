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
        .task { initViewModel() } // TODO: - Delete loadSampleData()
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
            ChartRangeSlider(lowerThumbPosoition: vm.sliderSelection.lowerThumbPosition,
                             upperThumbPosoition: vm.sliderSelection.upperThumbPosition
            )
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
