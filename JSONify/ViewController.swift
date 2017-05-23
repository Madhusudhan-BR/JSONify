//
//  ViewController.swift
//  JSONify
//
//  Created by Madhusudhan B.R on 5/22/17.
//  Copyright © 2017 Madhusudhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let urlString = "http://jsonplaceholder.typicode.com/users"
    var names = [String]()
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
                    
                    var temp = myJSON.count
                    for i in 0..<temp!
                    {
                    if let id = myJSON[i] as? NSDictionary
                    {
                        if let name = id["name"] as? String
                        {
                            print(name)
                            self.names.append(name)
                        }
                        //print(id)
                    }
                    }
                    OperationQueue.main.addOperation {
                    self.tableView.reloadData()
                    }
                    
                }
                catch{
                    
                }
                
            }
            
            
        }

        task.resume()
    
    
}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        cell.username.text = names[indexPath.row]
        
        
        return cell
    }
}
