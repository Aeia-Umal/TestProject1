//
//  CreateTimerVC.swift
//  TestProject1
//
//  Created by Aeia on 8/18/20.
//  Copyright © 2020 n/a. All rights reserved.
//

import UIKit
import Foundation

class CreateTimerViewController: UIViewController {
    
    @IBOutlet weak var doneBTN: UIButton!
    @IBOutlet weak var startPauseResumeBTN: UIButton!
    @IBOutlet weak var resetBTN: UIButton!
    
    @IBOutlet weak var countdownLabel: UILabel!
    
    @IBOutlet weak var timePickerView: UIPickerView!
    
    var secondsPassed = 0
    var duration = 0
    
    var timer = Timer()
    
    let hoursRange = Array(1...24)
    let minutesRange = Array(1...60)
    let secondsRange = Array(1...60)
    
    var hoursValue = [0]
    var minutesValue = [0]
    var secondsValue = [0]
    
    var hours = 0
    var minutes = 0
    var seconds = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timePickerView.delegate = self
        timePickerView.dataSource = self
        
    }
    
    
    //MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    @IBAction func didTapDoneBTN(_ sender: UIButton) {
        cancelTimer()
    }
    
    @IBAction func didTapStartPauseResumeBTN(_ sender: UIButton) {
        startTimer()
        
    }
    
    @IBAction func didTapResetBTN(_ sender: UIButton) {
        startTimer()
    }
    
}


//MARK: - UIPickerViewMethods

extension CreateTimerViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return hoursRange.count
        case 1:
            return minutesRange.count
        case 2:
            return secondsRange.count
        default:
            return 0
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch component {
        case 0:
            return String(row)
        case 1:
            return String(row)
        case 2:
            return String(row)
        default:
            return String(row)
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel()
        label.text = String(row)
        label.textAlignment = .center
        return label
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if let label = pickerView.view(forRow: row, forComponent: component) as? UILabel {
            
            if component == 0, row > 1 {
                label.text = String(row) + " hours"
            }
            else if component == 0 {
                label.text = String(row) + " hour"
            }
            else if component == 1 {
                label.text = String(row) + " min"
            }
            else if component == 2 {
                label.text = String(row) + " sec"
            }
        }
        
        if component == 0 {
            if hoursValue.isEmpty {
                hoursValue.append(row)
                print("Value \(hoursValue[0]) stored as hours")
            } else {
                hoursValue[0] = row
                print("Value \(hoursValue[0]) stored as hours")
            }
        } else if component == 1 {
            if minutesValue.isEmpty {
                minutesValue.append(row)
                print("Value \(minutesValue[0]) stored as minutes")
            } else {
                minutesValue[0] = row
                print("Value \(minutesValue[0]) stored as minutes")
            }
        } else {
            if secondsValue.isEmpty {
                secondsValue.append(row)
                print("Value \(secondsValue[0]) stored as seconds")
            } else {
                secondsValue[0] = row
                print("Value \(secondsValue[0]) stored as seconds")
            }
        }
    }
    
    
    func cancelTimer() {
        timer.invalidate()
        print("timer cancelled")
    }
    
    func startTimer() {
        timer.invalidate()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(setTimerDuration), userInfo: nil, repeats: true)
    }
    
    
    func getDuration() -> Int {
        hours = (hoursValue[0]) * 3600
        minutes = (minutesValue[0]) * 60
        seconds = (secondsValue[0])
        
        var duration = hours + minutes + seconds
        
        return duration
        
    }
    
    @objc func setTimerDuration() {
    
    duration = getDuration()
    
    if secondsPassed < duration {
        secondsPassed += 1
        
        countdownLabel.text = String(duration - secondsPassed)
        
    } else {
        
        countdownLabel.text = "done!"
        
    }
    
}



}
