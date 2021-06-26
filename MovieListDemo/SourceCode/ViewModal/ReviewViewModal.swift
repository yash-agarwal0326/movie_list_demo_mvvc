//
//  ReviewViewModal.swift
//  MovieListDemo
//
//  Created by Yash Agarwal on 25/06/21.
//

import Foundation

class ReviewViewModal: NSObject {
	
	let author:String
	let content:String
	
	init(review: ReviewModal) {
		self.author = review.author
		self.content = review.content
	}
}
