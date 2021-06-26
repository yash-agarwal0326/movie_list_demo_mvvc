//
//  RequestManager.swift
//  MovieListDemo
//
//  Created by Yash Agarwal on 24/06/21.
//

import Foundation

class RequestManager: NSObject {
	
	//Intance
	static let sharedInstance = RequestManager()
	
	/**
	Get configuration
	
	- Parameter configurationApiUrl: Configuration Api URL
	- Parameter completion: Completion block containing ConfigurationViewModal and error
	*/
	func getConfiguration(with configurationApiUrl: String, completion: @escaping(ConfigurationViewModal?, Error?) -> Void) {
		guard let url = URL(string: configurationApiUrl) else {return}
		
		URLSession.shared.dataTask(with: url) { (data, response, error) in
			
			if let apiError = error {
				completion(nil, apiError)
				print("Loading data error", apiError.localizedDescription)
				
			} else {
				guard let data = data else {return}
				do {
					let results = try JSONDecoder().decode(ConfigurationModal.self, from: data)
					let configurationVM = ConfigurationViewModal(url: results.images.secure_base_url)
					completion(configurationVM,nil)
				} catch let err {
					print("JSON error", err.localizedDescription)
				}
			}
		}.resume()
	}
	
	/**
	Get genre list
	
	- Parameter genreApiUrl: Genre Api URL
	- Parameter completion: Completion block containing GenreViewModal array and error
	*/
	func getGenreList(with genreApiUrl: String, completion: @escaping([GenreViewModal]?, Error?) -> Void) {
		guard let url = URL(string: genreApiUrl) else {return}
		
		URLSession.shared.dataTask(with: url) { (data, response, error) in
			
			if let apiError = error {
				completion(nil, apiError)
				print("Loading dara error", apiError.localizedDescription)
				
			} else {
				guard let data = data else {return}
				do {
					let results = try JSONDecoder().decode(GenreListModal.self, from: data)
					let genreArray = results.genres.map({return GenreViewModal(genre: $0)})
					completion(genreArray,nil)
				} catch let err {
					print("JSON error", err.localizedDescription)
				}
			}
		}.resume()
	}
	
	/**
	Get movie list
	
	- Parameter movieListApiUrl: Movie list URL
	- Parameter completion: Completion block containing MovieViewModal array and error
	*/
	func getMovieList(with movieListApiUrl: String, completion: @escaping([MovieViewModal]?, Error?) -> Void) {
		guard let url = URL(string: movieListApiUrl) else {return}
		
		URLSession.shared.dataTask(with: url) { (data, response, error) in
			
			if let apiError = error {
				completion(nil, apiError)
				print("Loading dara error", apiError.localizedDescription)
				
			} else {
				guard let data = data else {return}
				do {
					let results = try JSONDecoder().decode(MovieListModal.self, from: data)
					let movieArray = results.items.map({return MovieViewModal(movie: $0)})
					completion(movieArray,nil)
				} catch let err {
					print("JSON error", err.localizedDescription)
				}
			}
		}.resume()
	}
	
	/**
	Get movie trailer
	
	- Parameter trailerApiUrl: Trailer api url
	- Parameter completion: Completion block containing TrailerViewModal array and error
	*/
	func getMovieTrailer(with trailerApiUrl: String, completion: @escaping([TrailerViewModal]?, Error?) -> Void) {
		guard let url = URL(string: trailerApiUrl) else {return}
		
		URLSession.shared.dataTask(with: url) { (data, response, error) in
			
			if let apiError = error {
				completion(nil, apiError)
				print("Loading dara error", apiError.localizedDescription)
				
			} else {
				guard let data = data else {return}
				do {
					let results = try JSONDecoder().decode(TrailerListModal.self, from: data)
					let trailerArray = results.results.map({return TrailerViewModal(trailer: $0)})
					completion(trailerArray,nil)
				} catch let err {
					print("JSON error", err.localizedDescription)
				}
			}
		}.resume()
	}
	
	/**
	Get review for the movie
	- Parameter reviewApiUrl: Review Api url
	- Parameter completion: Completion block containing ReviewViewModal array, currentPage, totalPages, totalResults and error
	*/
	func getMoviewReview(with reviewApiUrl: String, completion: @escaping(_ reviewModals: [ReviewViewModal]?,_ currentPage: Int?,_ totalPage: Int?,_ totalResults: Int?,_ error: Error?) -> Void) {
		guard let url = URL(string: reviewApiUrl) else {return}
		
		URLSession.shared.dataTask(with: url) { (data, response, error) in
			
			if let apiError = error {
				completion(nil, nil, nil, nil, apiError)
				print("Loading dara error", apiError.localizedDescription)
				
			} else {
				guard let data = data else {return}
				do {
					let results = try JSONDecoder().decode(ReviewListModal.self, from: data)
					let reviewArray = results.results.map({return ReviewViewModal(review: $0)})
					completion(reviewArray, results.page, results.total_pages, results.total_results, nil)
				} catch let err {
					print("JSON error", err.localizedDescription)
				}
			}
		}.resume()
	}
}
