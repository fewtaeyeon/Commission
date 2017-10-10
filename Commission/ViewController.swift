//
//  ViewController.swift
//  Commission
//
//  Created by user on 10/10/2560 BE.
//  Copyright © 2560 May. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var totalLock: UITextField!
    @IBOutlet weak var totalStock: UITextField!
    @IBOutlet weak var totalBarrel: UITextField!
    @IBOutlet weak var viewResult: UITextView!
    
    let lockPrice = 45.0
    let stockPrice = 30.0
    let barrelPrice = 25.0
    
    var totalSales = 0.0
    
    @IBAction func CommissionCalculate(_ sender: Any) {
        let lockSales = Double(totalLock.text!)! * lockPrice
        let stockSales = Double(totalStock.text!)! * stockPrice
        let barrelSales = Double(totalBarrel.text!)! * barrelPrice
        
        totalLock.resignFirstResponder()
        totalStock.resignFirstResponder()
        totalBarrel.resignFirstResponder()
        
        if (Double(totalLock.text!)! < 1) || (Double(totalStock.text!)! < 1) || (Double(totalBarrel.text!)! < 1) {
            viewResult.text = ComissionResult(totalSales: totalSales)
        } else {
            totalSales = lockSales + stockSales + barrelSales
            viewResult.text = ComissionResult(totalSales: totalSales)
        }
        
    }
    
    
    @IBAction func clear(_ sender: Any) {
        totalLock.text = ""
        totalStock.text = ""
        totalBarrel.text = ""
        viewResult.text = ""
        totalLock.resignFirstResponder()
        totalStock.resignFirstResponder()
        totalBarrel.resignFirstResponder()
    }
    
    func ComissionResult(totalSales : Double) -> String {
        var result : String = "Total sales: \(totalSales) \n"
        var commission = 0.0
        var difference = 0.0
        
        if totalSales == 0 {
            result = "No comission for this month.\n"
        }
        if totalSales < 1000.0 {
            commission = totalSales * 0.1
            result += "Commission is $ \(commission)"
        } else if totalSales <= 1800.0 {
            difference = totalSales - 1000.0
            commission = difference * 0.15 + 100
            result += "Commission is $ \(commission)"
        } else if totalSales > 1800.0 {
            difference = totalSales - 1800.0
            commission = difference * 0.2 + 220
            result += "Commission is $ \(commission)"
        }
        return result
    }
   
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        self.viewResult.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

