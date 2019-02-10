//
//  NibLoadable.swift
//  GeoGuesser
//
//  Created by Hadevs on 10/02/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import UIKit

protocol NibLoadable: class {
	static var nib: UINib { get }
}

extension NibLoadable {
	static var nib: UINib {
		return UINib(nibName: name, bundle: Bundle.init(for: self))
	}
	
	static var name: String {
		return String(describing: self)
	}
}

extension NibLoadable where Self: UIView {
	static func loadFromNib() -> Self {
		guard let view = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
			fatalError()
		}
		
		return view
	}
}
