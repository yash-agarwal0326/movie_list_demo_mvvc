//
//  MovieViewModal.swift
//  MovieListDemo
//
//  Created by Yash Agarwal on 25/06/21.
//

import Foundation

class MovieViewModal: NSObject {
	
	var id:Int?
	var title:String?
	var imageId:String?
	var releaseDate:String?
	var overview:String?
	var rating:Float?
	var imageUrl:String?
	
	init(movie: MovieModal) {
		self.id = movie.id
		self.title = movie.original_title
		self.imageId = movie.poster_path
		self.overview = movie.overview
		self.rating = movie.vote_average
		self.releaseDate = movie.release_date
	}
}
