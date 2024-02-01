//
//  LoginView.swift
//  KodeHaus
//
//  Created by Diana Duong on 1/10/24.
//


import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        ZStack(alignment: .center) {
        
        
            
            VStack(alignment: .center) {
               // Spacer()
                
                Text("Kode")
                    .foregroundColor(.magenta)
                    .font(Font.system(size: 40, weight: .bold))
                    +
                Text("Haus")
                    .foregroundColor(.blue2)
                    .font(Font.system(size: 40, weight: .light))
                
                Text("A community for techies.")
                    .foregroundColor(.gray)
                    .font(Font.system(size: 24, weight: .light))
                  
                
                Image("LoginImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 320, height: 200)
                    .padding(.top, 40)
                
                Text("Illustration by Icons 8 from Ouch!")
                    .foregroundColor(.gray)
                    .font(.system(size: 7))
                
                Spacer()
            }
            //.offset(y: 60)
            .padding(.top, 30)
            
            
          
            VStack {
                Spacer()
                
                Section {
                    TextField("Email", text: $viewModel.emailLogin)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                        .disableAutocorrection(true)
                        .foregroundColor(.black)
                        Rectangle()
                            .frame(height: 3)
                            .foregroundColor(.magenta)
                            .padding(.bottom, 30)

                    SecureField("Password", text: $viewModel.passwordLogin)
                        .foregroundColor(.black)
                        Rectangle()
                            .frame(height: 3)
                            .foregroundColor(.magenta)
                            .padding(.bottom, 20)
                }
                .frame(width: 350)
                
                
                Button(action: {
                    print("Login Button Tapped")
                    //func to check if form is valid
                    viewModel.saveChanges()
                }) {
                    DefaultButton(title: "Login")
                }
                .padding(.bottom, 10)
                
                
                Button(action: {
                    print("Create an Account")
                }) {
                    GhostButton(title: "Create an Account")
                }
               
                Text("Forgot your password?")
                    .font(.subheadline)
                    .foregroundColor(.magenta)
                    .fontWeight(.bold)
                    .padding(.top, 10)
                
            } // end vstack
            .offset(y: -40)
            
        } // end Zstack
        
        //implementing the alerts for the form fields
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}
     
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
