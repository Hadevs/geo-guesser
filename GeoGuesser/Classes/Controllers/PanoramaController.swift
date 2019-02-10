//
//  PanoramaController.swift
//  GeoGuesser
//
//  Created by Hadevs on 10/02/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import Foundation
import GoogleMaps

class PanoramaController: NSObject, Lifecycable {
	private weak var googleService: GoogleMapService?
	weak var viewController: PanoramaViewController?
	
	var panoramaView: GMSPanoramaView? {
		return viewController?.panoramaView
	}
	
	private let session: PlaySession = PlaySession()
	
	init(googleService: GoogleMapService) {
		self.googleService = googleService
	}
	
	func viewDidLoad() {
		observeMapControllerClosures()
		addTargets()
		restartSession()
	}
	
	private func restartSession() {
		let mapController = viewController?.mapViewController?.mapController
		mapController?.clearMapView()
		let coordinates = RandomCoordinates().value
		print("Generated coordinates: \(coordinates)")
		panoramaView?.moveNearCoordinate(coordinates, radius: 1000)
		session.start(coordinates: coordinates)
	}
	
	private func addTargets() {
		viewController?.downButton.addTarget(self, action: #selector(downButtonClicked), for: .touchUpInside)
	}
	
	func rightButtonClicked() {
		restartSession()
	}
	
	@objc private func downButtonClicked() {
		viewController?.hideMapViewController()
	}
	
	private func observeMapControllerClosures() {
		let mapController = viewController?.mapViewController?.mapController
		
		mapController?.mapViewMovingStarted = {
			self.viewController?.expandMapViewController()
		}
		
		mapController?.mapViewCoordinateTapped = {
			coordinates in
			if let rightCoordinates = self.session.coordinates, self.session.isSessionActive {
				mapController?.drawPath(firstCoordinate: coordinates, secondCoordinate: rightCoordinates)
				mapController?.addMarket(on: coordinates)
				self.session.end()
				DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: {
					let result = self.session.pick(point: coordinates)
					switch result {
					case .fail(let meters):
						self.viewController?.showAlert(with: "Вы ошиблись :(", and: "Расстояние равно: \(meters) метров.")
					case .success(let meters):
						self.viewController?.showAlert(with: "Вы угадали!", and: "Расстояние равно: \(meters) метров.")
					case .error:
						self.viewController?.showAlert(with: "Упс...", and: "Неизвестная ошибка...")
					}
					self.restartSession()
				})
			}
		}
	}
}
