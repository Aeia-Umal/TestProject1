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
    
    @IBOutlet weak var containerView: UIView!
    
    var timePickerVC = TimerPickerViewController()
    
    var timer = Timer()
    
    
    @IBOutlet weak var firstBTN: UIButton!
    @IBOutlet weak var secondBTN: UIButton!
    @IBOutlet weak var thirdBTN: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
//        if segue.identifier == Segues.toTimerPickerVC {
//
//        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    
    @IBAction func didTapFirstBTN(_ sender: UIButton) {
        timePickerVC.cancelTimer()
        // FirstBTN = done/cancel button
    }
    
    @IBAction func didTapSecondBTN(_ sender: UIButton) {
        timePickerVC.startTimer()
    }
    
    @IBAction func didTapThirdBTN(_ sender: UIButton) {
        // ThirdBTN = reset button
    }
}
