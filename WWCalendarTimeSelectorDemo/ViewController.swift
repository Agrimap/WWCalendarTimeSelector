//
//  ViewController.swift
//  WWCalendarTimeSelectorDemo
//
//  Created by Weilson Wonder on 21/4/16.
//  Copyright © 2016 Wonder. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WWCalendarTimeSelectorProtocol {
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBAction func showPicker(sender: UIButton) {
        let picker = WWCalendarTimeSelector.instantiate()
        
        switch sender.tag {
        case 1:
            picker.optionPickerStyle = [.Date]
        case 2:
            picker.optionPickerStyle = [.Year]
        case 3:
            picker.optionPickerStyle = [.Time]
        case 4:
            picker.optionPickerStyle = [.Date, .Year]
        case 5:
            picker.optionPickerStyle = [.Year, .Time]
        case 6:
            picker.optionPickerStyle = [.Date, .Time]
        default:
            picker.optionPickerStyle = [.Date, .Year, .Time]
        }
        picker.delegate = self
        if let t = dateLabel.text {
            if let date = t.dateFromFormat("d' 'MMMM' 'yyyy', 'h':'mma") {
                picker.optionCurrentDate = date
            }
        }
        presentViewController(picker, animated: true, completion: nil)
    }
    
    func WWCalendarTimeSelectorDone(selector: WWCalendarTimeSelector, date: NSDate) {
        dateLabel.text = date.stringFromFormat("d' 'MMMM' 'yyyy', 'h':'mma")
    }
}
