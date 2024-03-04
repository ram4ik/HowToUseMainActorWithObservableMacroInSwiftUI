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

@MainActor
class ObservableViewModel: ObservableObject {
    
    let database = TitleDatabase()
    @Published var title: String = "Starting title"
    
    func updateTitle() async {
        title = await database.getNewTitle()
    }
}

struct ContentView: View {
    
    @StateObject private var viewModel = ObservableViewModel()
    
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
