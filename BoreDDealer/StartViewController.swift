//
//  ViewController.swift
//  BoreDDealer
//
//  Created by Yang Song on 7/5/16.
//  Copyright © 2016 WhenYouBored. All rights reserved.
//

import UIKit
import CoreImage
import AVFoundation

class MyCanvas: UIView {
    override func drawRect(rect: CGRect) {
        UIColor.greenColor().setFill()
        let path = UIBezierPath(rect: self.bounds)
        path.fill()
    }
}

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
            if UIImagePickerController.isCameraDeviceAvailable(UIImagePickerControllerCameraDevice.Front){
                imagePicker.cameraDevice = UIImagePickerControllerCameraDevice.Front
            }
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
        
    }
    
    
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        let ciImage = CIImage(CGImage: image.CGImage!)
        
 
        let faceDetector = CIDetector(ofType:CIDetectorTypeFace, context:nil, options:[CIDetectorAccuracy: CIDetectorAccuracyHigh])
        
        
        
        let faces = faceDetector.featuresInImage(ciImage)
        
        if let face = faces.first as? CIFaceFeature {
            print("Found face at \(face.bounds)")
            
            let inputImageSize = ciImage.extent.size
            var transform = CGAffineTransformIdentity
            transform = CGAffineTransformScale(transform, 0.7, -0.7)
            transform = CGAffineTransformTranslate(transform, 0, -inputImageSize.height)
            
            for faceFeature in faces {
                var faceViewBounds = CGRectApplyAffineTransform(faceFeature.bounds, transform)
                // 2.
                let scaleTransform = CGAffineTransformMakeScale(0.5, 0.5)
                faceViewBounds = CGRectApplyAffineTransform(faceViewBounds, scaleTransform)
                
                let faceView = UIView(frame: faceViewBounds)
                faceView.layer.borderColor = UIColor.orangeColor().CGColor
                faceView.layer.borderWidth = 2
                
                imagePicked.addSubview(faceView)
            }

            
//            let viewRect = CGRect(x: 50, y: 50, width: face.bounds.width, height: face.bounds.height)
//            let faceView = MyCanvas(frame: viewRect)
//            imagePicked.addSubview(faceView)
            
            
//            let cropSquare = CGRectMake(face.bounds.minX, face.bounds.minY, face.bounds.width, face.bounds.height)
//            let imageRef = CGImageCreateWithImageInRect(image.CGImage, cropSquare);
//            print("minX \(face.bounds.minX) minY \(face.bounds.minY) width \(face.bounds.width) height \(face.bounds.height)")
//            
          
//            imagePicked.image = UIImage(CGImage: imageRef!)
            
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

