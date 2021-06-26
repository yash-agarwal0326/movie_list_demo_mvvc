//
//  MLGenreViewController.swift
//  MovieListDemo
//
//  Created by Yash Agarwal on 24/06/21.
//

import UIKit

class MLGenreViewController: UIViewController {
	
	// MARK: - Outlets
	
	@IBOutlet weak var genreTableView: UITableView!
	
	// MARK: - Instance Properties
	
	var genreListArray:[GenreViewModal] = [] {
		didSet {
			if self.genreListArray != oldValue {
				DispatchQueue.main.async {
					self.genreTableView.reloadData()
				}
			}
		}
		willSet(newValue) {
			self.genreListArray = newValue
		}
	}
	
	// MARK: - Override Methods
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		getConfiguration()
		getGenreList()
	}
}

// MARK: - FilePrivate Methods

extension MLGenreViewController {
	
	/**
	Navigate to movie list screen
	
	- Parameter genre: GenreViewModal
	*/
	fileprivate func navigateToMovieListScreen(forGenre genre: GenreViewModal) {
		let movieListController = MLMovieListViewController.instantiateFromStoryboard()
		movieListController.genreDetail = genre
		self.navigationController?.pushViewController(movieListController, animated: true)
	}
}

// MARK: - UITableViewDataSource

extension MLGenreViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return genreListArray.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = genreTableView.dequeueReusableCell(withIdentifier: MLGenreTableViewCell.typeName, for: indexPath) as! MLGenreTableViewCell
		cell.genreDetail = genreListArray[indexPath.row]
		return cell
	}
}

// MARK: - UITableViewDelegate

extension MLGenreViewController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 70.0
	}
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let titleLabel = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: tableView.frame.width, height: 60.0))
		titleLabel.text = Constant.Name.genre
		titleLabel.backgroundColor = .clear
		titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
		return titleLabel
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 60.0
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		navigateToMovieListScreen(forGenre: genreListArray[indexPath.row])
	}
}

// MARK: - API Methods

extension MLGenreViewController {
	
	///Get configuration
	fileprivate func getConfiguration() {
		RequestManager.sharedInstance.getConfiguration(with: Constant.URL.configurationUrl) { (configViewModal, error) in
			guard error == nil else {return}
			guard let modal = configViewModal else {return}
			Utility.saveImageServerUrl(modal.secureBaseUrl ?? "")
		}
	}
	
	///Get genre list
	fileprivate func getGenreList() {
		RequestManager.sharedInstance.getGenreList(with: Constant.URL.genreUrl) { (genreArray, error) in
			guard error == nil else {return}
			guard let genreListArray = genreArray, genreListArray.count != 0 else { print("No genre"); return}
			self.genreListArray = genreListArray
		}
	}
}

// MARK: - Static Methods

extension MLGenreViewController {
	
	/**
	Instantiate  MLGenreViewController from Main storyboard
	
	- Returns: MLGenreViewController
	*/
	static func instantiateFromStoryboard() -> MLGenreViewController {
		let genreViewController = Storyboard.mainStoryboard.instantiateViewController(withIdentifier: MLGenreViewController.typeName)
		return genreViewController as! MLGenreViewController
	}
}
