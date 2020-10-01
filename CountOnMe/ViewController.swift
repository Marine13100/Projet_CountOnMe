//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    let calculator = Calculator()
    
    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        calculator.calculatorDisplayDelegate = self
    }
    
    
    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        calculator.tappedNumberButton(numberText: numberText)
        
    }
    
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        calculator.tappedAdditionButton()
    }
    
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        calculator.tappedSubstractionButton()
    }
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        calculator.tappedAdditionButton()
    }
    
}

extension ViewController: CalculatorDisplay {
    func updateCalcul(calculText: String) {
        textView.text = calculText
    }
    
    func showAlert(message: String) {
        let alertVC = UIAlertController(title: "Zéro!", message:message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
    
    
}
