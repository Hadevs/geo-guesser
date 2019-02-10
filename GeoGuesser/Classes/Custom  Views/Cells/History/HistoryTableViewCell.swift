//
//  HistoryTableViewCell.swift
//  GeoGuesser
//
//  Created by Hadevs on 10/02/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import UIKit
import GoogleMaps

class HistoryTableViewCell: UITableViewCell, NibLoadable {
	@IBOutlet weak var resultImageView: UIImageView!
	@IBOutlet weak var distanceLabel: UILabel!
	@IBOutlet weak var mapView: GMSMapView!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
		resultImageView.contentMode = .scaleAspectFit
		mapView.isUserInteractionEnabled = false
		selectionStyle = .none
	}
	
	func configure(by attempt: Attemp) {
		distanceLabel.text = "Дистанция \(attempt.distance) метров"
		if attempt.distance < 1000 {
			resultImageView.image =	#imageLiteral(resourceName: "right.pdf")
		} else {
			resultImageView.image = #imageLiteral(resourceName: "wrong.pdf")
		}
		mapView.animate(toLocation: attempt.pickedCoordinates)
		mapView.animate(toZoom: 16)
		let marker = GMSMarker()
		marker.position = attempt.pickedCoordinates
		marker.map = mapView
	}
}
