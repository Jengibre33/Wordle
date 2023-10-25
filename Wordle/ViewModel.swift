//
//  ViewModel.swift
//  Wordle
//
//  Created by Javier on 25/10/23.
//

import Foundation

final class ViewModel: ObservableObject {
    var numOfRow: Int = 0
    @Published var result: String = "REINA"
    @Published var word: [LetterModel] = []
    @Published var gameData: [[LetterModel]] = [
        [.init(""), .init(""), .init(""), .init(""), .init("")],
        [.init(""), .init(""), .init(""), .init(""), .init("")],
        [.init(""), .init(""), .init(""), .init(""), .init("")],
        [.init(""), .init(""), .init(""), .init(""), .init("")],
        [.init(""), .init(""), .init(""), .init(""), .init("")],
        [.init(""), .init(""), .init(""), .init(""), .init("")],
    ]
    
    func addNewLetter(letterModel: LetterModel) {
        if letterModel.name == "🚀" {
            tapOnSend()
            return
        }
        
        if letterModel.name == "🗑" {
            tapOnRemove()
            return
        }
        
        if word.count < 5 {
            let letter = LetterModel(letterModel.name)
            word.append(letter)
            gameData[numOfRow][word.count-1] = letter
        }
    }
    
    private func tapOnSend() {
        print("Tap on send")
        guard word.count == 5 else {
            print("Añade mas letras!")
            return
        }
        
        let finalStringWord = word.map { $0.name }.joined()
        
        if wordIsReal(word: finalStringWord) {
            print("Correct word")
            
            for (index, _) in word.enumerated() {
                let currentCharacter = word[index].name
                var status: Status
                
                if result.contains(where: { String($0) == currentCharacter }) {
                    status = .appear
                    print("\(currentCharacter) .match")
                }
            } else {
                status = .dontAppear
                print("\(currentCharacter) .dontAppear")
            }
            
            // Update GameView
            var updateGameBoardCell = gameData[numOfRow][index]
            updateGameBoardCell.status = status
            gameData[numOfRow][index] = updateGameBoardCell
            
            // Update keyboardView
            let indexToUpdate = keyboardData.firstIndex(where: { $0.name == word[index].name })
            var keyboardKey = keyboardData[indexToUpdate!]
            if keyboardKey.status != .match {
                keyboardKey.status = status
                keyboardData[indexToUpdate!] = keyboardKey
            }
        }
        
        // Clean word and move to thew row
        word = []
        numOfRow += 1
    } else {
        print("Incorrect word")
    }
    
    private func tapOnRemove() {
        print("Tap on remove")
    }
}
    private func wordIsReal(word: String) -> Bool {
        UIReferenceLibraryViewController.dictionaryHasDefinition(forTerm: word)
    }
}
