//
//  ViewController.swift
//  PersistenceChallenge
//
//  Created by Bobb Darnell on 5/2/18.
//  Copyright © 2018 MobileMakersEdu. All rights reserved.
//

import UIKit

class StoreViewController: UIViewController {

    @IBOutlet weak var integerTextField: UITextField!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var arrayTextField1: UITextField!
    @IBOutlet weak var arrayTextField2: UITextField!
    @IBOutlet weak var arrayTextField3: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveInteger(_ sender: UIButton) {
        /***************************************************
         * Start Your Code Here For MVP
         ***************************************************/
        let defaults = UserDefaults.standard
        if let text = integerTextField.text {
            if let number = Int(text) {
                defaults.set(number, forKey: "Integer")
            }
        }
        /***************************************************
         * End Your Code Here For MVP
         ***************************************************/
        integerTextField.resignFirstResponder()
    }
    
    @IBAction func saveUrl(_ sender: UIButton) {
        /***************************************************
         * Start Your Code Here For Stretch #1
         ***************************************************/
        let defaults = UserDefaults.standard
        if let text = urlTextField.text {
            if let url = URL(string: text) {
                defaults.set(url, forKey: "URL")
            }
        }
        /***************************************************
         * End Your Code Here For Stretch #1
         ***************************************************/
        urlTextField.resignFirstResponder()
    }
    
    @IBAction func saveArray(_ sender: UIButton) {
        /***************************************************
         * Start Your Code Here For Stretch #2
         ***************************************************/
        let defaults = UserDefaults.standard
        if let array1 = arrayTextField1.text, let array2 = arrayTextField2.text, let array3 = arrayTextField3.text, let number1 = Int(array1), let number2 = Int(array2), let number3 = Int(array3) {
            let array = [number1, number2, number3]
            defaults.set(array, forKey: "Array")
        }
        /***************************************************
         * End Your Code Here For Stretch #2
         ***************************************************/
        arrayTextField1.resignFirstResponder()
        arrayTextField2.resignFirstResponder()
        arrayTextField3.resignFirstResponder()
    }
    
    @IBAction func saveClass(_ sender: UIButton) {
        /***************************************************
         * Start Your Code Here For Stretch #3
         ***************************************************/
        let defaults = UserDefaults.standard
        if let name = nameTextField.text, let age = ageTextField.text, let phone = phoneTextField.text {
            if let age = Int(age) {
                let contact = Contact(name: name, age: age, phoneNumber: phone)
                if let encoded = try? JSONEncoder().encode(contact) {
                    defaults.set(encoded, forKey: "Class")
                }
                else {
                    print("Encoding Failed")
                }
            }
        }
        
        /***************************************************
         * End Your Code Here For Stretch #3
         ***************************************************/
        nameTextField.resignFirstResponder()
        ageTextField.resignFirstResponder()
        phoneTextField.resignFirstResponder()
    }
}

