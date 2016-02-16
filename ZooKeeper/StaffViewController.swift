//
//  StaffViewController.swift
//  ZooKeeper
//
//  Created by Wayne Bangert on 2/11/16.
//  Copyright © 2016 Wayne Bangert. All rights reserved.
//

import UIKit

class StaffViewController: DetailViewController {
    
    @IBOutlet weak var staffNameTextField: UITextField!
    @IBOutlet weak var staffWeightTextField: UITextField!
    @IBOutlet weak var isMaleToggle: UISegmentedControl!

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

    override func configureView() {
        if let staff = detailItem as? Staff {
            staffNameTextField?.text = staff.name
        }
    }
}


extension StaffViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
            picker.dismissViewControllerAnimated(true, completion: nil)
            if let image = info[UIImagePickerControllerOriginalImage] as? UIImage,
                let staff = detailItem as? Staff {
                    staff.photo = image
            }
        }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
        }
}

