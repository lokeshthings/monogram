//
//  CoreLocation.swift
//  Airbnb
//
//  Created by Lokesh on 15/09/25.
//
import CoreLocation

extension CLLocationCoordinate2D {
    // Named constants
    static var noidaCenter: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: 28.5355, longitude: 77.3910)
    }
    static var jaipurCenter: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: 26.9124, longitude: 75.7873)
    }
    static var dehradunCenter: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: 30.3165, longitude: 78.0322)
    }
    static var colvaCenter: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: 15.2790, longitude: 73.9225)
    }
    static var ghaziabadCenter: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: 28.6692, longitude: 77.4538)
    }
    static var bengaluruCenter: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: 12.9716, longitude: 77.5946)
    }
    static var greaterKailashCenter: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: 28.5366, longitude: 77.2380)
    }

    // Lookup helper — returns fallback if city isn't found
    static func from(city: String?, fallback: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 28.7041, longitude: 77.1025)) -> CLLocationCoordinate2D {
        guard let c = city?.trimmingCharacters(in: .whitespacesAndNewlines).lowercased(), !c.isEmpty else {
            return fallback
        }

        let map: [String: CLLocationCoordinate2D] = [
            "noida": .noidaCenter,
            "jaipur": .jaipurCenter,
            "dehradun": .dehradunCenter,
            "colva": .colvaCenter,
            "ghaziabad": .ghaziabadCenter,
            "bengaluru": .bengaluruCenter,
            "greater kailash": .greaterKailashCenter,
            "greaterkailash": .greaterKailashCenter,
            "greater_kailash": .greaterKailashCenter
        ]

        return map[c] ?? fallback
    }
}
