//
//  GameView.swift
//  Wordle
//
//  Created by Javier on 25/10/23.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var viewModel: ViewModel
    private let columns: [GridItem] = Array(repeating: GridItem(.flexible(minimum: 20), spacing: 0), count: 5)
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 8) {
            ForEach(0...5, id: \.self) { index in
                ForEach(viewModel.gameData[index], id: \.id) { model in
                    Button {
                        // TODO
                    } label: {
                        Text(model.name)
                            .font(.system(size: 40, weight: .bold))
                    }
                    .frame(width: 60, height: 60)
                    .foregroundColor(model.foregroundColor)
                    .background(model.backgroundColor)
                }
            }
        }
        .padding(.horizontal, 20)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: ViewModel())
    }
}
