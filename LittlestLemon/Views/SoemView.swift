//
//  SoemView.swift
//  LittlestLemon
//
//  Created by ilaxoM1 on 11/08/24.
//

import SwiftUI

struct SoemView: View {

	@Environment(\.presentationMode) var presentationMode

    var body: some View {
		VStack {
			Text("hi")
		}
		.navigationBarBackButtonHidden(true)
		.navigationBarItems(leading: Button(action: {
			presentationMode.wrappedValue.dismiss()
		}) {
			Image(systemName: "chevron.left")
			Text("Back")
		})
    }
}

#Preview {
    SoemView()
}
