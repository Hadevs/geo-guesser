//
//  AppDelegate.swift
//  GeoGuesser
//
//  Created by Hadevs on 10/02/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	private let googleService: GoogleMapService = GoogleMapsImplementation()
	private let apiKey: String = "AIzaSyD_HUegxAl7wfn5nQtHtDDh0gut-1nBtDM"
	private let rootRouter = RootRouter()
	private let realmInteractor = RealmInteractor()
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		googleService.register(with: apiKey)
		let mapController = MapController()
		let mapViewController = MapViewController(mapController: mapController)
		
		let panoramaController = PanoramaController(googleService: googleService, realmInteractor: realmInteractor)
		let panoramaViewController: PanoramaViewController = PanoramaViewController(controller: panoramaController, mapViewController: mapViewController)
		
		let historyController = HistoryController(realmInteractor: realmInteractor)
		let historyViewController = HistoryViewController(controller: historyController)
		historyViewController.setTabBarItem()
		let ncHistoryViewController = UINavigationController.init(rootViewController: historyViewController)
		
		let ncPanoramaViewController = UINavigationController.init(rootViewController: panoramaViewController)
		let tabBarController = UITabBarController()
		tabBarController.setViewControllers([ncPanoramaViewController, ncHistoryViewController], animated: false)
		
		rootRouter.root(&window, rootViewController: tabBarController)
		
		return true
	}

	func applicationWillResignActive(_ application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
	}

	func applicationDidEnterBackground(_ application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}

	func applicationWillEnterForeground(_ application: UIApplication) {
		// Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}

	func applicationWillTerminate(_ application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	}


}

