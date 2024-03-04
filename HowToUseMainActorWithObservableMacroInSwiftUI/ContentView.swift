//
//  ContentView.swift
//  HowToUseMainActorWithObservableMacroInSwiftUI
//
//  Created by test on 04.03.2024.
//

import SwiftUI

actor TitleDatabase {
    
    func getNewTitle() -> String {
        "Some new title!"
    }
}

@Observable class ObservableViewModel {
    
    @ObservationIgnored let database = TitleDatabase()
    @MainActor var title: String = "Starting title"
    
    @MainActor
    func updateTitle() async {
        title = await database.getNewTitle()
    }
}

struct ContentView: View {
    
    @State private var viewModel = ObservableViewModel()
    
    var body: some View {
        Text(viewModel.title)
            .task {
                await viewModel.updateTitle()
            }
    }
}

#Preview {
    ContentView()
}
