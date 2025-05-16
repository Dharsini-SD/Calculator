//
//  LoginView.swift
//  Calculator
//
//  Created by Dharsini S on 09/05/25.
//

import SwiftUI

struct LoginView: View {
    @State var username: String = ""
    @State var password : String = ""
    @State var isShowPassword : Bool = false
    var body: some View {
        VStack{
            
            Text("Digi Calci").font(.largeTitle).padding().foregroundStyle(LinearGradient(colors: [.blue,.pink], startPoint: .topTrailing, endPoint: .bottomLeading))
            
            Spacer()
            HStack{
                Image(systemName: "person.fill").renderingMode(.original).foregroundStyle(LinearGradient(colors: [.blue,.pink], startPoint: .topTrailing, endPoint: .bottomLeading))
                Text("Username").font(.title2)
            }.frame(maxWidth: .infinity,alignment: .leading).padding(.leading)
            
            TextField("", text: $username)
                .padding(.leading,5)
                .overlay( Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(LinearGradient(colors: [.blue,.pink], startPoint: .topTrailing, endPoint: .bottomLeading)),
                alignment: .bottom)
                .frame(height: 30)
                
                .cornerRadius(10)
                .padding(.horizontal)
                .textContentType(.name)
            
            
            HStack{
                Image(systemName: "lock.fill").renderingMode(.template).foregroundStyle(LinearGradient(colors: [.blue,.pink], startPoint: .topTrailing, endPoint: .bottomLeading))
                Text("Password").font(.title2)
            }.frame(maxWidth: .infinity,alignment: .leading).padding(.leading)
           
            SecuredTextField()
            
            Button(action: {
                
            }){
                Text("Login")
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background{
                        LinearGradient(colors: [.blue,.pink], startPoint: .topTrailing, endPoint: .bottomLeading)
                    }
            }.frame(maxWidth: .infinity)
                .padding()
            
            Button("Forgot Password?"){
                
            }.padding(.top)
            
            HStack{
                Text("Don't have an account?")
                Button("Sign Up"){
                    
                }
            }.padding(.top)
            
            
            Spacer()
               
        }
    }
}

#Preview {
    LoginView()
}

struct SecuredTextField: View {
    @State var password : String = ""
    @State var isShowPassword : Bool = false
    @FocusState var focusSecureField : Bool
    @FocusState var focusPasswordField : Bool
    var body: some View {
        
        HStack{
            ZStack{
                SecureField("", text: $password)
                    .padding(.leading,5)
                    .textContentType(.password)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.none)
                    .opacity(isShowPassword ? 0:1)
                    .focused($focusSecureField)
                
                TextField("", text: $password)
                    .padding(.leading,5)
                    .textContentType(.password)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.none)
                    .opacity(isShowPassword ? 1 : 0)
                    .focused($focusPasswordField)
            }
            
            
            
            Image(systemName: isShowPassword ?  "eye" :  "eye.slash")
                .padding(.bottom)
                .padding(.trailing)
                .onTapGesture {
                    isShowPassword.toggle()
                    if isShowPassword {focusSecureField = false} else{ focusPasswordField = false}
                }
        }
        
        .frame(height: 30)
        .overlay(Rectangle().frame(height: 1)
            .foregroundStyle(LinearGradient(colors: [.blue,.pink], startPoint: .topTrailing, endPoint: .bottomLeading)), alignment: .bottom)
        
        .cornerRadius(10)
        .padding(.horizontal)
    }
}
