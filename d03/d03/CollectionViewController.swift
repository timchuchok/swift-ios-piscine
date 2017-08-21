//
//  CollectionViewController.swift
//  d03
//
//  Created by Vlad on 11.08.17.
//  Copyright © 2017 Vlad. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CollectionViewCell"
private let segueIdentifier = "showImageSegue"

class CollectionViewController: UICollectionViewController {

    var image: UIImage?
    
    var titleForImage: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        image = cell.imageView.image
        titleForImage =  MyData.urls[indexPath.row].0
        performSegue(withIdentifier: segueIdentifier, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == segueIdentifier {
            segue.destination.title = titleForImage
            let dest = segue.destination as! ImageViewController
            dest.imageView = UIImageView(image: image)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {

        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 6, left: 4, bottom: 6, right: 4)
        layout.minimumInteritemSpacing = 4
        layout.minimumLineSpacing = 4
        layout.invalidateLayout()
        return CGSize(width: ((self.view.frame.width / 2) - 6), height: ((self.view.frame.width / 2) - 6))
    }

     override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MyData.urls.count

    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        cell.url = MyData.urls[indexPath.row].1
        return cell
    }

}

