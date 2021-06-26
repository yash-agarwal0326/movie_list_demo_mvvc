//
//  MLMovieListViewController.swift
//  MovieListDemo
//
//  Created by Yash Agarwal on 25/06/21.
//

import UIKit

class MLMovieListViewController: UIViewController {
	
	// MARK: - Outlets
	
	@IBOutlet weak var movieListTableView: UITableView!
	
	// MARK: - Actions
	
	@IBAction func backButton(_ sender: UIButton) {
		self.navigationController?.popViewController(animated: true)
	}
	
	// MARK: - Instance Properties
	
	var genreDetail:GenreViewModal?
	
	var movieListArray:[MovieViewModal] = [] {
		didSet {
			if self.movieListArray != oldValue {
				DispatchQueue.main.async {
					self.movieListTableView.reloadData()
				}
			}
		}
		willSet(newValue) {
			self.movieListArray = newValue
		}
	}
	
	// MARK: - Override Methods
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		guard let genre = genreDetail, let id = genre.id else {return}
		getMovieList(for: id)
	}
}

// MAARK: - Fileprivate Methods

extension MLMovieListViewController {
	/**
	Navigate to movie detail screen
	
	- Parameter detail: Movie detail
	- Parameter color: Movie UIColor
	*/
	fileprivate func navigateToMovieDetailScreen(withMovie detail:MovieViewModal, withColor color:UIColor) {
		let movieDetailScreen = MLMovieDetailViewController.instantiateFromStoryboard()
		movieDetailScreen.movieColor = color
		movieDetailScreen.movieDetial = detail
		self.navigationController?.pushViewController(movieDetailScreen, animated: true)
	}
}

// MARK: - UITableViewDataSource

extension MLMovieListViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return movieListArray.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = movieListTableView.dequeueReusableCell(withIdentifier: MLMovieListTableViewCell.typeName, for: indexPath) as! MLMovieListTableViewCell
		cell.movieDetail = movieListArray[indexPath.row]
		return cell
	}
}

// MARK: - UITableViewDelegate

extension MLMovieListViewController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		guard let genre = genreDetail, let genreName = genre.name else {return nil}
		
		let titleLabel = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: tableView.frame.width, height: 60.0))
		titleLabel.text = genreName.capitalized + " " + Constant.Name.movies
		titleLabel.backgroundColor = .clear
		titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
		return titleLabel
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 60.0
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 80.0
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let cell = movieListTableView.cellForRow(at: indexPath) as! MLMovieListTableViewCell
		navigateToMovieDetailScreen(withMovie: movieListArray[indexPath.row], withColor: cell.containerView.backgroundColor ?? UIColor.generateRandomColor())
	}
}

// MARK: - API Methods

extension MLMovieListViewController {
	
	/**
	Get movie list
	
	- Parameter genreId: Genre ID to get the movie list
	*/
	fileprivate func getMovieList(for genreId:Int) {
		
		RequestManager.sharedInstance.getMovieList(with: Constant.URL.movieListUrl(for: genreId)) { (movieArray, error) in
			guard error == nil else {return}
			guard let movieListArray = movieArray, movieListArray.count != 0 else { print("No movie"); return}
			self.movieListArray = movieListArray
		}
	}
}

// MARK: - Static Methods

extension MLMovieListViewController {
	
	/**
	Instantiate MLMovieListViewController from Main storyboard
	
	- Returns: MLMovieListViewController
	*/
	static func instantiateFromStoryboard() -> MLMovieListViewController {
		let movieListController = Storyboard.mainStoryboard.instantiateViewController(withIdentifier: MLMovieListViewController.typeName) as! MLMovieListViewController
		return movieListController
	}
}
