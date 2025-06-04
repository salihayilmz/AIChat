//
//  ChatBubbleViewBuilder.swift
//  AIChat
//
//  Created by Saliha Yılmaz on 4.06.2025.
//

import SwiftUI

struct ChatBubbleViewBuilder: View {
    
    var message: ChatMessageModel = .mock
    var isCurrentUser: Bool = false
    var imageName: String?
    
    var body: some View {
        ChatBubbleView(
            text: message.content ?? "",
            textColor: isCurrentUser ? .white : .primary,
            backgroundColor: isCurrentUser ? .accent : Color(uiColor: .systemGray6),
            showImage: !isCurrentUser,
            imageName: imageName
        )
        .frame(maxWidth: .infinity, alignment: isCurrentUser ? .trailing : .leading)
        .padding(.leading, isCurrentUser ? 75 : 0)
        .padding(.trailing, isCurrentUser ? 0 : 75)
    }
}

#Preview {
    VStack(spacing: 24) {
        ChatBubbleViewBuilder()
        ChatBubbleViewBuilder(isCurrentUser: true)
        ChatBubbleViewBuilder(
            message: ChatMessageModel(
                id: UUID().uuidString,
                chatId: UUID().uuidString,
                authorId: UUID().uuidString,
                content: "This is some longer content that goes over multiple lines. It's a great way to demonstrate how the bubble view handles longer messages. It also allows for multiple lines of text, which is great for showing off longer messages.",
                seenByIds: nil,
                dateCreated: .now
            )
        )
        
        ChatBubbleViewBuilder(
            message: ChatMessageModel(
                id: UUID().uuidString,
                chatId: UUID().uuidString,
                authorId: UUID().uuidString,
                content: "This is some longer content that goes over multiple lines. It's a great way to demonstrate how the bubble view handles longer messages.",
                seenByIds: nil,
                dateCreated: .now
            ),
            isCurrentUser: true
        )
    }
    .padding(12)
    
}
