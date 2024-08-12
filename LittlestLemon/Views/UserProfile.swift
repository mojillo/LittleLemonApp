//
//  UserProfile.swift
//  LittlestLemon
//
//  Created by ilaxoM1 on 12/08/24.
//

import SwiftUI

struct UserProfile: View {

	//MARK: - Variables
	@Environment(\.presentationMode) var presenetaion
	
	let fName : String	 = UserDefaults.standard.string(forKey: kFirstName) ?? "-"
	let lName : String	 = UserDefaults.standard.string(forKey: kLastName)	?? "-"
	let email : String	 = UserDefaults.standard.string(forKey: kEmail)		?? "-"

    var body: some View {
		VStack {
			Text("Personal information")
			Image("profile-image-placeholder")
			Text(fName)
			Text(lName)
			Text(email)
			Button("Logout") {
				UserDefaults.standard.setValue(false, forKey: kIsLoggedIn)
				self.presenetaion.wrappedValue.dismiss()
			}
			Spacer()
		}

    }
}

#Preview {
    UserProfile()
}
