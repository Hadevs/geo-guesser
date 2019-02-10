//
//  GoogleMapServiceImplementation.swift
//  GeoGuesser
//
//  Created by Hadevs on 10/02/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import Foundation
import GoogleMaps
import GooglePlaces

class GoogleMapsImplementation: GoogleMapService {
	func register(with apiKey: String) {
		GMSServices.provideAPIKey(apiKey)
		GMSPlacesClient.provideAPIKey(apiKey)
	}
}
