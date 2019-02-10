//
//  HistoryViewController.swift
//  GeoGuesser
//
//  Created by Hadevs on 10/02/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
	private var controller: HistoryController?
	@IBOutlet weak var tableView: UITableView!
	
	convenience init(controller: HistoryController) {
		self.init()
		self.controller = controller
		self.controller?.viewController = self
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		if #available(iOS 11.0, *) {
			navigationItem.largeTitleDisplayMode = .always
			navigationController?.navigationBar.prefersLargeTitles = true
		}
		
		navigationItem.title = "История попыток"
		setTabBarItem()
		
		tableView.delegate = self
		tableView.separatorColor = .clear
		tableView.dataSource = self
		tableView.register(HistoryTableViewCell.nib, forCellReuseIdentifier: HistoryTableViewCell.name)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		controller?.viewWillAppear()
	}
	
	func setTabBarItem() {
		let tabBarItem = UITabBarItem(title: "История", image: UIImage.init(named: "history"), tag: 1)
		self.tabBarItem = tabBarItem
	}
}

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.name, for: indexPath) as! HistoryTableViewCell
		let attemp = (controller?.attemps ?? [])[indexPath.row]
		cell.configure(by: attemp)
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 153
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return controller?.attemps.count ?? 0
	}
}
