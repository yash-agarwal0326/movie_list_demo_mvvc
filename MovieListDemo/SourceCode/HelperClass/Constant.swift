//
//  Constant.swift
//  MovieListDemo
//
//  Created by Yash Agarwal on 24/06/21.
//

import Foundation
import UIKit

struct Storyboard {
	static let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
}

struct Constant {
	
	static let tmdb_api_key = "c35fbdd25b92bf4724b49cf883e2ac1e"
	
	struct URL {
		static let base = "https://api.themoviedb.org/3/"
		
		//https://api.themoviedb.org/3/genre/movie/list?api_key=c35fbdd25b92bf4724b49cf883e2ac1e&language=en-US
		static let genreUrl = URL.base + Key.genre + "/" + Key.movie + "/" + Key.list + "?" + Key.apiKey + "=" + Constant.tmdb_api_key
		
		//https://api.themoviedb.org/3/configuration?api_key=c35fbdd25b92bf4724b49cf883e2ac1e
		static let configurationUrl = URL.base + Key.configuration + "?" + Key.apiKey + "=" + Constant.tmdb_api_key
		
		/**
		Get movie list url
		- Parameter genreId: Genre id
		- Returns: url in string
		*/
		static func movieListUrl(for genreId:Int) -> String {
			//https://api.themoviedb.org/3/list/53?api_key=c35fbdd25b92bf4724b49cf883e2ac1e&language=en-US
			return URL.base + Key.list + "/" + String(describing: genreId) + "?" + Key.apiKey + "=" + Constant.tmdb_api_key + "&" + Key.language + "=" + Key.engLanguage
		}
		
		/**
		Get image url
		- Parameter id: Image ID
		- Returns: Image url in string
		*/
		static func imageUrl(withId id:String) -> String {
			//https://image.tmdb.org/t/p/original/wwemzKWzjKYJFfCeiB57q3r4Bcm.svg
			return Utility.getImageServerUrl() + Key.original + "/" + id
		}
		
		/**
		Get trailer url
		- Parameter id: Movie ID
		- Results: Trailer url in string
		*/
		static func trailerUrl(withId id:String) -> String {
			//https://api.themoviedb.org/3/movie/12155/videos?api_key=c35fbdd25b92bf4724b49cf883e2ac1e&language=en-US
			return URL.base + Key.movie + "/" + id + "/" + Key.videos + "?" + Key.apiKey + "=" + Constant.tmdb_api_key + "&" + Key.language + "=" + Key.engLanguage
		}
		
		/**
		Get movie review url
		- Parameter id: Movie ID
		- Parameter number: Page number
		- Results: Review url in string
		*/
		static func reviewUrl(withId id:String, forPage number:String = "1") -> String {
			//https://api.themoviedb.org/3/movie/34544/reviews?api_key=c35fbdd25b92bf4724b49cf883e2ac1e&language=en-US&page=1
			return URL.base + Key.movie + "/" + id + "/" + Key.reviews + "?" + Key.apiKey + "=" + Constant.tmdb_api_key + "&" + Key.language + "=" + Key.engLanguage + "&" + Key.page + "=" + number
		}
	}
	
	struct Key {
		static let configuration = "configuration"
		static let apiKey = "api_key"
		static let language = "language"
		static let original = "original"
		static let engLanguage = "en-US"
		static let genre = "genre"
		static let movie = "movie"
		static let list = "list"
		static let secureBaseUrl = "secure_base_url"
		static let videos = "videos"
		static let reviews = "reviews"
		static let page = "page"
	}
	
	struct Name {
		static let genre = "Genre"
		static let movies = "Movies"
	}
}
