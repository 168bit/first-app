//
//  ViewController.swift
//  UITest1
//
//  Created by iMac-adminitDB on 2/20/16.
//  Copyright © 2016 iMac-adminitDB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func loginClicked(sender : AnyObject) {
        print("click")
        data_request()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    func data_request()
    {
        let url:NSURL = NSURL(string: "https://db.thebrowncoffee.com/brownapp/api/v4/login.json")!
        let session = NSURLSession.sharedSession()
        
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringCacheData
        
        let paramString = "email=sarithloek@gmail.com,password=amokyear"
        request.HTTPBody = paramString.dataUsingEncoding(NSUTF8StringEncoding)
        
        let task = session.dataTaskWithRequest(request) {
            (
            let data, let response, let error) in
            
            guard let _:NSData = data, let _:NSURLResponse = response  where error == nil else {
                print("error")
                return
            }
            
            let dataString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            
            print(dataString)
            
        }
        
        task.resume()
        
    }
}

