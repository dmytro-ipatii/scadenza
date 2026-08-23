//
//  DSFieldMessageView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 17/08/2026.
//

import SwiftUI

public enum DSFieldMessageVariant {
    case error
    case success

    var icon: ImageResource {
        switch self {
        case .error:
            .exclamation
        case .success:
            .checkCircle
        }
    }

    var color: Color {
        switch self {
        case .error:
            DSColor.danger
        case .success:
            DSColor.success
        }
    }
}

public struct DSFieldMessageView: View {

    var message: String
    var variant: DSFieldMessageVariant

    public var body: some View {
        HStack(spacing: DSSpace.xxxs) {
            Image(variant.icon)
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(width: DSIconSize.xs)

            Text(message)
                .fontCaption()
                .fontWeight(.semibold)

        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundStyle(variant.color)
    }
}

#Preview("Error") {
    DSFieldMessageView(
        message: "Complete two fields to continue",
        variant: .error
    )
    .padding()
}

#Preview("Success") {
    DSFieldMessageView(
        message: "Well done!",
        variant: .success
    )
    .padding()
}
