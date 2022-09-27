//
//  ViewController.swift
//  navigationViewController
//
//  Created by 유혜빈 on 2022/09/24.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    
    var isOn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imgView.image = UIImage(named: "lamp_on.png")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editController = segue.destination as! EditViewController
        
        if segue.identifier == "editButton"{
            editController.stringValue = "segue: use Button"
        }else if segue.identifier == "editBarButton"{
            editController.stringValue = "segue: use Bar Button"
        }
        editController.message = self.messageTextField.text!
        editController.isOn = isOn
        editController.delegate = self
    }
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        self.messageTextField.text = message
    }
    
    func didLampOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn{
            self.imgView.image = UIImage(named: "lamp_on.png")
            self.isOn = true
        }else{
            self.imgView.image = UIImage(named: "lamp_off.png")
            self.isOn = false
        }
    }
}

