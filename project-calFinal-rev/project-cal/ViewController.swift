//
//  ViewController.swift
//  project-cal
//
//  Created by Kenji Akiba on 2/11/21.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var performingMath = false
    var operation = " "

    @IBOutlet weak var results: UILabel!
    
    
    @IBAction func numbers(_ sender: UIButton) {
        if let value = sender.titleLabel?.text, let valueAsDouble = Double(value), let currentValue = results.text {
            if performingMath == true {
                results.text = value
                numberOnScreen = valueAsDouble
                performingMath = false
            } else {
                results.text = currentValue + value
                numberOnScreen = valueAsDouble
            }
        }
    }
    
    
    @IBAction func equalsPressed() {
        switch operation {
        case "+":
            results.text = String(previousNumber + numberOnScreen)
        case "-":
            results.text = String(previousNumber - numberOnScreen)
        case "/":
            results.text = String(previousNumber / numberOnScreen)
        case "X":
            results.text = String(previousNumber * numberOnScreen)
        default: break
        }
    }
    
    
    @IBAction func clear() {
        results.text = " "
        previousNumber = 0
        numberOnScreen = 0
        operation = " "
    }
    
    @IBAction func calculatingButtos(_ sender: UIButton) {
        if let prevNumber = results.text, let prevNumberAsDouble = Double(prevNumber), let op =
            sender.titleLabel?.text {
            operation = op
            previousNumber = prevNumberAsDouble
            results.text = op
            performingMath = true
        }
    }
        
        override func viewDidLoad() {
        super.viewDidLoad()
    }


}

