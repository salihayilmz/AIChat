//
//  ChatMessageModel.swift
//  AIChat
//
//  Created by Saliha Yılmaz on 2.06.2025.
//

import Foundation

struct ChatMessageModel: Identifiable {
    let id: String
    let chatId: String
    let authorId: String?
    let content: String?
    let seenByIds: [String]?
    let dateCreated: Date?
    
    init(
        id: String,
        chatId: String,
        authorId: String? = nil,
        content: String? = nil,
        seenByIds: [String]? = nil,
        dateCreated: Date? = nil
    ) {
        self.id = id
        self.chatId = chatId
        self.authorId = authorId
        self.content = content
        self.seenByIds = seenByIds
        self.dateCreated = dateCreated
    }
    
    func hasBeenSeenByCurrentUser(userId: String) -> Bool {
        guard let seenByIds else { return false }
        return seenByIds.contains(userId)
    }
    
    static var mock: ChatMessageModel {
        mocks[0]
    }

    static var mocks: [ChatMessageModel] {
            let now = Date()
            return [
                ChatMessageModel(
                    id: "msg1",
                    chatId: "chat1",
                    authorId: "user1",
                    content: "Hey, how are you?",
                    seenByIds: ["user2", "user3"],
                    dateCreated: now.addingTimeInterval(minutes: -30)
                ),
                ChatMessageModel(
                    id: "msg2",
                    chatId: "chat1",
                    authorId: "user2",
                    content: "I'm doing well, thanks!",
                    seenByIds: ["user2"],
                    dateCreated: now.addingTimeInterval(minutes: -25)
                ),
                ChatMessageModel(
                    id: "msg3",
                    chatId: "chat2",
                    authorId: "user1",
                    content: "Let’s meet tomorrow at 10.",
                    seenByIds: ["user2"],
                    dateCreated: now.addingTimeInterval(hours: -2)
                ),
                ChatMessageModel(
                    id: "msg4",
                    chatId: "chat3",
                    authorId: "user2",
                    content: "Sounds good!",
                    seenByIds: ["user4"],
                    dateCreated: now.addingTimeInterval(days: -1)
                )
            ]
        }
}
