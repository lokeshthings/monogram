//
//  ExploreViewViewModel.swift
//  Airbnb
//
//  Created by Lokesh on 15/09/25.
//

import Foundation

class ExploreViewViewModel : ObservableObject{
    @Published var listing = [Listing]()
    private let service : ExploreService
    
    init(service: ExploreService){
        self.service = service
        Task { await fetchlisting()  }
    }
    
    func fetchlisting() async{
        do{
            self.listing = try await service.fetchListing()
        }catch {
            print("Debug : Failed to fetch listing with error :\(error.localizedDescription)")
        }
    }
}
