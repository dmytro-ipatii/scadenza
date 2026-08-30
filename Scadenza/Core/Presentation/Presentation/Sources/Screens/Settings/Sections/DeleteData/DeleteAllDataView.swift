//
//  DeleteAllDataView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 30/08/2026.
//

import SwiftUI

struct DeleteAllDataView: View {
    var body: some View {
        DSScrollableScreenView(content: {
            Text("Delete all data")
                .fontTitle()
                .frame(maxWidth: .infinity, alignment: .leading)
        })
        .navigationTitle("Delete all data")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        DeleteAllDataView()
    }

}
