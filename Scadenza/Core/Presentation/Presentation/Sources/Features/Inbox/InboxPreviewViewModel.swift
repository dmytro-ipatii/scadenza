//
//  InboxPreviewViewModel.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 04/08/2026.
//

#if DEBUG

extension InboxViewModel {
    static func preview(
        outcome: PreviewLoadInboxUseCase.Outcome,
        delay: Double = 1
    ) -> InboxViewModel {
        return InboxViewModel(loadInbox: PreviewLoadInboxUseCase(outcome: outcome, delay: delay))
    }
}

#endif // DEBUG
