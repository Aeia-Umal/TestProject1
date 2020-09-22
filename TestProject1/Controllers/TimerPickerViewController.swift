//
//  TimerPickerVC.swift
//  TestProject1
//
//  Created by Aeia on 9/15/20.
//  Copyright © 2020 n/a. All rights reserved.
//

import AVFoundation
//import CircleProgressView
import Foundation
import UIKit

class TimerPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet weak var timePickerView: UIPickerView!
    
    var timer = Timer()
    
    var duration = 0
    
    var secondsPassed = 0
    
    var row = 0
    var component = 0
    
    let hoursRange = Array(1...24)
    let minutesRange = Array(1...60)
    let secondsRange = Array(1...60)
    
    var hoursValue = [0]
    var minutesValue = [0]
    var secondsValue = [0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timePickerView.dataSource = self
        timePickerView.delegate = self
    }
    
    //MARK: - Navigation
    
    //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Get the new view controller using segue.destination.
        //Pass the selected object to the new view controller.
    }
    
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
        
        func getValues() {
            if component == 0 {
                if hoursValue.isEmpty {
                    hoursValue.append(row)
                    print(hoursValue)
                } else {
                    hoursValue[0] = row
                    print(hoursValue)
                }
            } else if component == 1 {
                if minutesValue.isEmpty {
                    minutesValue.append(row)
                    print(minutesValue)
                } else {
                    minutesValue[0] = row
                    print(minutesValue)
                }
            } else {
                if secondsValue.isEmpty {
                    secondsValue.append(row)
                    print(secondsValue)
                } else {
                    secondsValue[0] = row
                    print(secondsValue)
                }
            }
            
        }
    }
    
    func cancelTimer() {
        timer.invalidate()
        print("timer cancelled")
    }
    
    func startTimer() {
        timer.invalidate()
        secondsPassed = 0
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(setTimerDuration), userInfo: nil, repeats: true)
    }
    
    
    @objc func setTimerDuration() {
        
        // getValues()
        
        print(hoursValue[0])
        print(minutesValue[0])
        print(secondsValue[0])
        
        let hours = (hoursValue[0]) * 3600
        let minutes = (minutesValue[0]) * 60
        let seconds = (secondsValue[0])
        
        let timerDuration = hours + minutes + seconds
        
        duration = timerDuration
        
        print(secondsPassed)
        
        if secondsPassed < duration {
            secondsPassed += 1
        } else {
            timer.invalidate()
            print("done")
        }
    }
}
