//
//  ViewController.swift
//  MiraclePills
//
//  Created by Ravi Pinamacha on 7/5/17.
//  Copyright © 2017 Ravi Pinamacha. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

   
   
   
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var streetTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var zipcodeTextField: UITextField!
    @IBOutlet weak var statePickerButton: UIButton!
    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var buyNowButton: UIButton!
    
    
    
    let states = [ "AK - Alaska",
                   "AL - Alabama",
                   "AR - Arkansas",
                   "AS - American Samoa",
                   "AZ - Arizona",
                   "CA - California",
                   "CO - Colorado",
                   "CT - Connecticut",
                   "DC - District of Columbia",
                   "DE - Delaware",
                   "FL - Florida",
                   "GA - Georgia",
                   "GU - Guam",
                   "HI - Hawaii",
                   "IA - Iowa",
                   "ID - Idaho",
                   "IL - Illinois",
                   "IN - Indiana",
                   "KS - Kansas",
                   "KY - Kentucky",
                   "LA - Louisiana",
                   "MA - Massachusetts",
                   "MD - Maryland",
                   "ME - Maine",
                   "MI - Michigan",
                   "MN - Minnesota",
                   "MO - Missouri",
                   "MS - Mississippi",
                   "MT - Montana",
                   "NC - North Carolina",
                   "ND - North Dakota",
                   "NE - Nebraska",
                   "NH - New Hampshire",
                   "NJ - New Jersey",
                   "NM - New Mexico",
                   "NV - Nevada",
                   "NY - New York",
                   "OH - Ohio",
                   "OK - Oklahoma",
                   "OR - Oregon",
                   "PA - Pennsylvania",
                   "PR - Puerto Rico",
                   "RI - Rhode Island",
                   "SC - South Carolina",
                   "SD - South Dakota",
                   "TN - Tennessee",
                   "TX - Texas",
                   "UT - Utah",
                   "VA - Virginia",
                   "VI - Virgin Islands",
                   "VT - Vermont",
                   "WA - Washington", 
                   "WI - Wisconsin", 
                   "WV - West Virginia", 
                   "WY - Wyoming"]
    override func viewDidLoad() {
        super.viewDidLoad()
       statePicker.dataSource = self
       statePicker.delegate = self
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    @IBAction func stateButtonPressed(_ sender: Any) {
        statePicker.isHidden = false
        appearence(hide: true)
        
    }
    
    func appearence(hide: Bool){
        if hide {
            fullNameTextField.isHidden = true
            streetTextField.isHidden = true
            cityTextField.isHidden = true
            countryTextField.isHidden =  true
            zipcodeTextField.isHidden = true
            
        } else {
            fullNameTextField.isHidden = false
            streetTextField.isHidden = false
            cityTextField.isHidden = false
            countryTextField.isHidden =  false
            zipcodeTextField.isHidden = false
        }
    
    }
    func checkTextField() -> Bool {
        if fullNameTextField.text != "" &&
            streetTextField.text != "" &&
            cityTextField .text != "" &&
            countryTextField.text != "" &&
            zipcodeTextField .text != "" {
            return true
        }else {
            return false
        }
    }
    
    func clearTextFields() {
        fullNameTextField.text = ""
        streetTextField.text = ""
        cityTextField.text = ""
        countryTextField.text =  ""
        zipcodeTextField.text = ""
    }
    @IBAction func savePressed(_ sender: Any) {
        if checkTextField() {
            let successVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Success") as! SuccessViewController
            self.addChildViewController(successVC)
            successVC.view.frame = self.view.frame
            self.view.addSubview(successVC.view)
            successVC.didMove(toParentViewController: self)
            self.view.endEditing(true)
            clearTextFields()
        } else {
            let errorVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Error") as! ErrorViewController
            self.addChildViewController(errorVC)
            errorVC.view.frame = self.view.frame
            self.view.addSubview(errorVC.view)
            errorVC.didMove(toParentViewController: self)
        }
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        statePickerButton.setTitle(states[row], for: UIControlState.normal) // UIControlState.normal or use //UIControlState()
        statePicker.isHidden = true
         appearence(hide: false)
       
    }
    
}

