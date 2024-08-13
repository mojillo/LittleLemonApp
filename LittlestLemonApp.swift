//
//  LittlestLemonApp.swift
//  LittlestLemon
//
//  Created by ilaxoM1 on 11/08/24.
//

import SwiftUI

@main
struct LittlestLemonApp: App {

	let persistenceController	= PersistenceController.shared

    var body: some Scene {
        WindowGroup {
			Onboarding()
				.environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
