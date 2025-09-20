//
//  ListingItemView.swift
//  Airbnb
//
//  Created by Lokesh on 10/09/25.
//

import SwiftUI

struct ListingItemView: View {
    let listing : Listing
    var body: some View {
        VStack{
           ListingCarouselView(listing: listing)
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
            HStack(alignment : .top){
                VStack(alignment: .leading){
                    Text("\(listing.city), \(listing.state)")
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                    
                    Text("12km away")
                        .foregroundColor(.gray)
                    
                    HStack(spacing: 3){
                        Text("₹\(listing.pricePerNights)")
                            .fontWeight(.semibold)
                        
                        Text("for 2 nights")
                    }
                    .foregroundStyle(.black)
                }
                Spacer()
                HStack(spacing: 2){
                    Image(systemName: "star.fill")
                        Text(String(format: "%.2f", listing.rating)
                                .replacingOccurrences(of: "\\.?0*$", with: "", options: .regularExpression))
                            .fontWeight(.semibold)
                }
                .foregroundStyle(.black)

            }
            .font(.footnote)
        }
        .padding()

    }
}

#Preview {
    ListingItemView(listing: MockData.shared.listing[0])
}
