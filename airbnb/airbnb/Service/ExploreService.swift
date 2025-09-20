//
//  ExploreService.swift
//  Airbnb
//
//  Created by Lokesh on 15/09/25.
//

import Foundation

class ExploreService {
    func fetchListing()async throws -> [Listing]{
        return MockData.shared.listing
    }
}
