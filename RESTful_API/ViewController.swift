//
//  ViewController.swift
//  RESTful_API
//
//  Created by Naveen Varma on 2022-01-08.
//  Copyright © 2022 naveen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let parser = Parser()
    
    var datum = [Datum]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parser.parse{
            data in
            self.datum = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        tableView.dataSource = self
        tableView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datum.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableVIewCell", for: indexPath)
        cell.textLabel?.text = "Nation: \(datum[indexPath.row].nation), Year: \(datum[indexPath.row].year)"
        return cell
    }
    
    
}
