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
    var favorite: Bool
}

extension Emoji {
    static func getEmojis() -> [Emoji] {
        [Emoji(emoji: "😀", name: "Smile", description: "Lets smile every day", favorite: false),
         Emoji(emoji: "🥰", name: "Love", description: "Lets love each other", favorite: false),
         Emoji(emoji: "🐱", name: "Cat", description: "Cat is the cutest animal", favorite: false)]
    }
}
