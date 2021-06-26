//
//  ConfigurationViewModal.swift
//  MovieListDemo
//
//  Created by Yash Agarwal on 24/06/21.
//

import Foundation

class ConfigurationViewModal: NSObject {
	var secureBaseUrl: String?
	
	init(url: String) {
		self.secureBaseUrl = url
	}
}
