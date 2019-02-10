//
//  Attemp.swift
//  GeoGuesser
//
//  Created by Hadevs on 10/02/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import Foundation
import RealmSwift
import CoreLocation

class Attemp: Object {
	@objc dynamic var distance: Double = 0
	@objc dynamic var pickedCoordinatesLng: Double = 0
	@objc dynamic var pickedCoordinatesLat: Double = 0
	
	@objc dynamic var rightCoordinatesLng: Double = 0
	@objc dynamic var rightCoordinatesLat: Double = 0
	
	convenience init(distance: Double, pickedCoordinates: CLLocationCoordinate2D, rightCoordinates: CLLocationCoordinate2D) {
		self.init()
		self.pickedCoordinatesLng = pickedCoordinates.longitude
		self.pickedCoordinatesLat = pickedCoordinates.latitude
		self.rightCoordinatesLng = rightCoordinates.longitude
		self.rightCoordinatesLat = rightCoordinates.latitude
		self.distance = distance
	}
	
	var pickedCoordinates: CLLocationCoordinate2D {
		return CLLocationCoordinate2D(latitude: pickedCoordinatesLat, longitude: pickedCoordinatesLng)
	}
	
	var rightCoordinates: CLLocationCoordinate2D {
		return CLLocationCoordinate2D(latitude: rightCoordinatesLat, longitude: rightCoordinatesLng)
	}
}
