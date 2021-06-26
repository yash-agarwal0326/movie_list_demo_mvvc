//
//  UIImageView+Extension.swift
//  MovieListDemo
//
//  Created by Yash Agarwal on 24/06/21.
//

import Foundation
import UIKit

extension UIImageView {
	
	/**
	Download image from Image-URL with the help of URLSession
	
	- Parameter link: Image link
	- Parameter mode: Option to specify how a view adjusts its content when its size changes.
	*/
	func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
		
		guard let url = URL(string: link) else { return }
		
		contentMode = mode
		URLSession.shared.dataTask(with: url) { data, response, error in
			guard
				let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
				let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
				let data = data, error == nil,
				let image = UIImage(data: data)
			else { return }
			DispatchQueue.main.async() { [weak self] in
				self?.image = image
			}
		}.resume()
	}
	
}
