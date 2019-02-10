//
//  RootRouter.swift
//  GeoGuesser
//
//  Created by Hadevs on 10/02/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import UIKit

final class RootRouter {
	func root(_ window: inout UIWindow?, rootViewController: UIViewController) {
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.makeKeyAndVisible()
		window?.rootViewController = rootViewController
	}
}
