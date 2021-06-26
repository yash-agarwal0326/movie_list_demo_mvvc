//
//  GenreViewModal.swift
//  MovieListDemo
//
//  Created by Yash Agarwal on 24/06/21.
//

import Foundation

class GenreViewModal: NSObject {
	
	var id:Int?
	var name:String?
	
	init(genre: GenreModal) {
		self.id = genre.id
		self.name = genre.name
	}
}
