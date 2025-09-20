//
//  ListingDetailView.swift
//  Airbnb
//
//  Created by Lokesh on 10/09/25.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    @Environment(\.dismiss) var dismiss
    let listing :Listing
    @State private var cameraPosition : MapCameraPosition
    
    init(listing : Listing){
        self.listing = listing
       
        
        let region = MKCoordinateRegion(
            center: listing.city.lowercased() == "noida"
                ? .noidaCenter
                : CLLocationCoordinate2D(latitude: 28.7041, longitude: 77.1025), 
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
        
        self._cameraPosition = State(initialValue: .region(region))
    }
    var body: some View {
        ScrollView{
            ZStack (alignment: .topLeading){
                ListingCarouselView(listing: listing)
                    .frame(height: 320)
                Button{
                    dismiss()
                }label: {
                    Image(systemName : "chevron.left")
                        .foregroundStyle(.black)
                        .background{
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(.top, 50)   // push down from status bar
                           .padding(.leading, 28) 
                }
            }
                
            
            VStack(alignment: .leading, spacing: 8){
                Text(listing.title )
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading){
                    HStack(spacing: 2){
                        Image(systemName: "star.fill")
                        
                       
                        Text(String(format: "%.2f", listing.rating))
                            .fontWeight(.semibold)
                        Text("-")
                        Text("28 reviews")
                            .underline()
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                    }
                    Text("\(listing.city),\(listing.state)")
                    
                    
                }
                
                .font(.caption)
                
            }
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
            HStack{
                VStack(alignment: .leading){
                    Text("Entire \(listing.types.description) hosted by \(listing.ownerName)")
                        .font(.headline)
                        .frame(width: 170, alignment: .leading)
                    HStack(spacing: 2){
                        Text("\(listing.numberOfGuests) guest -")
                        Text("\(listing.numberOfBedrooms) bedrooms-")
                        Text("\(listing.numberOfBeds) beds -")
                        Text("\(listing.numberOfBathrooms) baths")
                    }
                    .font(.caption)
                }
                .frame(width: 300, alignment: .leading)
                Spacer()
                Image(listing.ownerImageUrl )
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(.circle  )
                
                
            }
            .padding()
            Divider()
            
            VStack(alignment: .leading, spacing: 16){
                ForEach(listing.feature ) { feature in
                    HStack{
                        Image(systemName: feature.imageName)
                        VStack(alignment: .leading){
                            Text(feature.title)
                                .foregroundColor(.black)
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text(feature.subtitle)
                                .foregroundColor(.gray)
                                .font(.footnote)
                        }
                        .frame(maxWidth : .infinity, alignment: .leading)
                    }
                    
                }
            }
            .padding()
            Divider()
            VStack(alignment: .leading, spacing: 16){
                Text("What this place offers")
                    .fontWeight(.semibold)
                    .font(.headline)
                    .padding(.leading)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 16){
                        ForEach(1 ... listing.numberOfBedrooms, id: \.self) {bedroom in
                            VStack(spacing: 8){
                                Image(systemName: "bed.double")
                                Text("Bedroom \(bedroom)")
                                    .fontWeight(.medium)
                                    .font(.callout)
                            }
                            .frame(width: 132, height: 100)
                            .overlay{
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(.gray)
                                    .padding(.leading)
                            }
                            
                            
                            
                            
                        }
                    }
                }
                .scrollTargetBehavior(.paging)
            }
            Divider()
            
            VStack(alignment: .leading,spacing: 16){
                Text("What this place offers")
                    .font(.headline)
                ForEach(listing.amenities){ amenity in
                    HStack{
                        Image(systemName: amenity.imageName)
                        
                        Text(amenity.title)
                            .font(.footnote)
                        Spacer()
                    }
                    
                }
               
            }
            .padding()
            
            Divider()
            VStack(alignment: .leading, spacing: 16){
                Text("Where you'll be")
                    .font(.headline)
                Map(position: $cameraPosition)
                    .frame(height : 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                
                
            }
            .padding()
         
        }
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea()
        .padding(.bottom, 64)
        .overlay(alignment: .bottom){
            VStack{
                Divider()
                HStack{
                    VStack(alignment:.leading, spacing: 2 ){
                        
                        Text("₹\(listing.pricePerNights)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Text("Total before Taxes")
                            .font(.footnote)
                        Text("oct15 - 20")
                            .fontWeight(.semibold)
                            .font(.footnote)
                            .underline()
                    }
                    .padding(.top, 8)
                    Spacer()
                    Button {
                        
                    }label: {
                        Text("Reserve")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .frame(width: 140, height: 40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding(.horizontal, 30)
            }
            .background(.white)
        }
        
    }
}

#Preview {
    ListingDetailView(listing: MockData.shared.listing[3])
}
