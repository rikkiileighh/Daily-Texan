//
//  ViewController.swift
//  final
//
//  Created by Yanez, Rikki L on 4/29/19.
//  Copyright © 2019 com.rikkiyanez. All rights reserved.
//

import UIKit
import FirebaseDatabase


class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate
{
var selection = "News"
    //    var selection:String!
    
    @IBOutlet weak var theTopic: UILabel!
    let items = ["News", "Events"]
   

    @IBOutlet weak var picker: UIPickerView!
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selection = items[row]
    }
    
    
    @IBAction func myButton(_ sender: Any) {
        if (selection == "News"){
            performSegue(withIdentifier: "NewsSegue", sender: self)
        }
        
        if (selection == "Events"){
         performSegue(withIdentifier: "EventsSegue", sender: self)
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }


}

