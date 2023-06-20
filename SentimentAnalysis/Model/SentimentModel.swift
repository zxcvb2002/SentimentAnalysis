//
//  SentimentModel.swift
//  SentimentAnalysis
//
//  Created by 드즈 on 2023/05/13.
//

import Foundation
import CoreML
import CreateMLComponents

enum Sentiment {
    case basic
    case irrelevant
    case negative
    case neutral
    case positive
}

struct SentimentModel {
    func predictString(text: String) -> Sentiment {
        if text == "" || text == " " || text == "\n" {
            return .basic
        }
        do {
            let model = try SentimentAnalysisModel(configuration: MLModelConfiguration.init())
            
            let textSentimentAnalysisOutput = try model.prediction(text: text)
            
            switch (textSentimentAnalysisOutput.label) {
                case "Irrelevant": return .irrelevant
                case "Negative": return .negative
                case "Neutral": return .neutral
                case "Positive": return .positive
                default: return .basic
            }
        }
        
        catch {
            fatalError("Leading CoreML Model Failed")
        }
    }
}
