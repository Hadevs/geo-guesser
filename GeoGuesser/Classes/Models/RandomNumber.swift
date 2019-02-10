//
//  RandomNumber.swift
//  GeoGuesser
//
//  Created by Hadevs on 10/02/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import Foundation

class RandomNumber {
	let value: Int
	init(min: Int = 0, max: Int = 15) {
		self.value = Int(arc4random_uniform(UInt32(max))) + min + 1
	}
}
