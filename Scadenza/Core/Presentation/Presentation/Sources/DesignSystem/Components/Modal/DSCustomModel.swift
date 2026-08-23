//
//  SwiftUIView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 23/08/2026.
//

import SwiftUI

extension View {

    @ViewBuilder
    func showCustomModal(type: DSCustomModalType = .alert, with manager: ModalManager) -> some View {

        switch type {
        case .alert:
            self.modifier(DSAlertModifier(manager: manager))
        case .confirmationDialogue:
            self.confirmationDialog(
                    manager.content?.title ?? "",
                    isPresented: Binding(ifNotNil: .constant(manager.content)),
                    actions: {

                        if let buttons = manager.content?.buttons {
                            VStack {
                                ForEach(buttons) { button in
                                    DSButtonView(
                                        label: button.label,
                                        variant: button.variant,
                                        action: button.action
                                    )
                                }
                            }
                        } else {
                            DSButtonView(
                                label: "Ok",
                                variant: .primary,
                                action: manager.dismiss
                            )
                        }

                    },
                    message: {
                        if let message = manager.content?.message {
                            Text(message)
                        }
                    }
                )
        }

    }
}

private struct CustomAlertStateView: View {

    @State var alertManager: ModalManager = ModalManager()
    @State var modalType: DSCustomModalType = .alert

    private func getModalContent() -> ModalContent {
        .init(
            icon: .trash,
            title: "Delete document?",
            variant: .danger,
            message: "«RC Auto · Fiat Panda» and its attachment will be removed from this iPhone.",
            buttons: [
                ModalButton(
                    label: "Delete",
                    variant: .destructive,
                    action: self.alertManager.dismiss
                ),

                ModalButton(
                    label: "Cancel",
                    variant: .textual,
                    action: self.alertManager.dismiss
                ),
            ]
        )
    }

    var body: some View {
        VStack {
            Text("«RC Auto · Fiat Panda» and its attachment will be removed from this iPhone.")

            DSButtonView(
                label: "Delete (Alert)",
                variant: .destructive,
                action: (
                    {
                        modalType = .alert
                        alertManager.present(content: getModalContent())

                    })
            )

            DSButtonView(
                label: "Delete (Confirm Dialog)",
                variant: .destructive,
                action: (
                    {
                        modalType = .confirmationDialogue
                        alertManager.present(content: getModalContent())

                    })
            )
        }
        .padding()
        .showCustomModal(type: modalType, with: alertManager)

    }
}

#Preview {
    CustomAlertStateView()

}
