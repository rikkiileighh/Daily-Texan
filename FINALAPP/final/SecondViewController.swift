//
//  SecondViewController.swift
//  final
//
//  Created by Yanez, Rikki L on 4/29/19.
//  Copyright © 2019 com.rikkiyanez. All rights reserved.
//

import UIKit
import FirebaseDatabase

var selection:Int = 0
var postData = [[String: String]]()

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{

    var ref:DatabaseReference?
    var databaseHandle:DatabaseHandle?
    
    
    
    
    @IBOutlet weak var theNews: UITableView!
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")
        cell?.textLabel?.text = (postData[indexPath.row]["subject"] as! String)
        return cell!
    }

    //add to original View Controller
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selection = indexPath.row
        performSegue(withIdentifier: "TheSegue", sender: self)
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        theNews.delegate = self
        theNews.dataSource = self
        postData = [[String: String]]()
        ref=Database.database().reference()
        
        ref?.child("News").observe(.childAdded, with:  {
            (snapshot) in
            //let post = snapshot.value as? String
            //var dictionary: [String:String]
            //for child in snapshot.children {
            let post = snapshot.value
            postData.append(post as! [String : String])
            self.theNews.reloadData()
        })
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
