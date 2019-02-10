//
//  PanoramaViewController.swift
//  GeoGuesser
//
//  Created by Hadevs on 10/02/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import UIKit
import GoogleMaps

class PanoramaViewController: UIViewController {

	// MARK: Custom views
	let panoramaView: GMSPanoramaView = {
		let panoramaView = GMSPanoramaView()
		panoramaView.translatesAutoresizingMaskIntoConstraints = false
		return panoramaView
	}()
	
	let downButton: UIButton = {
		let button = UIButton()
		button.alpha = 0
		button.setImage(#imageLiteral(resourceName: "down_arrow.pdf"), for: .normal)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.imageView?.contentMode = .scaleAspectFit
		return button
	}()
	//
	
	private var controller: PanoramaController?
	private(set) var mapViewController: MapViewController?
	private var mapControllerHeightConstraint: NSLayoutConstraint?
	
	// MARK: Private configuration
	private let maximumMapViewHeight: CGFloat = 400
	private let minimumMapViewHeight: CGFloat = 200
	private let animateDuration: TimeInterval = 0.25
	//
	
	convenience init(controller: PanoramaController, mapViewController: MapViewController) {
		self.init()
		self.controller = controller
		self.mapViewController = mapViewController
		self.controller?.viewController = self
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		controller?.viewDidLoad()
		addPanoramaView()
		addMapViewController()
		addDownButton()
		addRightBarButton()
		setTabBarItem()
		navigationItem.title = "Угадайте локацию"
		navigationItem.largeTitleDisplayMode = .always
		navigationController?.navigationBar.prefersLargeTitles = true
	}
	
	private func setTabBarItem() {
		let item = UITabBarItem(title: "Игра", image: #imageLiteral(resourceName: "panoramic.png"), tag: 0)
		self.tabBarItem = item
	}
	
	private func addRightBarButton() {
		let rightBarButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshButtonClicked))
		navigationItem.rightBarButtonItem = rightBarButton
	}
	
	@objc private func refreshButtonClicked() {
		controller?.rightButtonClicked()
	}
	
	private func addDownButton() {
		view.addSubview(downButton)
		
		let sizeConstant = 55
		view.addConstraints(NSLayoutConstraint.contraints(withNewVisualFormat: "H:[downButton(\(sizeConstant))]-8-|,V:[downButton(\(sizeConstant))]-8-[mapView]", dict: ["downButton": downButton, "mapView": mapViewController!.view]))
	}
	
	private func addPanoramaView() {
		view.addSubview(panoramaView)
		let constraints = NSLayoutConstraint.contraints(withNewVisualFormat: "H:|[panoramaView]|,V:|[panoramaView]", dict: ["panoramaView": panoramaView])
		view.addConstraints(constraints)
	}
	
	func hideMapViewController() {
		UIView.animate(withDuration: animateDuration) {
			self.mapControllerHeightConstraint?.constant = self.minimumMapViewHeight
			self.downButton.alpha = 0
			self.view.layoutIfNeeded()
		}
	}
	
	func expandMapViewController() {
		UIView.animate(withDuration: animateDuration) {
			self.mapControllerHeightConstraint?.constant = self.maximumMapViewHeight
			self.downButton.alpha = 1
			self.view.layoutIfNeeded()
		}
	}
	
	private func addMapViewController() {
		guard let mapViewController = self.mapViewController else {
			return
		}
		
		guard let mapViewControllerView = mapViewController.view else {
			return
		}
		addChild(mapViewController)
		mapViewControllerView.translatesAutoresizingMaskIntoConstraints = false
		
		view.addSubview(mapViewControllerView)
		let constraints = NSLayoutConstraint.contraints(withNewVisualFormat: "H:|[mapView]|,V:[panoramaView][mapView]|", dict: ["panoramaView": panoramaView, "mapView": mapViewControllerView])
		mapControllerHeightConstraint = mapViewControllerView.heightAnchor.constraint(equalToConstant: minimumMapViewHeight)
		view.addConstraints(constraints)
		mapControllerHeightConstraint?.isActive = true
		mapViewController.didMove(toParent: self)
	}
}
