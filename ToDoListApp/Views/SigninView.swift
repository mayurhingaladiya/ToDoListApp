//
//  SigninView.swift
//  ToDoListApp
//
//  Created by Mayur Hingaladiya on 12/02/2023.
//

import SwiftUI

struct SigninView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var coordinator: Signinwithapplecord?
    
    var body: some View {
        VStack {
            Text("Sign in to TODO list app Here!")
            SignInWithApple()
                .frame(width: 200, height: 45)
                .onTapGesture {
                    self.coordinator = Signinwithapplecord()
                    if let coordinator = self.coordinator {
                        coordinator.startSignInWithAppleFlow {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
                    
                    
                }
        }
    }
}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
    }
}
