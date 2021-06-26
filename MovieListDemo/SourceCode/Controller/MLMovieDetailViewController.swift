//
//  MLMovieDetailViewController.swift
//  MovieListDemo
//
//  Created by Yash Agarwal on 25/06/21.
//

import UIKit
import YoutubePlayer_in_WKWebView

class MLMovieDetailViewController: UIViewController {
	
	// MARK: - Outlets
	
	@IBOutlet var containerView: UIView!
	@IBOutlet weak var displayImageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var youtubePlayerView: WKYTPlayerView!
	@IBOutlet weak var overviewLabel: UILabel!
	@IBOutlet weak var ratingLabel: UILabel!
	
	// MARK: - Actions
	
	@IBAction func backButton(_ sender: UIButton) {
		self.navigationController?.popViewController(animated: true)
	}
	
	@IBAction func reviewButton(_ sender: UIButton) {
		presentReviewScreen()
	}
	
	// MARK: - Instance Properties
	
	var movieColor:UIColor?
	var movieDetial:MovieViewModal?
	
	// MARK: - Override Methods
	
	override func viewDidLoad() {
		super.viewDidLoad()
		customUIForMovieDetailScreen()
		setData()
	}
}

// MARK: - Fileprivate Methods

extension MLMovieDetailViewController {
	
	///Custom UI for movie detail screen
	fileprivate func customUIForMovieDetailScreen() {
		containerView.backgroundColor = movieColor
		containerView.dropShodow(with: 0.0)
		
		displayImageView.addBorder(withColor: .white, andWidth: 1.0)
		youtubePlayerView.addBorder(withColor: .white, andWidth: 2.0)
	}
	
	///Set data for the movie
	fileprivate func setData() {
		guard let movie = movieDetial else {return}
		
		titleLabel.text = movie.title
		overviewLabel.text = movie.overview
		ratingLabel.text = String(describing: movie.rating ?? 0.0)
		displayImageView.downloaded(from: Constant.URL.imageUrl(withId: movie.imageId ?? "wwemzKWzjKYJFfCeiB57q3r4Bcm.svg"))
		//Setting default video
		youtubePlayerView.load(withVideoId: "8YjFbMbfXaQ")
		
		guard let id = movie.id else {return}
		getMovieTrailer(forMovie: id)
	}
	
	///Present review screen
	fileprivate func presentReviewScreen() {
		let reviewController = MLReviewViewController.instantiateFromStoryboard()
		reviewController.modalPresentationStyle = .popover
		reviewController.modalTransitionStyle = .coverVertical
		reviewController.movieModal = movieDetial
		reviewController.movieColor = movieColor
		present(reviewController, animated: true, completion: nil)
	}
}

// MARK: - API Methods

extension MLMovieDetailViewController {
	
	/**
	Get movie trailer
	
	- Parameter id: Movie id
	*/
	fileprivate func getMovieTrailer(forMovie id:Int) {
		RequestManager.sharedInstance.getMovieTrailer(with: Constant.URL.trailerUrl(withId: String(describing: id))) { (trailerArray, error) in
			guard error == nil else {return}
			guard let trailerListArray = trailerArray, trailerListArray.count != 0 else { print("No trailer"); return}
			DispatchQueue.main.async {
				self.youtubePlayerView.load(withVideoId: trailerListArray[0].key)
			}
		}
	}
	
}

// MARK: - Static Methods

extension MLMovieDetailViewController {
	
	/**
	Instantiate MLMovieDetailViewController from Main storybaord
	
	- Returns: MLMovieDetailViewController
	*/
	static func instantiateFromStoryboard() -> MLMovieDetailViewController {
		let movieDetailController = Storyboard.mainStoryboard.instantiateViewController(withIdentifier: MLMovieDetailViewController.typeName)
		return movieDetailController as! MLMovieDetailViewController
	}
}
