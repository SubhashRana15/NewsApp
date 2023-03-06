//
//  UIImageView + Extensions.swift
//  NewsApp
//
//  Created by Rana on 06/03/23.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(with urlString: String) {
        guard let url =  URL.init(string: urlString) else {
            return
        }
        
        let resource = ImageResource(downloadURL: url, cacheKey: urlString)
        kf.indicatorType = .activity
        kf.setImage(with: resource)
    }
}
