//
//  ViewController.swift
//  Audio
//
//  Created by 유혜빈 on 2022/09/26.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var recordTimeLabel: UILabel!
    
    @IBOutlet weak var imgView: UIImageView!
    
    var audioPlayer: AVAudioPlayer!
    var audioFile: URL!
    var progressTimer: Timer!
    
    var audioRecorder: AVAudioRecorder!
    var isRecordMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectAudioFile()
    }
    
    func selectAudioFile(){
        if !isRecordMode{
            audioFile = Bundle.main.url(forResource: "Sicilian_Breeze", withExtension: "mp3")
            initPlay()
            self.recordButton.isEnabled = false
            self.recordTimeLabel.isEnabled = false
        }else{
            let documentDirectory = FileManager.default.urls(for: .documentDirectory,
                                                             in: .userDomainMask)[0]
            audioFile = documentDirectory.appendingPathComponent("recordFile.m4a")
            
            initRecord()
        }
    }
    
    func initPlay(){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: audioFile)
        }catch let error as NSError{
            print("Error")
        }
        self.volumeSlider.maximumValue = 10.0
        self.volumeSlider.value = 1.0
        self.progressView.progress = 0
        
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()
        audioPlayer.volume = self.volumeSlider.value
        
        self.endTimeLabel.text = convertNSTimeIntervalToString(audioPlayer.duration)
        self.currentTimeLabel.text = convertNSTimeIntervalToString(0)
        
        setButton(play: true, pause: false, stop: false)
        self.imgView.image = UIImage(named: "stop.png")
    }
    
    func initRecord(){
        let recordSettings = [
            AVFormatIDKey: NSNumber(value: kAudioFormatAppleLossless as UInt32),
            AVEncoderAudioQualityKey: AVAudioQuality.max.rawValue,
            AVEncoderBitRateKey: 32000,
            AVNumberOfChannelsKey: 2,
            AVSampleRateKey: 44100.0] as [String: Any]
        
        do{
            audioRecorder = try AVAudioRecorder(url: audioFile, settings: recordSettings)
        }catch let error as NSError{
            print("Error")
        }
        
        audioRecorder.delegate = self
        
        self.volumeSlider.value = 1.0
        self.audioPlayer.volume = self.volumeSlider.value
        self.endTimeLabel.text = convertNSTimeIntervalToString(0)
        self.currentTimeLabel.text = convertNSTimeIntervalToString(0)
        
        setButton(play: false, pause: false, stop: false)
        
        let session = AVAudioSession.sharedInstance()
        do{
            try AVAudioSession.sharedInstance().setCategory(.playAndRecord, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        }catch let error as NSError{
            print("Error")
        }
        
        do{
            try session.setActive(true)
        }catch let error as NSError{
            print("Error")
        }
    }
    
    func convertNSTimeIntervalToString(_ time: TimeInterval) -> String{
        let min = Int(time/60)
        let sec = Int(time.truncatingRemainder(dividingBy: 60))
        let strTime = String(format: "%02d:%02d", min, sec)
        return strTime
    }
    
    func setButton(play: Bool, pause: Bool, stop: Bool){
        self.playButton.isEnabled = play
        self.pauseButton.isEnabled = pause
        self.stopButton.isEnabled = stop
    }

    @IBAction func tapPlayButton(_ sender: UIButton) {
        audioPlayer.play()
        setButton(play: false, pause: true, stop: true)
        
        progressTimer = Timer.scheduledTimer(timeInterval: 0.1,
                                             target: self,
                                             selector: #selector(updateTime),
                                             userInfo: nil,
                                             repeats: true)
        
        self.imgView.image = UIImage(named: "play.png")
    }
    @IBAction func tapPauseButton(_ sender: UIButton){
        audioPlayer.pause()
        setButton(play: true, pause: false, stop: true)
        self.imgView.image = UIImage(named: "pause.png")
    }
    
    @IBAction func tapStopButton(_ sender: UIButton) {
        audioPlayer.stop()
        setButton(play: true, pause: false, stop: false)
        
        audioPlayer.currentTime = 0
        self.currentTimeLabel.text = convertNSTimeIntervalToString(0)
        progressTimer.invalidate()
        self.imgView.image = UIImage(named: "stop.png")
    }
    
    @IBAction func changeVolume(_ sender: UISlider) {
        audioPlayer.volume = self.volumeSlider.value
    }
    
    @IBAction func recordModeSwitch(_ sender: UISwitch){
        if sender.isOn{
            audioPlayer.stop()
            audioPlayer.currentTime = 0
            
            self.recordTimeLabel.text = convertNSTimeIntervalToString(0)
            isRecordMode = true
            self.recordButton.isEnabled = true
            self.recordTimeLabel.isEnabled = true
        }else{
            isRecordMode = false
            self.recordButton.isEnabled = false
            self.recordTimeLabel.isEnabled = false
            self.recordTimeLabel.text = convertNSTimeIntervalToString(0)
        }
        selectAudioFile()
    }
    
    @IBAction func tapRecordButton(_ sender: UIButton) {
        if (sender as AnyObject).titleLabel?.text == "Record"{
            audioRecorder.record()
            (sender as AnyObject).setTitle("Stop", for: UIControl.State())
            
            progressTimer = Timer.scheduledTimer(timeInterval: 0.1,
                                                 target: self,
                                                 selector: #selector(updateRecordTime),
                                                 userInfo: nil,
                                                 repeats: true)
            self.imgView.image = UIImage(named: "record.png")
        }else{
            audioRecorder.stop()
            progressTimer.invalidate()
            (sender as AnyObject).setTitle("Record", for: UIControl.State())
            self.playButton.isEnabled = true
            initPlay()
            self.imgView.image = UIImage(named: "stop.png")
        }
    }
    
    @objc func updateTime(){
        self.currentTimeLabel.text = convertNSTimeIntervalToString(audioPlayer.currentTime)
        self.progressView.progress = Float(audioPlayer.currentTime/audioPlayer.duration)
    }
    
    @objc func updateRecordTime(){
        self.recordTimeLabel.text = convertNSTimeIntervalToString(audioRecorder.currentTime)
    }
}

extension ViewController: AVAudioPlayerDelegate, AVAudioRecorderDelegate{
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        self.progressTimer.invalidate()
        self.setButton(play: true, pause: false, stop: false)
    }
}
