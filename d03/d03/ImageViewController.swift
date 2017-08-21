//
//  ImageViewController.swift
//  d03
//
//  Created by Vladyslav Tymchenko on 19.08.17.
//  Copyright © 2017 Vlad. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    var imageView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.addSubview(imageView!)
        scrollView.contentSize = (imageView?.frame.size)!
        scrollView.minimumZoomScale = 0.1
        scrollView.maximumZoomScale = 100
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
