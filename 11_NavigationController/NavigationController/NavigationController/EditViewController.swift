//
//  EditViewController.swift
//  NavigationController
//
//  Created by 유혜빈 on 2022/10/05.
//

import UIKit

protocol EditDelegate{
    func didMessageEditDone(_ controller: EditViewController, _ message: String)
    func didLampOnOffDone(_ controller: EditViewController, _ isOn: Bool)
}

class EditViewController: UIViewController{
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var lampOnOffLabel: UILabel!
    @IBOutlet weak var lampSwitch: UISwitch!
    
    var textValue: String = ""
    var message: String = ""
    var isOn = true
    var delegate: EditDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.textLabel.text = textValue
        self.textField.text = message
        self.lampSwitch.isOn = isOn
        self.lampOnOffLabel.text = isOn ? "끄기" : "켜기"
    }

    @IBAction func tapDoneButton(_ sender: UIButton) {
        if delegate != nil{
            delegate?.didMessageEditDone(self, textField.text!)
            delegate?.didLampOnOffDone(self, isOn)
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func lampChange(_ sender: UISwitch) {
        if sender.isOn{
            isOn = true
            self.lampOnOffLabel.text = "끄기"
        }else {
            isOn = false
            self.lampOnOffLabel.text = "켜기"
        }
    }
}
