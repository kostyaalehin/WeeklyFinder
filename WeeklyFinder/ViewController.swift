//
//  ViewController.swift
//  WeeklyFinder
//
//  Created by Константин Алехин on 20.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var dayLabel: UILabel!
   
    @IBAction func seachAction(_ sender: UIButton) {
        
        guard let day = dayTextField.text, !day.isEmpty,
                let month = monthTextField.text, 
                let year = yearTextField.text else {
            dayLabel.text = "Ошибка"
            return
            
        }
        
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.locale = Locale(identifier: "ru_Ru")
        
        guard let date = calendar.date(from: dateComponents) else {
            dayLabel.text = "Ошибка 2"
            return
            
        }
        
        let weekday = dateFormatter.string(from: date)
        let capitalizedWeekDay = weekday.capitalized
        dayLabel.text = capitalizedWeekDay
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
}


