//
//  ViewController.swift
//  SwiftDoit15_CameraPic
//
//  Created by 비바 on 2022/12/30.
//

import UIKit
import MobileCoreServices
import UniformTypeIdentifiers
class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    @IBOutlet weak var imageView: UIImageView!
    let imagePicker:UIImagePickerController! = UIImagePickerController()
    var captureImage: UIImage!
    var videoURL: URL!
    var flagImageSave: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func myAlert(_ title: String, message msg: String)
    {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default,handler: nil)
        alert.addAction(action)
        self.present(alert,animated: true, completion: nil)
        
    }
    @IBAction func btnLoadPicture(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)){
            flagImageSave = false
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = true
            present(imagePicker,animated: true, completion: nil)
        }
        else{
            myAlert("photo inaccessable", message: "application can't access the photo")
        }
        
    }
    
    @IBAction func btnLoadVideo(_ sender: UIButton) {
        
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)){
            flagImageSave = false
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = [kUTTypeMovie as String]
            imagePicker.allowsEditing = true
            present(imagePicker,animated: true, completion: nil)
        }
        else{
            myAlert("photo inaccessable", message: "application can't access the photo")
        }

    }
    @IBAction func btnCaptureImage(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.camera)){
            flagImageSave = true
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            //imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.mediaTypes = [UTType.image.identifier]
            imagePicker.allowsEditing = false
            present(imagePicker,animated: true,completion: nil)
        }
        else{
            myAlert("camera inaccessable", message: "application can't access the camera")
        }
    }
    @IBAction func btnRecordVideo(_ sender: UIButton) {
        //let  utilType = [UTType.image,.movie,.video]
        if (UIImagePickerController.isSourceTypeAvailable(.camera)){
            flagImageSave = true
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            //imagePicker.mediaTypes = [kUTTypeMovie as String]
            imagePicker.mediaTypes = [UTType.movie.identifier]
            imagePicker.allowsEditing = false
            present(imagePicker,animated: true,completion: nil)
        }
        else{
            myAlert("camera inaccessable", message: "application can't access the camera")
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //let mediaType = info[UIImagePickerControllerMediaType] as!  NSString
        
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString
        
        if mediaType.isEqual(to: UTType.image.identifier as NSString as String){
            captureImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            
            if flagImageSave{
                UIImageWriteToSavedPhotosAlbum(captureImage, self, nil, nil)
            }
            imageView.image = captureImage
        }
        else if mediaType.isEqual(to: kUTTypeMovie as NSString as String ){
            if flagImageSave{
                videoURL = (info[UIImagePickerController.InfoKey.mediaURL] as! URL)
                UISaveVideoAtPathToSavedPhotosAlbum(videoURL.relativePath,self,nil,nil)
                NSLog("moive save")
            }
        }
        self.dismiss(animated: true,completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true,completion: nil)
    }
}

