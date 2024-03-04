//
//  ContentView.swift
//  HowToUseMainActorWithObservableMacroInSwiftUI
//
//  Created by test on 04.03.2024.
//

import SwiftUI

class ObservableViewModel: ObservableObject {
    
    @Published var title: String = "Starting title"
    
    func updateTitle() {
        title = "Some new title"
    }
}

struct ContentView: View {
    
    @StateObject private var viewModel = ObservableViewModel()
    
    var body: some View {
        Text(viewModel.title)
            .task {
                viewModel.updateTitle()
            }
    }
}

#Preview {
    ContentView()
}
