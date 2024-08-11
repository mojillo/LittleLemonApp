//
//  Onboarding.swift
//  LittlestLemon
//
//  Created by ilaxoM1 on 11/08/24.
//

import SwiftUI

//MARK: - Global Variables
let kFirstName						= "first name key"
let kLastName						= "last name key"
let kEmail							= "email key"
let kIsLoggedIn 					= "kIsLoggedIn"

/// Landing View main struct
struct Onboarding	: View {

	//MARK: - Variables
	@State private var firstName 			: String 	= ""
	@State private var lastName 			: String 	= ""
	@State private var emailVar	 			: String 	= ""
	@State private var alertMessage			: String 	= ""

	@State private var showAlert 			: Bool		= false
	@State private var isLoggedIn 			: Bool		= false

    var body: some View {
		NavigationView {

			VStack {

				NavigationLink (destination: Home()) {
					// if else block for name and pass word to be non empty and make isloggin true 
				}

				TextField	("First Name"	, text: $firstName)
				TextField	("Last Name"	, text: $lastName)
				TextField	("Email"		, text: $emailVar)
				Button		("Register") {

					if firstName.isEmpty || lastName.isEmpty {

						showAlert 			= true
						alertMessage 		= "Please fill in names"

					}
					else if emailVar.isEmpty {

						showAlert 			= true
						alertMessage 		= "Please enter an email address"

					}
					else if !isValidEmail(emailVar) {

						showAlert			= true
						alertMessage 		= "Please enter a valid email"

					}
					else {

						showAlert			= false
						UserDefaults.standard.setValue(firstName, forKey: kFirstName)
						UserDefaults.standard.setValue(lastName	, forKey: kLastName)
						UserDefaults.standard.setValue(emailVar	, forKey: kEmail)
						UserDefaults.standard.setValue(true		, forKey: kIsLoggedIn)
					}
				}
			}
			.onAppear() {
				if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
					isLoggedIn 	= true
				}
				else {
					isLoggedIn	= false
				}
			}
			.padding()
			.alert(isPresented: $showAlert) {
				Alert(title: 			Text(""),
					  message: 			Text(alertMessage),
					  dismissButton: .	default(Text("Ok"))
				)}
		}
		.navigationTitle("Register")
		.navigationDestination(isPresented: $isLoggedIn) {
			Home()
		}
    }
}

#Preview {
    Onboarding()
}
