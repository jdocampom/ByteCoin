//
//  ViewController.swift
//  ByteCoin
//
//  Created by Juan Diego Ocampo on 07/11/2020.
//  Copyright © 2020 Juan Diego Ocampo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
        
// MARK: IB-Outlets
    
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
// MARK: Variables
    
    let coinManager = CoinManager()
    
// MARK: Methods

    /// Tag: viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        /// Set the ViewController class as the dataSource for the UIPicker
        currencyPicker.dataSource = self
        /// Set the ViewController class as the delegate of the currencyPicker
        currencyPicker.delegate = self
    }
    
    /// Tag: numberOfComponents()
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        /// Number of Columns in the UIPicker
        return 1
    }
    
    /// Tag: pickerView()
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        /// Number of Rows in the UIPicker
        return coinManager.currencyArray.count
    }
    
    /// Tag: titleForRow()
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        /// Ise the row Int to pick the title from our currencyArray
        return coinManager.currencyArray[row]
    }
    
    /// Tag: didSelectRow()
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        /// Pass the selected currency to the CoinManager via the getCoinPrice() method
        let selectedCurrency = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: selectedCurrency)
    }
}
