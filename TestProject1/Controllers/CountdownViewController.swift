//
//  TimerPickerVC.swift
//  TestProject1
//
//  Created by Aeia on 9/15/20.
//  Copyright © 2020 n/a. All rights reserved.
//

import AVFoundation
import Foundation
import UIKit

class CountdownViewController: UIViewController {
    
    
    @IBOutlet weak var countdownLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        

    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {

    }
    
    
    //MARK: - Navigation
    
    //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Get the new view controller using segue.destination.
        //Pass the selected object to the new view controller.
    }
    
    
    //MARK: - Timer Methods

    
    }
    

//extension CountdownViewController: CreateTimerVCDelegate {
//    func giveDuration(_ duration: Int) {
//
//        }
//    }
//
//


