//
//  Home.swift
//  LittlestLemon
//
//  Created by ilaxoM1 on 11/08/24.
//

import SwiftUI

struct Home: View {

	let persistence	= PersistenceController()

    var body: some View {
		Menu().environment(\.managedObjectContext, persistence.container.viewContext)
		TabView {
			Menu().tabItem { Label("Menu"	, systemImage: "list.dash") }
			Menu().tabItem { Label("Profile", systemImage: "square.and.pencil") }
		}
		.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Home()
}
