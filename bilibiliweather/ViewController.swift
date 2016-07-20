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
    @IBAction func setCityButtonTapped(sender: AnyObject) {
        let alert = UIAlertController(title: "Set City",message: nil,preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Cancel",style: .Cancel,handler: nil))
        alert.addAction(UIAlertAction(title: "ok",style: .Default,handler: {(action) in
            if let tf =  alert.textFields?.first{
                if let cityName = tf.text{
                    self.getWeatherData(cityName)
                }
            }
            
        }))
        alert.addTextFieldWithConfigurationHandler{(tf) in
            tf.placeholder = "enter you city  name here"
        }
        self.presentViewController(alert, animated: true, completion: nil)
        
    }

    
    private func getWeatherData(city:String){
    //todo
        //mypath d6127322479ba3819ef01fe42f26d526
    
        let cityName = city.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())
        let path = "http://api.openweathermap.org/data/2.5/weather?q=\(cityName!)&appid=d6127322479ba3819ef01fe42f26d526"
        let url = NSURL(string:path)
        let request = NSURLRequest(URL:url!)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request){(data,response,error)in
            if error == nil{
                let json = JSON(data:data!)
                let name = json["name"].string!
                let temp = json["main"]["temp"].double! - 273.15
                let description = json["weather"][0]["description"].string!
                
                dispatch_sync(dispatch_get_main_queue(), {
                    self.updateUI(name, temp: temp, description: description)
                })
                print("done!")
            }else{
            print(error)
            }
            
        }
    task.resume()
        
        
        
    }
    
    private func updateUI(city:String,temp:Double,description:String){
        cityLabel.text = city
        tempLabel.text = String(temp) + "c"
        descriptionLabel.text = description
        
    
    
    }

}

