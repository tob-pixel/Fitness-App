//
//  HelperTextBlock.swift
//  FitnessApp
//
//  Created by visortix on 12.02.2026.
//

import SwiftUI

struct HelperTextBlock: View {
    
    @State private var vm = HelperViewModel.init()
    
    var body: some View {
        VStack(spacing: Spacing.helperTextBlock) {
            ForEach(vm.helperText, id: \.self) { text in
                Text(text).font(.main)
            }
        }
        .padding(Padding.helperTextBlock)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(LinearGradient.helperMain)
    }
}

#Preview {
    HelperTextBlock()
}
