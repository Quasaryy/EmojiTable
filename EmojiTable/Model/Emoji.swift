//
//  Emoji.swift
//  EmojiTable
//
//  Created by Yury on 31.01.23.
//

struct Emoji {
    var emoji: String
    var name: String
    var description: String
}

extension Emoji {
    static func getEmojis() -> [Emoji] {
        [Emoji(emoji: "😀", name: "Smile", description: "Lets smile every day"),
         Emoji(emoji: "🥰", name: "Love", description: "Lets love each other"),
         Emoji(emoji: "🐱", name: "Cat", description: "Cat is the cutest animal")]
    }
}
