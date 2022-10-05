//
//  ViewController.swift
//  Alert-Mission
//
//  Created by 유혜빈 on 2022/09/28.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var selectedTimeLabel: UILabel!
    
    var alarmTime: String = ""
    var isAlert = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: 1.0,
                             target: self,
                             selector: #selector(updateTime),
                             userInfo: nil,
                             repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        
        self.selectedTimeLabel.text = formatter.string(from: datePickerView.date)
        
        formatter.dateFormat = "HH:mm aaa"
        alarmTime = formatter.string(from: datePickerView.date)
        print(alarmTime)
    }
    
    @objc func updateTime(){
        let date = NSDate()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        
        self.currentTimeLabel.text = formatter.string(from: date as Date)
        
        formatter.dateFormat = "HH:mm aaa"
        let currentTime = formatter.string(from: date as Date)
        
        if alarmTime == currentTime{
            if !isAlert{
                let alarmAlert = UIAlertController(title: "알림",
                                                   message: "설정된 시간입니다!!",
                                                   preferredStyle: UIAlertController.Style.alert)
                
                let okAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default)
                
                alarmAlert.addAction(okAction)
                present(alarmAlert, animated: true)
                isAlert = true
            }
        }else{
            isAlert = false
        }
    }
}

