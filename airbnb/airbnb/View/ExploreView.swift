//
//  ExploreView.swift
//  Airbnb
//
//  Created by Lokesh on 09/09/25.
//

import SwiftUI

struct ExploreView: View {
    @State private var showdestinationSearchView = false
    @StateObject var viewModel = ExploreViewViewModel(service: ExploreService())
    let columns = [
        GridItem(.flexible())
    ]
    var body: some View {
        
        NavigationStack{
            if showdestinationSearchView {
                DestinationSearchView(show: $showdestinationSearchView)
            }
            else{
                ScrollView{
                    SearchAndFilterView()
                        .padding()
                        .onTapGesture {
                            withAnimation(.snappy){
                                showdestinationSearchView.toggle()
                            }
                        }
                    
                    LazyVStack(spacing: 32){
                        ForEach(viewModel.listing) { listing in
                            NavigationLink(value: listing){
                                ListingItemView(listing: listing)
                                    .frame(height: 400)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                        
                    }
                   
                }
                .navigationDestination(for: Listing.self){ listing in
                    ListingDetailView(listing: listing)
                        .toolbar(.hidden, for: .navigationBar)
                }
            }
        
        }
    }
}

#Preview {
    ExploreView()
}
