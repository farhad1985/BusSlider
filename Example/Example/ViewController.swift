//
//  ViewController.swift
//  Example
//
//  Created by Farhad Faramarzi on 4/29/20.
//  Copyright © 2020 Farhad. All rights reserved.
//

import UIKit
import BusSlider

class ViewController: UIViewController {
    
    @IBOutlet weak var bsSlider1: BusSliderView!
    @IBOutlet weak var bsSlider2: BusSliderView!
    @IBOutlet weak var bsSlider3: BusSliderView!
    
    @IBOutlet weak var lblText1: UILabel!
    @IBOutlet weak var lblText2: UILabel!
    @IBOutlet weak var lblText3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bsSlider1.onChange = { value in
            self.lblText1.text = "\(value)"
        }
        
        bsSlider2.onChange = { value in
            self.lblText2.text = "\(value)"
        }
        
        bsSlider3.onChange = { value in
            self.lblText3.text = "\(value)"
        }
        
        bsSlider1.value = 4
        bsSlider2.value = 2
        bsSlider3.value = 5

    }
    
    
}

