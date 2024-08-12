//
//  MenuItem.swift
//  LittlestLemon
//
//  Created by ilaxoM1 on 12/08/24.
//

import Foundation

struct MenuItem 				: Codable, Identifiable {

	var id						= UUID()
	let title					: String
	let price					: String
	let image					: String
	let desc					: String
	let category				: String

	enum  CodingKeys			: String , CodingKey {

		case title 				= "title"
		case price 				= "price"
		case image 				= "image"
		case desc				= "description"
		case category			= "category"
	}
}
