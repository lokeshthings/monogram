//
//  DestinationSearchView.swift
//  Airbnb
//
//  Created by Lokesh on 12/09/25.
//

import SwiftUI

struct DestinationSearchView: View {
    enum destinationSearchOption {
        case location
        case dates
        case guests
    }
    @Binding var show : Bool
    @State private var destination = ""
    @State private var selectedOption :destinationSearchOption = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var guestCount = 0
    
    var body: some View {
        VStack{
            HStack{
                Button{
                    withAnimation(.snappy){
                        show.toggle()
                    }
                    
                }label: {
                    Image(systemName: "xmark.circle")
                        .foregroundColor(.black )
                        .imageScale(.large)
                }
                Spacer()
                if !destination.isEmpty {
                    Button("Clear"){
                        destination = ""
                    }.foregroundStyle(.black)
                        .fontWeight(.semibold)
                        .font(.subheadline)
                }
                
            }
            .padding()
        }
      
        
      
        VStack(alignment: .leading){
            if selectedOption == .location{
                Text("Where to?")
                    .font(.title2)
                    .fontWeight(.semibold)
                HStack{
                    Image(systemName: "magnifyingglass")
                        .imageScale(.small)
                    TextField("search destination",text: $destination)
                        .textFieldStyle(.automatic)
                        .font(.subheadline)
                }
                .frame(height: 44)
                .padding(.horizontal)
                .overlay{
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(lineWidth : 1)
                        .foregroundStyle(Color(.systemGray4))
                }
            }
            else{
                CollapsedPickerView(title: "where", description: "Add destination")
                
            }
            
        }
        .onTapGesture {
            withAnimation(.snappy){ selectedOption = .location}
        }
        .modifier(DestinationViewModifier())
        .frame(height: selectedOption == .location ? 120 : 64)
        VStack(alignment : .leading){
            if selectedOption == .dates{
                Text("When's your trip?")
                    .font(.title2)
                    .fontWeight(.semibold)
                VStack{
                    DatePicker("From",
                               selection: $startDate,
                               displayedComponents: .date)
                    
                    Divider()
                    DatePicker("To",
                               selection: $endDate,
                               displayedComponents: .date)
                    
                }
                .foregroundStyle(.gray)
                .fontWeight(.semibold)
                .font(.subheadline)
                
                
                
                
                
            }
            else{
                CollapsedPickerView(title: "When", description: "Add dates")
            }
        }
        .modifier(DestinationViewModifier())
        .frame(height: selectedOption == .dates ? 180 : 64)
        .onTapGesture {
            withAnimation(.snappy) {selectedOption = .dates}
        }
        
        VStack(alignment : .leading){
            if selectedOption == .guests{
                Text("Number of  guests")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Stepper{
                    Text ("\(guestCount)  Adults")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }onIncrement: {
                    guestCount += 1
                }onDecrement: {
                    guard guestCount > 0 else{return}
                    guestCount -= 1
                }
                
                
                
            }
            else{
                CollapsedPickerVieww(title: "Who", description: "Add guests")
            }
        }
        .modifier(DestinationViewModifier())
        .frame(height: selectedOption == .guests ? 120 : 64)

        .onTapGesture {
            withAnimation(.snappy){selectedOption = .guests}
        }
        Spacer()
    }
}


#Preview {
    DestinationSearchView(show: .constant(false))
}

struct DestinationViewModifier : ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
    }
}

struct CollapsedPickerView: View {
    var title : String
    var description : String
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .foregroundStyle(.gray)
                Spacer()
                Text(description)
                
            }
            .font(.subheadline)
            .fontWeight(.semibold)
        }
    }
}

struct CollapsedPickerVieww : View {
    var title : String
    var description : String
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .foregroundStyle(.gray)
                Spacer()
                Text(description)
                
            }
            .font(.subheadline)
            .fontWeight(.semibold)
        }
    }
}
