//
//  EditViewController.swift
//  navigationViewController
//
//  Created by 유혜빈 on 2022/09/24.
//

import UIKit

protocol EditDelegate{
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didLampOnOffDone(_ controller: EditViewController, isOn: Bool)
}

class EditViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var onOffLabel: UILabel!
    @IBOutlet weak var onOffSwitch: UISwitch!
    
    var stringValue = ""
    var message = ""
    var delegate: EditDelegate?
    var isOn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textLabel.text = stringValue
        self.messageTextField.text = message
        self.onOffSwitch.isOn = isOn
    }
    
    @IBAction func tapDoneButton(_ sender: UIButton) {
        if delegate != nil{
            delegate?.didMessageEditDone(self, message: self.messageTextField.text!)
            delegate?.didLampOnOffDone(self, isOn: isOn)
        }
        _ = navigationController?.popViewController(animated: true)
    }

    @IBAction func onOffLamp(_ sender: UISwitch) {
        if sender.isOn{
            isOn = true
            self.onOffLabel.text = "끄기"
        }else{
            isOn = false
            self.onOffLabel.text = "켜기"
        }
    }
    
}
