//
//  ProfileView.swift
//  Airbnb
//
//  Created by Lokesh on 09/09/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(alignment :.leading,spacing : 32){
           
            VStack(alignment: .leading, spacing: 8){
                Text("Profile")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Text("Log in to start planning your next trip.")
                   
               Button{
                    print("clicked me")
                }label: {
                    Text("Log in")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 48)
                        .background(Color(.pink))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .padding(.top)
                }
                HStack(spacing: 8){
                    Text("Don't have an account?")
                    
                    Text("Sign up")
                        .fontWeight(.semibold)
                        .underline()
                }
                .padding(.top)
                .font(.caption)
                
                
                
            }
            VStack(spacing:24){
                ProfileOptionRowView(imageName: "gear" , title: "Settings")
                ProfileOptionRowView(imageName: "gear", title: "Accessibility")
                ProfileOptionRowView(imageName: "gear",
                                     title: "Visit the help center")
                
            }
            .padding(.vertical)
           
        }
        .padding()
        
    }
}

#Preview {
    ProfileView()
}
