//
//  CoordinatesDistance.swift
//  GeoGuesser
//
//  Created by Hadevs on 10/02/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import UIKit
import CoreLocation

class CoordinatesDistance {
	let value: Double
	
	init(firstCoordinate: CLLocationCoordinate2D, secondCoordinate: CLLocationCoordinate2D) {
		self.value = CLLocation(latitude: firstCoordinate.latitude, longitude: firstCoordinate.longitude).distance(from: CLLocation.init(latitude: secondCoordinate.latitude, longitude: secondCoordinate.longitude))
	}
}
