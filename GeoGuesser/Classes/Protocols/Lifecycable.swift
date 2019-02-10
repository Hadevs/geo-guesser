//
//  Lifecycable.swift
//  GeoGuesser
//
//  Created by Hadevs on 10/02/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import Foundation

@objc protocol Lifecycable {
	@objc optional func viewDidLoad()
	@objc optional func viewWillAppear()
}
