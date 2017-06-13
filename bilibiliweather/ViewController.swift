//
//  ViewController.swift
//  bilibiliweather
//
//  Created by 林昱帆 on 7/18/16.
//  Copyright © 2016 林昱帆. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getWeatherData()
    }
    
    fileprivate func getWeatherData(){
        let path = "http://api.openweathermap.org/data/2.5/weather?q=london&appid=d6127322479ba3819ef01fe42f26d526"
        let url = URL(string: path)
        let request = URLRequest(url: url!)
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
            
            
            
        })
        task.resume()
    }
    
    fileprivate func updateUI(_ city:String,temp:String,description:String){
        cityLabel.text = city
        tempLabel.text = temp + "℃"
        descriptionLabel.text = description
    }

}

