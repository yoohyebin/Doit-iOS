//
//  ViewController.swift
//  PickerView
//
//  Created by 유혜빈 on 2022/09/28.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var imageNameLabel: UILabel!
    
    var imageFile = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg","6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        
        self.imageNameLabel.text = imageFile[0]
        self.imgView.image = UIImage(named: imageFile[0])
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFile.count
    }
    
    //룰렛에 파일명 출력
    /*
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return imageFile[row]
    }
     */
    
    //룰렛에 이미지 출력
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: UIImage(named: imageFile[row]))
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 150)
        
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 80
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.imageNameLabel.text = imageFile[row]
        self.imgView.image = UIImage(named: imageFile[row])
    }
}
