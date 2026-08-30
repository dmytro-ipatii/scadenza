//
//  DSPasscodeInputView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 30/08/2026.
//

import SwiftUI

public struct DSPasscodeInputView: View {
    private var maxLength: Int
    @Binding private var value: String
    private var autofocus: Bool
    private var onChange: ((String) -> Void)?

    @FocusState private var isFocused: Bool

    public init(
        value: Binding<String>,
        maxLength: Int = 6,
        autofocus: Bool = true,
        onChange: ((String) -> Void)? = nil
    ) {
        self._value = value
        self.maxLength = maxLength
        self.autofocus = autofocus
        self.onChange = onChange
    }

    public var body: some View {

        ZStack {

            HStack(spacing: DSSpace.sm) {
                ForEach(0..<maxLength) { index in

                    let splitedPassword = Array(value.split(separator: ""))

                    Circle()
                        .stroke(DSColor.surfaceInverse, style: StrokeStyle(lineWidth: 1))
                        .frame(width: 15)
                        .overlay {
                            if splitedPassword.indices.contains(index) {
                                Circle()
                                    .fill(DSColor.surfaceInverse)
                                    .frame(width: 15)
                                    .transition(.opacity)

                            }
                        }
                        .animation(.spring(duration: 0.3), value: value)
                }
            }

            TextField("", text: $value)
                .keyboardType(.numberPad)
                .focused($isFocused, equals: true)
                .opacity(0)
                .onChange(of: value) { _, newValue in
                    value = String(newValue.prefix(maxLength))

                    onChange?(value)
                }

        }
        .onAppear {
            isFocused = autofocus
        }

    }
}

#Preview {
    NavigationStack {
        DSPasscodeInputView(value: .constant("1234"))
    }
}
