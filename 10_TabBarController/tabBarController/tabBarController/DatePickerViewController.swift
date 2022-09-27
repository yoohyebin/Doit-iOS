//
//  DatePickerViewController.swift
//  tabBarController
//
//  Created by 유혜빈 on 2022/09/24.
//

import UIKit

class DatePickerViewController: UIViewController {
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var selecteTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        self.selecteTimeLabel.text = ""
        
        Timer.scheduledTimer(timeInterval: 1.0,
                             target: self, selector: #selector(updateTime),
                             userInfo: nil,
                             repeats: true)
    }
    
    @objc func updateTime(){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        
        self.currentTimeLabel.text = formatter.string(from: NSDate() as Date)
    }
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        
        self.selecteTimeLabel.text = formatter.string(from: sender.date)
    }
}
