//
//  MenuList.swift
//  LittlestLemon
//
//  Created by ilaxoM1 on 12/08/24.
//

import Foundation
import CoreData

struct MenuList 	: Codable {

	let menu		: [MenuItem]

	// codable conformation
	enum CodingKeys	: String , CodingKey {
		case menu	= "menu"
	}
}
