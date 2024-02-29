//
//  LoginView.swift
//  KodeHaus
//
//  Created by Diana Duong on 1/10/24.
//


import SwiftUI
import FirebaseCore
import FirebaseAuth


struct LoginView: View {
    
    
    @Environment(\.colorScheme) var colorScheme
    
    @StateObject var viewModel = LoginViewModel()
    @State private var showModal = false
    
    var body: some View {
        ZStack {
            ScrollView {
                Spacer()
                
                VStack{
                    KHName()
                    
                    Text("A community for career changers.")
                        .foregroundColor(.gray)
                        .font(Font.system(size: 20, weight: .light))
                        .multilineTextAlignment(.center)
                        .padding(.leading, 30)
                        .padding(.trailing, 30)
                    
                    Image("LoginImage")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 200, alignment: .center)
                        .padding(.top, 25)
                    
                    Text("All Illustrations by Icons 8 from Ouch!")
                        .foregroundColor(.gray)
                        .font(.system(size: 8))
                }
                .padding(.top, 50)
             
                
                VStack {
                    Spacer()

                        TextField("Email", text: $viewModel.emailLogin)
                            .textFieldStyling()
                            .placeholder(when: viewModel.emailLogin.isEmpty) {
                                Text("Email")
                                    .foregroundColor(.white)
                            }
                            Rectangle()
                                .frame(height: 3)
                                .foregroundColor(Color.magenta1)
                                .padding(.bottom, 30)
                        
                        SecureField("Password", text: $viewModel.passwordLogin)
                            .textFieldStyling()
                            .placeholder(when: viewModel.passwordLogin.isEmpty) {
                                Text("Password")
                                    .foregroundColor(.white)
                            }
                            Rectangle()
                                .frame(height: 3)
                                .foregroundColor(Color.magenta1)
                                .padding(.bottom, 20)
                    
                    
                        Button(action: {
                            print("Login Button Tapped")
                            //func to check if form is valid
                            viewModel.loginValid()
                            viewModel.loginAuth()
                        }) {
                            PrimaryBtn(title: "Login")
                        }
                        .padding(.bottom, 5)
                        
                        
                        Button(action: {
                            print("Create an Account")
                            showModal = true
                            viewModel.newAccountAuth()
                        }) {
                            SecondaryBtn(title: "Create an Account")
                                .sheet(isPresented: $showModal) {
                                    CreateAccountView()
                                }
                        }
                        
                        Text("Forgot your password?")
                            .font(.subheadline)
                            .foregroundColor(colorScheme == .dark ? .white : .magenta1)
                            .fontWeight(.bold)
                            .padding(.top, 15)
                        
                } // end vstack
                .frame(width: 350, alignment: .leading)
                .offset(y: 80)
                
            } //end scrollview
            
        } // end Zstack
        
        //implementing the alerts for the form fields
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        } //end alert
    }
}
     
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}



