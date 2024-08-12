//
//  Menu.swift
//  LittlestLemon
//
//  Created by ilaxoM1 on 11/08/24.
//

import SwiftUI

struct Menu: View {

	@Environment(\.managedObjectContext) private var viewContext

    var body: some View {
		VStack {
			Text("Little Lemon")
			Text("Chicago").bold()
			Text("Best center")
		}
		.onAppear() {
			getMenuData()
		}
    }

	/// Gets data from api url and stores it in the struct MenuItems and them creats an array viewContext: NSManagedObjectContext
	func getMenuData(){

		// clear the database each time before saving the menu list again
		PersistenceController.shared.clear()

		// holds server url string
		let url				= URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")
		let requestURL		= URLRequest(url: url!)
		let session			= URLSession.shared
		let dataTask		= session.dataTask(with: requestURL) { dataFromApi, response, error in

			if let data = dataFromApi {
				let decoder = JSONDecoder()
				
				if let onlineMenu = try? decoder.decode(MenuList.self, from: data) {

					for dishes in onlineMenu.menu {
						let dishData		= Dish(context: viewContext)
						dishData.title		= dishes.title
						dishData.price		= dishes.price
						dishData.desc		= dishes.desc
						dishData.image		= dishes.image
						dishData.category	= dishes.category
					}
					// save the data into the database
					try? viewContext.save()
				}
				else { // output error if the try fails
					print(error.debugDescription.description)
				}
			}
			else { // output if the data type cast fails
				print(error.debugDescription.description)
			}
		}
		dataTask.resume()
	}
}

#Preview {
    Menu()
}
