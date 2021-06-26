//
//  MLReviewViewController.swift
//  MovieListDemo
//
//  Created by Yash Agarwal on 25/06/21.
//

import UIKit

class MLReviewViewController: UIViewController {
	
	// MARK: - Outlets
	
	@IBOutlet weak var backgroundView: UIView!
	@IBOutlet weak var reviewTableView: UITableView!
	
	// MARK: - Instance Properties
	
	var movieModal:MovieViewModal?
	var movieColor:UIColor?
	var currentPage:Int = 1
	var totalPage:Int?
	var reviewListArray:[ReviewViewModal] = []
	
	// MARK: - Override Methods
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		customUIForReviewScreen()
		getReviews()
	}
}

// MARK: - Fileprivate Methods

extension MLReviewViewController {
	
	///Custom UI for review screen
	fileprivate func customUIForReviewScreen() {
		
		backgroundView.backgroundColor = movieColor
		backgroundView.dropShodow(with: 0.0)
		
		//tableView auto dimension
		reviewTableView.estimatedRowHeight = 75.0
		reviewTableView.rowHeight = UITableView.automaticDimension
	}
	
	///Get reviews
	fileprivate func getReviews() {
		guard let movie = movieModal, let id = movie.id else {return}
		getReviews(forMoview: String(describing: id), forPage: String(describing: currentPage))
	}
}

// MARK: - UITableViewDataSource

extension MLReviewViewController:UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return reviewListArray.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = reviewTableView.dequeueReusableCell(withIdentifier: MLReviewTableViewCell.typeName, for: indexPath) as! MLReviewTableViewCell
		cell.reviewDetail = reviewListArray[indexPath.row]
		return cell
	}
}

// MARK: - API Methods

extension MLReviewViewController {
	
	/**
	Get reviews for the movie
	- Parameter id: Movie ID
	- Parameter number: Page number to get the data
	*/
	fileprivate func getReviews(forMoview id:String, forPage number:String) {
		RequestManager.sharedInstance.getMoviewReview(with: Constant.URL.reviewUrl(withId: id, forPage: number)) { (reviewArray, currentPage, totalPage, totalResults, error) in
			
			guard error == nil else {return}
			guard let reviewListArray = reviewArray, reviewListArray.count != 0 else { print("No review"); return}
			for review in reviewListArray {
				self.reviewListArray.append(review)
			}
			
			DispatchQueue.main.async {
				self.reviewTableView.reloadData()
			}
			
			self.currentPage = currentPage ?? 1
			self.totalPage = totalPage
		}
	}
}

// MARK: - UIScrollViewDelegate

extension MLReviewViewController: UIScrollViewDelegate {
	
	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
		guard let total = totalPage, currentPage < total else {return}
		currentPage += 1
		self.getReviews()
	}
}

// MARK: - Static Methods

extension MLReviewViewController {
	
	/**
	Instantiate MLReviewViewController from Main storybord
	
	- Returns: MLReviewViewController
	*/
	static func instantiateFromStoryboard() -> MLReviewViewController {
		let reviewController = Storyboard.mainStoryboard.instantiateViewController(withIdentifier: MLReviewViewController.typeName)
		return reviewController as! MLReviewViewController
	}
}
