//
//  GenreModal.swift
//  MovieListDemo
//
//  Created by Yash Agarwal on 24/06/21.
//

import Foundation

class GenreListModal: Decodable {
	let genres:[GenreModal]
}

class GenreModal: Decodable {
	let id:Int
	let name:String
}


