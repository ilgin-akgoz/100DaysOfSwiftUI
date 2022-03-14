//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Ilgın Akgöz on 8.03.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var moves = ["Rock", "Paper", "Scissors"]
    @State private var appChoice = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    @State private var endOfGame = false
    @State private var roundCount = 0
    
    var maxRound = 10
    var winningMoves = ["Paper", "Scissors", "Rock"]
    var losingMoves = ["Scissors", "Rock", "Paper"]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.indigo, .white, .pink]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()

            VStack {
               Spacer()
                
               VStack(spacing: 15) {
                    
                   Text("Player's choice: \(moves[appChoice])")
                       .font(.title.bold())
                       .foregroundColor(.white)
                    
                    if shouldWin {
                        Text("Win")
                            .font(.title2.bold())
                            .foregroundColor(.white)
                    } else {
                        Text("Lose")
                            .font(.title2.bold())
                            .foregroundColor(.white)
                    }
                    
                    Button {
                        tap("Rock")
                    } label: {
                        Text("🪨")
                    }
                    .font(.system(size: 100))
                    
                    Button {
                        tap("Paper")
                    } label: {
                        Text("📃")
                    }
                    .font(.system(size: 100))
                    
                    Button {
                        tap("Scissors")
                    } label: {
                        Text("✂️")
                    }
                    .font(.system(size: 100))
                   
                   
                    
                }
                Spacer()
                Spacer()
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
            }
            
        }
        
        .alert("Game Over", isPresented: $endOfGame) {
            Button("Start Again", action: reset)
        } message: {
            Text("Final Score: \(score)")
        }
        
        
    }
    
    func tap(_ choice: String) {
        if shouldWin && appChoice == winningMoves.firstIndex(of: choice){
            score += 1
        } else if shouldWin == false && appChoice == losingMoves.firstIndex(of: choice) {
            score += 1
        } else {
            score -= 1
        }
        
        rounds()
    }
    
    func reset() {
        score = 0
        roundCount = 0
        rounds()
    }
    
    func rounds() {
        shouldWin.toggle()
        appChoice = Int.random(in: 0...2)
        
        if(roundCount < maxRound) {
            roundCount += 1
        } else {
            endOfGame = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
