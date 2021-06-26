//
//  MovieListModal.swift
//  MovieListDemo
//
//  Created by Yash Agarwal on 25/06/21.
//

import Foundation

class MovieListModal: Decodable {
	let items:[MovieModal]
}

class MovieModal: Decodable {
	let id:Int
	let original_title:String
	let poster_path:String?
	let release_date:String
	let overview:String
	let vote_average:Float
}
