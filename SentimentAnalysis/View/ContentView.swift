//
//  ContentView.swift
//  SentimentAnalysis
//
//  Created by 드즈 on 2023/05/13.
//
//

import SwiftUI

struct ContentView: View {
    @State private var inputText: String = ""
    @State private var sentiment: Sentiment = .basic
    
    var body: some View {
        ZStack {
            switch sentiment {
            case .irrelevant:
                Color.gray
                    .ignoresSafeArea()
            case .negative:
                Color.red
                    .ignoresSafeArea()
            case .neutral:
                Color.green
                    .ignoresSafeArea()
            case .positive:
                Color.blue
                    .ignoresSafeArea()
            default:
                Color.yellow
                    .ignoresSafeArea()
            }
            
            VStack {
                TextEditor(text: $inputText)
                    .frame(width: 250, height: 250)
                    .padding()
                    .background()
                    .cornerRadius(15)
                    .onChange(of: inputText) {
                        sentiment = SentimentModel().predictString(text: $0)
                    }

                Spacer()
                
                switch sentiment {
                case .irrelevant:
                    Text("😶")
                    Text("Irrelevant")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding()
                case .negative:
                    Text("😡")
                    Text("Negative")
                        .fontWeight(.bold)
                        .foregroundColor(.orange)
                        .padding()
                case .neutral:
                    Text("😐")
                    Text("Neutral")
                        .fontWeight(.bold)
                        .foregroundColor(.brown)
                        .padding()
                case .positive:
                    Text("🙂")
                    Text("Positive")
                        .fontWeight(.bold)
                        .foregroundColor(.cyan)
                        .padding()
                default:
                    Text("")
                }
            }
        }
        .onAppear(perform: UIApplication.shared.hideKeyboard)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
