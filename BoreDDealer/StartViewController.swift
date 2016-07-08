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
import ImageIO

class MyCanvas: UIView {
    override func drawRect(rect: CGRect) {
        UIColor.greenColor().setFill()
        let path = UIBezierPath(rect: self.bounds)
        path.fill()
    }
}

class StartViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    @IBOutlet weak var imagePicked: UIImageView!
    //    var faceFeatures: [CIFaceFeature]!
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
        
        // The output below is limited by 1 KB.
        // Please Sign Up (Free!) to remove this limitation.
        
        var exifOrientation: Int
        switch image.imageOrientation {
        case .Up:
            exifOrientation = 1
        case .Down:
            exifOrientation = 3
        case .Left:
            exifOrientation = 8
        case .Right:
            exifOrientation = 6
        case .UpMirrored:
            exifOrientation = 2
        case .DownMirrored:
            exifOrientation = 4
        case .LeftMirrored:
            exifOrientation = 5
        case .RightMirrored:
            exifOrientation = 7
            
        }
        
        let faceFeatures: [AnyObject] = faceDetector.featuresInImage(ciImage, options: [CIDetectorImageOrientation: Int(exifOrientation)])
        
        
        
        
        //        if let orientation: AnyObject = ciImage.properties[kCGImagePropertyOrientation as String] {
        //            faceFeatures = faceDetector.featuresInImage(ciImage, options: [CIDetectorImageOrientation: orientation]) as! [CIFaceFeature]
        //
        //        } else {
        //            faceFeatures = faceDetector.featuresInImage(ciImage)as! [CIFaceFeature]
        //        }
        //
        
        //        let faceFeatures = faceDetector.featuresInImage(ciImage, options:[CIDetectorImageOrientation: exifOrientation])
        
        // 1.
        let inputImageSize = ciImage.extent.size
        var transform = CGAffineTransformIdentity
        transform = CGAffineTransformScale(transform, 1, -1)
        transform = CGAffineTransformTranslate(transform, 0, -inputImageSize.height)
        
        for faceFeature in faceFeatures {
            var faceViewBounds = CGRectApplyAffineTransform(faceFeature.bounds, transform)
            
            // 2.
            let scale = min(imagePicked.bounds.size.width / inputImageSize.width,
                            imagePicked.bounds.size.height / inputImageSize.height)
            let offsetX = (imagePicked.bounds.size.width - inputImageSize.width * scale) / 2
            let offsetY = (imagePicked.bounds.size.height - inputImageSize.height * scale) / 2
            
            faceViewBounds = CGRectApplyAffineTransform(faceViewBounds, CGAffineTransformMakeScale(scale, scale))
            faceViewBounds.origin.x += offsetX
            faceViewBounds.origin.y += offsetY
            
            if (faceFeature.hasLeftEyePosition != nil) {
                print("Found left eye at \(faceFeature.leftEyePosition)")
            }
            
            if (faceFeature.hasRightEyePosition != nil) {
                print("Found right eye at \(faceFeature.rightEyePosition)")
            }
            
            if (faceFeature.hasMouthPosition != nil) {
                print("Found mouth at \(faceFeature.mouthPosition)")
            }
            
            
            let faceView = UIView(frame: faceViewBounds)
            faceView.layer.borderColor = UIColor.orangeColor().CGColor
            faceView.layer.borderWidth = 2
            
            imagePicked.addSubview(faceView)
            
            //        if let face = faces.first as? CIFaceFeature {
            //            print("Found face at \(face.bounds)")
            //
            //            let inputImageSize = ciImage.extent.size
            //            var transform = CGAffineTransformIdentity
            //            transform = CGAffineTransformScale(transform, 0.7, -0.7)
            //            transform = CGAffineTransformTranslate(transform, 0, -inputImageSize.height)
            //
            //            for faceFeature in faces {
            //                var faceViewBounds = CGRectApplyAffineTransform(faceFeature.bounds, transform)
            //                // 2.
            //                let scaleTransform = CGAffineTransformMakeScale(0.5, 0.5)
            //                faceViewBounds = CGRectApplyAffineTransform(faceViewBounds, scaleTransform)
            //
            //                let faceView = UIView(frame: faceViewBounds)
            //                faceView.layer.borderColor = UIColor.orangeColor().CGColor
            //                faceView.layer.borderWidth = 2
            //
            //                imagePicked.addSubview(faceView)
            //            }
            
            
            //            let viewRect = CGRect(x: 50, y: 50, width: face.bounds.width, height: face.bounds.height)
            //            let faceView = MyCanvas(frame: viewRect)
            //            imagePicked.addSubview(faceView)
            
            
            //            let cropSquare = CGRectMake(face.bounds.minX, face.bounds.minY, face.bounds.width, face.bounds.height)
            //            let imageRef = CGImageCreateWithImageInRect(image.CGImage, cropSquare);
            //            print("minX \(face.bounds.minX) minY \(face.bounds.minY) width \(face.bounds.width) height \(face.bounds.height)")
            //
            
            //            imagePicked.image = UIImage(CGImage: imageRef!)
            
            
            
            
        }
        
        
        imagePicked.image = image
        self.dismissViewControllerAnimated(true, completion: nil);
    }
    
    
    
}

