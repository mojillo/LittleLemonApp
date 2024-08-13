//
//  MainScreen.swift
//  LittlestLemon
//
//  Created by ilaxoM1 on 13/08/24.
//

import SwiftUI

struct MainScreen: View {
	@Environment(\.managedObjectContext) private var viewContext

	var body: some View {
		NavigationStack {
			VStack {
				Header()
				Menu()
			}
		}
	}
}

struct MainScreenPreviews: PreviewProvider {
	static var previews: some View {
		MainScreen().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
	}
}
