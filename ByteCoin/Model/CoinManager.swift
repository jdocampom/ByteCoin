//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Juan Diego Ocampo on 07/11/2020.
//  Copyright © 2020 Juan Diego Ocampo. All rights reserved.
//

import Foundation

struct CoinManager {
    
// MARK: Variables
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "03BD8C37-3C94-4EBD-9C18-733922A9F9EF"
    let currencyArray = ["AUD", "BRL","CAD","CNY","COP","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
// MARK: Methods
    
    /// Tag: getCoinPrice()
    func getCoinPrice(for currency: String) {
        /// Use String concatenation to add the selected currency at the end of the baseURL along with the API key
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        /// Use Pptional Binding to unwrap the URL that's created from the urlString
        if let url = URL(string: urlString) {
        /// Create a new URLSession object with default configuration
            let session = URLSession(configuration: .default)
        /// Create a new data task for the URLSession
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
        /// Format the data we got back as a string to be able to print it.
                let dataAsString = String(data: data!, encoding: .utf8)
                print(dataAsString)
            }
        /// Start task to fetch data from bitcoin average's servers.
            task.resume()
        }
    }
    
    /// Tag: parseJSON()
    func parseJSON(_ data: Data) -> Double? {
        /// Create a JSONDecoder
        let decoder = JSONDecoder()
        do {
        /// Try to decode the data using the CoinData structure
            let decodedData = try decoder.decode(CoinData.self, from: data)
        /// Get the last property from the decoded data
            let lastPrice = decodedData.rate
            print(lastPrice)
            return lastPrice
        } catch {
        /// Catch and print any errors.
            print(error)
            return nil
        }
    }
}
