//
//  ProfileOptionRowView.swift
//  Airbnb
//
//  Created by Lokesh on 13/09/25.
//

import SwiftUI

struct ProfileOptionRowView: View {
    let imageName : String
    let title : String
    var body: some View {
        VStack{
            HStack{
                Image(systemName: imageName)
                
                Text(title)
                    .font(.subheadline)
                    Spacer()
                
                Image(systemName: "chevron.right")
                
            }
            Divider()
        }
        
        
    }
}

#Preview {
    ProfileOptionRowView(imageName: "gear", title: "Setting")
}
