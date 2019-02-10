//
//  RandomCoordinates.swift
//  GeoGuesser
//
//  Created by Hadevs on 10/02/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import Foundation
import CoreLocation

class RandomCoordinates {
	let value: CLLocationCoordinate2D
	
	private let arrayOfCoordinates: [CLLocationCoordinate2D] = [
		CLLocationCoordinate2D(latitude: 47.794221, longitude: 67.702718),
		CLLocationCoordinate2D(latitude: 39.566577, longitude: 66.760726),
		CLLocationCoordinate2D(latitude: 50.447362, longitude: 30.522198),
		CLLocationCoordinate2D(latitude: 51.952970, longitude: 7.625795),
		CLLocationCoordinate2D(latitude: 51.519099, longitude: -0.122009),
		CLLocationCoordinate2D(latitude: 43.668027, longitude: -79.400036),
		CLLocationCoordinate2D(latitude: 40.741958, longitude: -73.986801),
		CLLocationCoordinate2D(latitude: -6.448730, longitude: -49.405959),
		CLLocationCoordinate2D(latitude: 31.772360, longitude: 35.213621),
		CLLocationCoordinate2D(latitude: 55.763693, longitude: 37.656426)
	]
	
	init() {
		self.value = arrayOfCoordinates.randomElement()!
	}
}
