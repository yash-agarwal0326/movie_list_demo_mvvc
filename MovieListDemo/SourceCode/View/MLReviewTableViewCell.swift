//
//  MLReviewTableViewCell.swift
//  MovieListDemo
//
//  Created by Yash Agarwal on 25/06/21.
//

import UIKit

class MLReviewTableViewCell: UITableViewCell {
	
	// MARK: - Outlets
	
	@IBOutlet weak var autherNameLabel: UILabel!
	@IBOutlet weak var contentLabel: UILabel!
	@IBOutlet weak var containerView: UIView!
	
	// MARK: - Instance Properites
	
	var reviewDetail:ReviewViewModal! {
		didSet {
			autherNameLabel.text = reviewDetail.author
			contentLabel.text = reviewDetail.content
		}
	}
	
	// MARK: - Override Methods
	
	override func awakeFromNib() {
		super.awakeFromNib()
		self.selectionStyle = .none
		containerView.addBorder(withColor: .white, andWidth: 1.0)
	}
}
