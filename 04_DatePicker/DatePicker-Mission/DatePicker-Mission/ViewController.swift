//
//  ViewController.swift
//  DatePicker-Mission
//
//  Created by 유혜빈 on 2022/09/28.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var selectedTimeLabel: UILabel!
    
    var alarmTime:String = ""
    
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
            view.backgroundColor = UIColor.red
        }else{
            view.backgroundColor = UIColor.white
        }
    }
    
}

