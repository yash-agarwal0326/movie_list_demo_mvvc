//
//  ReviewListModal.swift
//  MovieListDemo
//
//  Created by Yash Agarwal on 25/06/21.
//

import Foundation

class ReviewListModal: Decodable {
	let page:Int
	let total_pages:Int
	let total_results:Int
	let results:[ReviewModal]
}

class ReviewModal: Decodable {
	let author:String
	let content:String
}
