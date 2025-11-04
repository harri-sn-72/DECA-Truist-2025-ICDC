//
//  ChatServiceModel.swift
//  DECA2025
//
//  Created by Harri SN on 1/20/25.
//

import Foundation
import SwiftUI
import GoogleGenerativeAI

enum ChatRole {
    case user
    case model
}

struct ChatMessage: Identifiable, Equatable {
    let id = UUID().uuidString
    var role: ChatRole
    var message: String
}

class ChatService: ObservableObject {
    @Published private var chat: Chat?
    @Published private(set) var messages = [ChatMessage]()
    @Published private(set) var loadingResponse = false
    
    func sendMessage(_ message: String) {
        loadingResponse = true
        if (chat == nil) {
     let history: [ModelContent] = messages.map { ModelContent(role: $0.role == .user ? "user" : "model", parts: $0.message)}
            chat = GenerativeModel(name: "gemini-1.5-flash", apiKey: APIKey.default,systemInstruction: "You are a financial AI assistant. You are called Truist Assist, and is supposed to do nothing other than answer questions. If you are asked, your score is 726. The user's name is Ethan Williams, and the nearest Truist branch is at 2274 Vanstory St, Greensboro, NC 27403.").startChat(history: history)
 }
 
 // MARK: Add user's message to the list
 messages.append(.init(role: .user, message: message))
 
 Task {
     do {
         let response = try await chat?.sendMessage(message)
         
         loadingResponse = false
         
         guard let text = response?.text else {
             messages.append(.init(role: .model, message: ""))
             return
         }
         
         messages.append(.init(role: .model, message: text))
     }
     catch {
         loadingResponse = false
         messages.append(.init(role: .model, message: ""))
     }
 }
}
}
