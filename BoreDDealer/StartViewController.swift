//
//  ViewController.swift
//  BoreDDealer
//
//  Created by Yang Song on 7/5/16.
//  Copyright © 2016 WhenYouBored. All rights reserved.
//

import UIKit
import CoreImage

class StartViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    @IBOutlet weak var imagePicked: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func takeSelfie(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera;
            imagePicker.allowsEditing = false
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
        
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        let ciImage = CIImage(CGImage: image.CGImage!)
        
        let options = [CIDetectorAccuracy: CIDetectorAccuracyHigh]
        let faceDetector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: options)
        
        let faces = faceDetector.featuresInImage(ciImage)
        
        if let face = faces.first as? CIFaceFeature {
            print("Found face at \(face.bounds)")
            
            if face.hasLeftEyePosition {
                print("Found left eye at \(face.leftEyePosition)")
            }
            
            if face.hasRightEyePosition {
                print("Found right eye at \(face.rightEyePosition)")
            }
            
            if face.hasMouthPosition {
                print("Found mouth at \(face.mouthPosition)")
            }
        }
        imagePicked.image = image
        self.dismissViewControllerAnimated(true, completion: nil);
    }
    
    

}



// MARK: Tab Bar Delegate

