//
//  WishlistView.swift
//  Airbnb
//
//  Created by Lokesh on 09/09/25.
//

import SwiftUI

struct WishlistView: View {
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 32){
                VStack(alignment: .leading ){
                    Text("Log in to view your wishlists.")
                        .font(.headline)
                    
                    Text("You can create, View or edit wishlists once you 've logged in")
                        .font(.footnote)
                    
                    Button{
                        print("login")
                    }label: {
                        Text("Log in")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .frame(width: 360, height: 48)
                            .background(Color(.pink))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    .padding(.top)
                }
                .padding()
                .navigationTitle("wishlists")
            }
            Spacer()
        }
    }
}

#Preview {
    WishlistView()
}
