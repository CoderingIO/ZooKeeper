//
//  ImageGalleryViewController.swift
//  ZooKeeper
//
//  Created by Wayne Bangert on 2/17/16.
//  Copyright © 2016 Wayne Bangert. All rights reserved.
//

import UIKit

class ImageGalleryViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    private static let storyboard = UIStoryboard(name: "Modals", bundle: nil)
    
    static func instance() -> ImageGalleryViewController {
        return storyboard.instantiateViewControllerWithIdentifier("ImageGalleryViewController") as! ImageGalleryViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func dismissTouched(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("AnimalCell", forIndexPath: indexPath) as! AnimalCollectionViewCell
        cell.animalCellLabel.text = "name"
        return cell
    }
}
