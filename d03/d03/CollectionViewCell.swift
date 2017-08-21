//
//  CollectionViewCell.swift
//  d03
//
//  Created by Vlad on 11.08.17.
//  Copyright © 2017 Vlad. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var url: String? {
        didSet {
            imageView.contentMode = .scaleToFill
            imageView.backgroundColor = .black
            
            let activityIndicator = UIActivityIndicatorView()
            activityIndicator.startAnimating()
            activityIndicator.center = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
            imageView.addSubview(activityIndicator)
            
            let imageUrl = URL(string: url!)
            
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: imageUrl!) {
                    DispatchQueue.main.async {
                        activityIndicator.stopAnimating()
                        self.imageView.image = UIImage(data: data)
                    }
                } else {
                    DispatchQueue.main.async {
                        activityIndicator.stopAnimating()
                        let alertController = UIAlertController(title: "Error", message: "Cannot acces to " + self.url!, preferredStyle: .alert)
                        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                        alertController.addAction(alertAction)
                        let rootController = UIApplication.shared.delegate?.window??.rootViewController
                        rootController?.present(alertController, animated: true, completion: nil)
                    }

                }
                MyData.imagesDownloaded += 1
                if MyData.imagesDownloaded == MyData.urls.count {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
            }
        }
    }
}
