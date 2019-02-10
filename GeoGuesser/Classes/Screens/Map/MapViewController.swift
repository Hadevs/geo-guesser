//
//  MapViewController.swift
//  GeoGuesser
//
//  Created by Hadevs on 10/02/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {
	@IBOutlet weak var mapView: GMSMapView!
	
	private(set) var mapController: MapController?
	
	convenience init(mapController: MapController) {
		self.init()
		self.mapController = mapController
		self.mapController?.mapViewController = self
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		mapController?.viewDidLoad()
	}
}
