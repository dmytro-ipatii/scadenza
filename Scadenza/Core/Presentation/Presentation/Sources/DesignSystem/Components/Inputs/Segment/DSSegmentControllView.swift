//
//  DSSegmentControllView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 07/08/2026.
//

import SwiftUI

struct DSSegmentControllView<Option: DSSegmentItemProtocol>: View {
    let options: [Option]
    @Binding var selection: Option

    var body: some View {
        Picker(
            "",
            selection: $selection,
            content: ({
                ForEach(options) { option in
                    Text(option.title)
                        .fontSecondary()
                        .fontWeight(selection == option ? .semibold : .regular)
                        .tag(option as Option)
                }
            })
        )
        .pickerStyle(.segmented)
        .glassEffect(.regular)
    }
}

private struct DSSegmentControllStateView: View {

    private enum CustomOption: String, DSSegmentItemProtocol {

        var id: Self {
            self
        }

        case month
        case timeline
        case reminder

        var title: LocalizedStringKey {
            switch self {
            case .month:
                "Mese"
            case .timeline:
                "Timeline"
            case .reminder:
                "Promemoria"
            }
        }

    }

    private let options = CustomOption.allCases
    @State private var selection: CustomOption = CustomOption.month

    var body: some View {
        DSSegmentControllView(
            options: options,
            selection: $selection
        )
    }
}

#Preview {
    DSSegmentControllStateView()
}
