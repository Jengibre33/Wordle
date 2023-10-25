//
//  ContentView.swift
//  Wordle
//
//  Created by Javier on 25/10/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack(spacing: 40) {
            GameView(viewModel: viewModel)
            KeyboardView(viewModel: viewModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
