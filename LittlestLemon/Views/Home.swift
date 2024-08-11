//
//  Home.swift
//  LittlestLemon
//
//  Created by ilaxoM1 on 11/08/24.
//

import SwiftUI

struct Home: View {
    var body: some View {
		TabView {
			Menu().tabItem { Label("Menu", systemImage: "list.dash") }
			Menu().tabItem { Label("Profile", systemImage: "square.and.pencil") }
		}
		.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Home()
}
