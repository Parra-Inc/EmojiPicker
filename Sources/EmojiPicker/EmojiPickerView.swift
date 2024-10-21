//
//  EmojiPickerView.swift
//  
//
//  Created by Kévin Sibué on 11/01/2023.
//

import SwiftUI
import Smile

public struct EmojiPickerView: View {

    @Environment(\.dismiss)
    var dismiss

    @Binding
    public var selectedEmoji: Emoji?

    @State
    private var search: String = ""

    private var selectedColor: Color
    private var emojiBackgroundColor: Color
    private var emojiCornerRadius: CGFloat
    private var searchEnabled: Bool

    public init(
        selectedEmoji: Binding<Emoji?>,
        searchEnabled: Bool = false,
        selectedColor: Color = .blue,
        emojiBackgroundColor: Color = .gray.opacity(0.4),
        emojiCornerRadius: CGFloat = 16,
        emojiProvider: EmojiProvider = DefaultEmojiProvider()) {
        self._selectedEmoji = selectedEmoji
        self.selectedColor = selectedColor
        self.emojiBackgroundColor = emojiBackgroundColor
        self.emojiCornerRadius = emojiCornerRadius
        self.searchEnabled = searchEnabled
        self.emojis = emojiProvider.getAll()
    }

    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]

    let emojis: [Emoji]

    private var searchResults: [Emoji] {
        if search.isEmpty {
            return emojis
        } else {
            return emojis
                .filter { ($0.description ?? "").lowercased().contains(search.lowercased()) }
        }
    }

    public var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(searchResults, id: \.self) { emoji in
                    RoundedRectangle(cornerRadius: emojiCornerRadius)
                        .fill(selectedEmoji == emoji ? selectedColor : emojiBackgroundColor)
                        .frame(width: 64, height: 64)
                        .overlay {
                            Text(emoji.value)
                                .font(.largeTitle)
                        }
                        .onTapGesture {
                            selectedEmoji = emoji
                            dismiss()
                        }
                }
            }
            .padding(.horizontal)
        }
        .frame(maxHeight: .infinity)
        .searchable(text: $search)
    }

}

struct EmojiPickerView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiPickerView(selectedEmoji: .constant(Emoji(value: "", description: "")))
    }
}
