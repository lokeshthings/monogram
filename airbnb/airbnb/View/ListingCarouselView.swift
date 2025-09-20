//
//  ListingCarouselView.swift
//  Airbnb
//
//  Created by Lokesh on 10/09/25.
//

import SwiftUI

struct ListingCarouselView: View {
    let listing: Listing
    var body: some View {
        
        TabView{
            ForEach(listing.imageURLs, id: \.self) { image in Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
            
            .tabViewStyle(.page)
        
    }
}

#Preview {
    ListingCarouselView(listing: MockData.shared.listing[0])
}
