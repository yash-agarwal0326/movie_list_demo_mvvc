//
//  Utility.swift
//  MovieListDemo
//
//  Created by Yash Agarwal on 25/06/21.
//

import Foundation

class Utility: NSObject {
	
	/**
	Save server URL in user defaults
	
	- Parameter url: String
	*/
	static func saveImageServerUrl(_  url:String) {
		let defaults:UserDefaults = UserDefaults.standard
		defaults.set(url, forKey: Constant.Key.secureBaseUrl)
		defaults.synchronize()
	}
	
	/**
	Get image server URL
	
	- Returns: URL string
	*/
	static func getImageServerUrl() -> String {
		let defaults:UserDefaults = UserDefaults.standard
		return defaults.object(forKey: Constant.Key.secureBaseUrl) as! String
	}
}
