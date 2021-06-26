//
//  NSObject+Extension.swift
//  MovieListDemo
//
//  Created by Yash Agarwal on 24/06/21.
//

import Foundation

extension NSObject {
	
	//Will return object name in string
	static var typeName:String {
		return String(describing: self)
	}
}
