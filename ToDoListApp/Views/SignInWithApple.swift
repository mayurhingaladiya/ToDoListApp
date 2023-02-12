//
//  SignInWithApple.swift
//  ToDoListApp
//
//  Created by Mayur Hingaladiya on 12/02/2023.
//

import SwiftUI
import AuthenticationServices
import Foundation

struct SignInWithApple: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton(type: .signIn, style: .black)
    }
    
    func updateUIView(_ uiView: some UIView, context: Context){
        
    }
}
