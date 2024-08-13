//
//  Onboarding.swift
//  LittlestLemon
//
//  Created by ilaxoM1 on 11/08/24.
//

import SwiftUI

/// Landing View main struct
struct Onboarding	: View {

	@StateObject private var viewModel = ViewModel()

	//MARK: - Variables
	@State private var firstName 			: String 	= ""
	@State private var lastName 			: String 	= ""
	@State private var email	 			: String 	= ""
	@State private var alertMessage			: String 	= ""
	@State private var phoneNumber			: String 	= ""

	@State var isKeyboardVisible 			: Bool		= false
	@State private var showAlert 			: Bool		= false
	@State private var isLoggedIn 			: Bool		= false

	@State var contentOffset				: CGSize 	= .zero

    var body: some View {
		NavigationStack {
			ScrollView(.vertical, showsIndicators: false) {
				VStack {
					Header()
					Hero()
						.padding()
						.background(Color.primaryColor1)
						.frame(maxWidth: .infinity, maxHeight: 340)
					VStack {
						NavigationLink(destination: Home(), isActive: $isLoggedIn) { }
						Text("First name *")
							.onboardingTextStyle()
						TextField("First Name", text: $firstName)
						Text("Last name *")
							.onboardingTextStyle()
						TextField("Last Name", text: $lastName)
						Text("E-mail *")
							.onboardingTextStyle()
						TextField("E-mail", text: $email)
							.keyboardType(.emailAddress)
					}
					.textFieldStyle(.roundedBorder)
					.disableAutocorrection(true)
					.padding()

					if viewModel.errorMessageShow {
						withAnimation() {
							Text(viewModel.errorMessage)
								.foregroundColor(.red)
								.frame(maxWidth: .infinity, alignment: .leading)
								.padding(.leading)
						}
					}

					Button("Register") {
						if viewModel.validateUserInput(firstName: firstName, lastName: lastName, email: email, phoneNumber: phoneNumber) {
							UserDefaults.standard.set(firstName, forKey: kFirstName)
							UserDefaults.standard.set(lastName, forKey: kLastName)
							UserDefaults.standard.set(email, forKey: kEmail)
							UserDefaults.standard.set(true, forKey: kIsLoggedIn)
							UserDefaults.standard.set(true, forKey: kOrderStatuses)
							UserDefaults.standard.set(true, forKey: kPasswordChanges)
							UserDefaults.standard.set(true, forKey: kSpecialOffers)
							UserDefaults.standard.set(true, forKey: kNewsletter)
							firstName = ""
							lastName = ""
							email = ""
							isLoggedIn = true
						}
					}
					.buttonStyle(ButtonStyleYellowColorWide())

					Spacer()
				}
				.offset(y: contentOffset.height)
				.onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { notification in
					withAnimation {
						let keyboardRect = notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
						let keyboardHeight = keyboardRect.height
						self.isKeyboardVisible = true
						self.contentOffset = CGSize(width: 0, height: -keyboardHeight / 2 + 50)
					}

				}
				.onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { notification in
					withAnimation {
						self.isKeyboardVisible = false
						self.contentOffset = .zero
					}
				}
			}
			.onAppear() {
				if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
					isLoggedIn = true
				}
			}
		}
		.navigationBarBackButtonHidden()
    }
}

struct OnboardingPreview: PreviewProvider {
	static var previews: some View {
		Onboarding()
	}
}
