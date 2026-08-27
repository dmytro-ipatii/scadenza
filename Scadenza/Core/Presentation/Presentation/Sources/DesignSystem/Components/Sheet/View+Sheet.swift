//
//  View+Sheet.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 26/08/2026.
//

import SwiftUI

extension View {

    func dsSheet<Content: View>(
        isPresented: Binding<Bool>,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {

        self.sheet(
            isPresented: isPresented,
            content: {
                content()
                    .padding(.top, DSSpace.lg)
                    .padding(.horizontal, DSSpace.lg)
            }
        )
    }

    func dsOptionPickertSheet<T: DSOptionPickerValueProtocol>(
        label: String,
        isPresented: Binding<Bool>,
        selection: Binding<T?>,
        options: [T]
    ) -> some View {

        self.dsSheet(
            isPresented: isPresented) {
                DSSheetContentOptionsListView(
                    selection: selection,
                    title: label,
                    options: options
                )
            }
    }

    func dsOptionPickertSheet<T: DSOptionPickerValueProtocol>(
        label: String,
        isPresented: Binding<Bool>,
        selection: Binding<T>,
        options: [T]
    ) -> some View {

        self.dsSheet(isPresented: isPresented) {
            DSSheetContentOptionsListView(
                selection: selection,
                title: label,
                options: options
            )
        }
    }


}
