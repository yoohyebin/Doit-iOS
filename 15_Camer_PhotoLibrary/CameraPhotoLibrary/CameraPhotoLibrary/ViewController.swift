//
//  ViewController.swift
//  CameraPhotoLibrary
//
//  Created by 유혜빈 on 2022/09/28.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    
    let imagePicker: UIImagePickerController! = UIImagePickerController()
    var image: UIImage!
    var videoURL: URL!
    var saveFlag = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapTakePictureButton(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            saveFlag = true
            
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = ["public.image"]
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true)
        }else{
            myAlert("Camera 사용불가", "앱이 카메라에 접근할 수 없습니다.")
        }
    }

    @IBAction func tapRecordVideoButton(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            saveFlag = true
            
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = ["public.movie"]
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true)
        }else{
            myAlert("Camera 사용불가", "앱이 카메라에 접근할 수 없습니다.")
        }
    }
    
    @IBAction func tapLoadPictureButton(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            saveFlag = false
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = ["public.image"]
            imagePicker.allowsEditing = true
            
            present(imagePicker, animated: true)
        }else{
            myAlert("Photo Album 사용불가", "앱이 Photo Album에 접근할 수 없습니다.")
        }
    }
    
    @IBAction func tapLoadVideoButton(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            saveFlag = false
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = ["public.movie"]
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true)
        }else{
            myAlert("Photo Album 사용불가", "앱이 Photo Album에 접근할 수 없습니다.")
        }
    }
    
    func myAlert(_ title: String, _ message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        
        alert.addAction(action)
        self.present(alert, animated: true)
    }
}

extension ViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString
        
        if mediaType.isEqual(to: "public.image" as String){
            image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            
            if saveFlag{
                UIImageWriteToSavedPhotosAlbum(image, self, nil, nil)
            }
            self.imgView.image = image
        }else if mediaType.isEqual(to: "public.movie" as String){
            if saveFlag{
                videoURL = info[UIImagePickerController.InfoKey.mediaURL] as! URL
                UISaveVideoAtPathToSavedPhotosAlbum(videoURL.relativePath, self, nil, nil)
            }
        }
        self.dismiss(animated: true)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true)
    }
}
