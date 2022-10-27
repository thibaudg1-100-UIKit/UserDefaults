//
//  ViewController.swift
//  Project12
//
//  Created by RqwerKnot on 17/10/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        
        defaults.set(25, forKey: "Age")
        defaults.set(true, forKey: "UseTouchID")
        defaults.set(CGFloat.pi, forKey: "Pi")
        
        defaults.set("Paul Hudson", forKey: "Name")
        defaults.set(Date(), forKey: "LastRun")
        
        let array = ["Hello", "World"]
        defaults.set(array, forKey: "SavedArray")

        let dict = ["Name": "Paul", "Country": "UK"]
        defaults.set(dict, forKey: "SavedDict")
        
        /*
         When you're reading values from UserDefaults you need to check the return type carefully to ensure you know what you're getting. Here's what you need to know:

             integer(forKey:) returns an integer if the key existed, or 0 if not.
             bool(forKey:) returns a boolean if the key existed, or false if not.
             float(forKey:) returns a float if the key existed, or 0.0 if not.
             double(forKey:) returns a double if the key existed, or 0.0 if not.
             object(forKey:) returns Any? so you need to conditionally typecast it to your data type.

         */
        
        let savedInteger = defaults.integer(forKey: "Age")
        let savedBool = defaults.bool(forKey: "UseTouchID")
        let savedFloat = defaults.float(forKey: "Pi")
        
        
        let savedString = defaults.string(forKey: "Name") ?? ""
        
        let savedDate = defaults.object(forKey: "LastRun") as? Date ?? Date() // fallback on a sensible default to avoid having an optional
        
        
        
        let savedArray = defaults.object(forKey: "SavedArray") as? [String] ?? [String]()
        
        let savedDict = defaults.object(forKey: "SavedDict") as? [String: String] ?? [String: String]()
        
        // alternatively:
        
        let savedArray2 = defaults.stringArray(forKey: "SavedArray") ?? [] // but only for array of String
        
        let savedDict2 = defaults.dictionary(forKey: "SavedDict") ?? [:] // but only works for dictionnary whose key type is String, and the value are of type Any, meaning additional typecasting likely to be needed for the dictionnary to be useful
        
    }


}

