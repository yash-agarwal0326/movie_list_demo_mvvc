//
//  ConfigurationModal.swift
//  MovieListDemo
//
//  Created by Yash Agarwal on 24/06/21.
//

import Foundation

class ConfigurationModal: Decodable {
	let images:ConfigurationImageModal
}

class ConfigurationImageModal: Decodable {
	let secure_base_url:String
}
