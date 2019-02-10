//
//  HistoryController.swift
//  GeoGuesser
//
//  Created by Hadevs on 10/02/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import UIKit

final class HistoryController: NSObject, Lifecycable {
	private weak var realmInteractor: RealmInteractor?
	
	weak var viewController: HistoryViewController?
	
	var tableView: UITableView? {
		return viewController?.tableView
	}
	
	init(realmInteractor: RealmInteractor) {
		self.realmInteractor = realmInteractor
	}
	
	private(set) var attemps: [Attemp] = []
	
	func viewWillAppear() {
		reloadAttemps()
	}
	
	private func reloadAttemps() {
		attemps = realmInteractor?.fetchItems(ofType: Attemp.self) ?? []
		tableView?.reloadData()
	}
}
