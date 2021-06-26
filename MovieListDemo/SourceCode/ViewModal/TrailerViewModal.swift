//
//  TrailerViewModal.swift
//  MovieListDemo
//
//  Created by Yash Agarwal on 25/06/21.
//

import Foundation

class TrailerViewModal: NSObject {
	var key:String
	
	init(trailer: TrailerModal) {
		self.key = trailer.key
	}
}
