//
//  ViewController.swift
//  PickerView-Mission
//
//  Created by 유혜빈 on 2022/09/28.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var imageNameLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    var imageFile = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg","6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        
        self.imageNameLabel.text = imageFile[0]
        self.imgView.image = UIImage(named: imageFile[0])
    }

}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFile.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: UIImage(named: imageFile[row]))
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 150)
        
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 80
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{
            self.imageNameLabel.text = imageFile[row]
        }
        if component == 1{
            self.imgView.image = UIImage(named: imageFile[row])
        }
    }
    
    
}
