//
//  MemorizeApp.swift
//  Memorize
//
//  Created by David Nguyen on 06/06/2022.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
