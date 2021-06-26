//
//  UIView+Extension.swift
//  MovieListDemo
//
//  Created by Yash Agarwal on 24/06/21.
//

import Foundation
import UIKit

extension UIView {
	
	/**
	Drop shadow on the view
	
	- Parameter shadowRadius: Shadow radius
	*/
	func dropShodow(with shadowRadius:CGFloat = 10.0) {
		self.layer.shadowColor = UIColor.darkGray.cgColor
		self.layer.shadowRadius = shadowRadius
		self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
		self.layer.shadowOpacity = 1.0
		self.layer.masksToBounds = true
	}
	
	/**
	Add border to the view
	
	- Parameter color: Border color
	- Parameter borderWidth: Border width
	*/
	func addBorder(withColor color:UIColor, andWidth borderWidth:CGFloat){
		self.layer.borderColor = color.cgColor
		self.layer.borderWidth = borderWidth
	}
}
