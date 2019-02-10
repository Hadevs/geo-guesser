//
//  GoogleMapService.swift
//  GeoGuesser
//
//  Created by Hadevs on 10/02/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import Foundation
import GoogleMaps

protocol GoogleMapService: class {
	func register(with apiKey: String)
}
