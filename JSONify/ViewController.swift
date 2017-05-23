//
//  ViewController.swift
//  JSONify
//
//  Created by Madhusudhan B.R on 5/22/17.
//  Copyright © 2017 Madhusudhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let urlString = "http://jsonplaceholder.typicode.com/users"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.downloadFromUrl()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func downloadFromUrl() {
        let url = NSURL(string: urlString)
        
        let task = URLSession.shared.dataTask(with: (url as? URL)!) { (data, response, error) in
            //print(data)
            if error != nil {
                print("Error")
            }
            if let content = data {
                
                do{
                    let myJSON = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                    
                    if let id = myJSON[0]
                    {
                        print(id)
                    }
                    
                }
                catch{
                    
                }
                
            }
            
            
        }

        task.resume()
    
    
}

}
