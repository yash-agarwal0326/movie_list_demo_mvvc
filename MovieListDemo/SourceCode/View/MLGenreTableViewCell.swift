//
//  MLGenreTableViewCell.swift
//  MovieListDemo
//
//  Created by Yash Agarwal on 24/06/21.
//

import UIKit

class MLGenreTableViewCell: UITableViewCell {
	
	// MARK: - Outlets
	
	@IBOutlet weak var containerView: UIView!
	@IBOutlet weak var titleLabel: UILabel!
	
	// MARK: - Instance Properties
	
	var genreDetail:GenreViewModal!{
		didSet {
			titleLabel.text = genreDetail.name
		}
	}
	
	// MARK: - Override Methods
	
	override func awakeFromNib() {
		super.awakeFromNib()
		self.selectionStyle = .none
		containerView.backgroundColor = UIColor.generateRandomColor()
		containerView.dropShodow()
	}
	
}
