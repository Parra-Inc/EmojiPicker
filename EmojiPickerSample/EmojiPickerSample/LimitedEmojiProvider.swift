//
//  LimitedEmojiProvider.swift
//  EmojiPickerSample
//
//  Created by Kévin Sibué on 13/01/2023.
//

import Foundation
import EmojiPicker
import Smile

final class LimitedEmojiProvider: EmojiProvider {

    func getAll() -> [Emoji] {
        return [
            Emoji(value: "🚀", description: "Rocket"),
        ]
    }

}
