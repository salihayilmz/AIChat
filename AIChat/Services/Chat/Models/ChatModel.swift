//
//  ChatModel.swift
//  AIChat
//
//  Created by Saliha Yılmaz on 2.06.2025.
//

import Foundation

struct ChatModel: Identifiable {
    let id: String
    let userId: String
    let avatarId: String
    let dateCreated: Date
    let dateModified: Date

    static var mock: Self {
        mocks[0]
    }

    static var mocks: [Self] {
        let now = Date()
        return [
            ChatModel(
                id: "mock_chat_1",
                userId: "user1",
                avatarId: "avatar1",
                dateCreated: now.addingTimeInterval(days: -1),
                dateModified: now
            ),
            ChatModel(
                id: "mock_chat_2",
                userId: "user2",
                avatarId: "avatar2",
                dateCreated: now.addingTimeInterval(days: -5),
                dateModified: now.addingTimeInterval(days: -1)
            ),
            ChatModel(
                id: "mock_chat_3",
                userId: "user3",
                avatarId: "avatar3",
                dateCreated: now.addingTimeInterval(days: -30),
                dateModified: now.addingTimeInterval(days: -7)
            ),
            ChatModel(
                id: "mock_chat_4",
                userId: "user4",
                avatarId: "avatar4",
                dateCreated: now,
                dateModified: now
            )
        ]
    }
}
