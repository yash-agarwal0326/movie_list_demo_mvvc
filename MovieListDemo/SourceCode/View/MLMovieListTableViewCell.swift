//
//  MLMovieListTableViewCell.swift
//  MovieListDemo
//
//  Created by Yash Agarwal on 25/06/21.
//

import UIKit

class MLMovieListTableViewCell: UITableViewCell {
	
	// MARK: - Outlets
	
	@IBOutlet weak var containerView: UIView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var displayImageView: UIImageView!
	
	// MARK: - Instance Properties
	
	var movieDetail:MovieViewModal! {
		didSet {
			titleLabel.text = movieDetail.title
			displayImageView.image = nil
			displayImageView.downloaded(from: Constant.URL.imageUrl(withId: movieDetail.imageId ?? "wwemzKWzjKYJFfCeiB57q3r4Bcm.svg"))
		}
	}
	
	// MARK: - Override Methods
	
	override func awakeFromNib() {
		super.awakeFromNib()
		self.selectionStyle = .none
		
		containerView.backgroundColor = UIColor.generateRandomColor()
		containerView.dropShodow()
		displayImageView.addBorder(withColor: .white, andWidth: 1.0)
	}
}
