//
//  EmojiProvider.swift
//  
//
//  Created by Kévin Sibué on 13/01/2023.
//

import Foundation
import Smile

public protocol EmojiProvider {
    func getAll() -> [Emoji]
}
