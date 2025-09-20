//
//  SearchAndFilterView.swift
//  Airbnb
//
//  Created by Lokesh on 10/09/25.
//

import SwiftUI

struct SearchAndFilterView: View {
    var body: some View {
        HStack(spacing: 12){
            Image(systemName: "magnifyingglass")
                
            
            VStack(alignment: .leading ,spacing: 3){
                Text("Where to?")
                    .fontWeight(.semibold)
                    .font(.footnote)
                
                
                Text("Any week- Anywhere - Anytime ")
                    .font(.footnote)

            }
            Spacer()
            Button{
                //act
            }label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundStyle(.black)
            }
        }
        .padding(.horizontal)
        .padding(.vertical,10)
        .overlay{
            Capsule()
                .stroke(lineWidth: 0.5)
                .foregroundColor(Color(.systemGray4))
                .shadow(color: .black.opacity(0.5),
                        radius: 2)
        }
    }
}

#Preview {
    SearchAndFilterView()
}
