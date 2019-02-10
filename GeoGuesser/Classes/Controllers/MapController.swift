//
//  MapController.swift
//  GeoGuesser
//
//  Created by Hadevs on 10/02/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import UIKit
import GoogleMaps

class MapController: NSObject, Lifecycable {
	weak var mapViewController: MapViewController?
	private var locationDragged: Bool = false
	private var mapView: GMSMapView? {
		return mapViewController?.mapView
	}
	
	var mapViewMovingEnded: (() -> Void)?
	var mapViewMovingStarted: (() -> Void)?
	var mapViewCoordinateTapped: ((CLLocationCoordinate2D) -> Void)?
	
	func viewDidLoad() {
		mapView?.delegate = self
	}
	
	func addMarket(on coordinate: CLLocationCoordinate2D) {
		let marker = GMSMarker()
		marker.title = "Ваш выбор"
		marker.position = coordinate
		marker.map = mapView
	}
	
	func clearMapView() {
		mapView?.clear()
	}
	
	func drawPath(firstCoordinate: CLLocationCoordinate2D, secondCoordinate: CLLocationCoordinate2D) {
		let path = GMSMutablePath()
		path.add(firstCoordinate)
		path.add(secondCoordinate)
		let rectangle = GMSPolyline(path: path)
		rectangle.map = mapView
	}
}


extension MapController: GMSMapViewDelegate {
	func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
		locationDragged = true
		mapViewMovingStarted?()
	}
	
	func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
		mapViewCoordinateTapped?(coordinate)
	}
	
	func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
		if locationDragged {
			locationDragged = false
			mapViewMovingEnded?()
		}
	}
}
