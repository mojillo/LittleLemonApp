//
//  Home.swift
//  LittlestLemon
//
//  Created by ilaxoM1 on 11/08/24.
//

import SwiftUI

struct Home: View {

	var body: some View {
		MainScreen()
			.navigationBarBackButtonHidden()
	}
}

struct HomePreviews: PreviewProvider {
	static var previews: some View {
		Home().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
	}
}
