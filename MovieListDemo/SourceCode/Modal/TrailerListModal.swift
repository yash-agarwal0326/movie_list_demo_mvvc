//
//  TrailerListModal.swift
//  MovieListDemo
//
//  Created by Yash Agarwal on 25/06/21.
//

import Foundation

class TrailerListModal: Decodable {
	let results:[TrailerModal]
}

class TrailerModal: Decodable {
	let key:String
}
