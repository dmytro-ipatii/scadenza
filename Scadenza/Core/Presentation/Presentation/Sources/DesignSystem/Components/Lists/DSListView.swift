//
//  DSListView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 15/08/2026.
//

import SwiftUI

public struct DSListView<Item: Hashable>: View {
    @Binding var selection: Item?
    var items: [Item]
    var onItemPress: (Item) -> Void
    var listItem: (Item) -> AnyView

    public init(
        selection: Binding<Item?>,
        items: [Item],
        onItemPress: @escaping (Item) -> Void = { _ in },
        listItem: @escaping (Item) -> AnyView
    ) {
        self._selection = selection
        self.items = items
        self.onItemPress = onItemPress
        self.listItem = listItem
    }

    public var body: some View {
        List(items, id: \.hashValue, selection: $selection) { item in

            listItem(item)
                .frame(maxWidth: .infinity, alignment: .leading)
                .listRowBackground(DSColor.surfaceSecondary)
                .contentShape(.rect)
                .onTapGesture(perform: ({ onItemPress(item) }))
        }
        .listStyle(.plain)
        .dsListBackgroud()

    }
}

#Preview {
    DSListView(
        selection: .constant(nil),
        items: ["Option One", "Option Two", "Option Three"],
        listItem: ({ item in
            AnyView(Text(item))
        })
    )
}
