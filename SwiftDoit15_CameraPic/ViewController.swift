//
//  ViewController.swift
//  SwiftDoit15_CameraPic
//
//  Created by 비바 on 2022/12/30.
//

import UIKit
import MobileCoreServices

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
        if (UIImagePickerController.isSourceTypeAvailable(.camera)){
            flagImageSave = true
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            //imagePicker.mediaTypes = [kUTTypeImage as String]
            //imagePicker.mediaTypes = [UTType.jpeg.identifier as
            imagePicker.allowsEditing = false
            present(imagePicker,animated: true,completion: nil)
        }
        else{
            myAlert("camera inaccessable", message: "application can't access the camera")
        }
    }
    
    @IBAction func btnLoadVideo(_ sender: UIButton) {

    }
    @IBAction func btnCaptureImage(_ sender: UIButton) {

    }
    @IBAction func btnRecordVideo(_ sender: UIButton) {

    }

}

