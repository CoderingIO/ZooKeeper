//
//  AnimalViewController.swift
//  ZooKeeper
//
//  Created by Wayne Bangert on 2/10/16.
//  Copyright © 2016 Wayne Bangert. All rights reserved.
//

import UIKit

class AnimalViewController: DetailViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var isMaleSwitch: UISegmentedControl!
    @IBOutlet weak var birthdayDatePicker: UIDatePicker!
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var animalPhoto: UIImageView!
    
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

    @IBAction func controlChanged(sender: AnyObject) {

    }
    
    @IBAction func cameraTouched(sender: AnyObject) {
        guard let animal = detailItem as? Animal else { return }
        
        if animal.photo == nil {
            ABHPresentImageCapture(self, title: "Choose", message: "Choose")
        } else {
            ABHAlertFor(self, title: "Replace Photo", message: "Are you sure you want to replace this image", okCallback: { () -> Void in
                ABHPresentImageCapture(self, title: "", message: "")
                }, cancelCallback: nil)
                            
                    
            
        }
    }
    
    
    override func configureView() {
        guard let animal = self.detailItem as? Animal where nameTextField != nil else {return}
        
            nameTextField?.text = animal.name
        
            colorTextField?.text = animal.color
//            if let weight = animal.weight {
//                weightTextField?.text = NSString(format: "%0.2f", weight) as String
//            } else {
//
//            }
            isMaleSwitch?.selectedSegmentIndex = animal.isMale ? 0 : 1
            animalPhoto?.image = animal.photo ?? UIImage(named: "camera")
            
        }
    
    
}

extension AnimalViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
   
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        picker.dismissViewControllerAnimated(true, completion: nil)
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage,
            let animal = detailItem as? Animal {
                animal.photo = image
            
        }
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
}