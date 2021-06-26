//
//  UIColor+Extension.swift
//  MovieListDemo
//
//  Created by Yash Agarwal on 25/06/21.
//

import Foundation
import UIKit

extension UIColor {
	
	/**
	Generate the random color
	
	- Returns: UIColor
	*/
	static func generateRandomColor() -> UIColor {
		let red = CGFloat(drand48())
		let green = CGFloat(drand48())
		let blue = CGFloat(drand48())
		return UIColor(red: red, green: green, blue: blue, alpha: 0.5)
	}
}
