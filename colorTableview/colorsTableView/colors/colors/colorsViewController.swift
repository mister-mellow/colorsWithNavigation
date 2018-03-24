//
//  colorsViewController.swift
//  colors
//
//  Created by Eric Rachell on 3/16/18.
//  Copyright © 2018 Eric Rachell. All rights reserved.
//

import UIKit

class colorsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
   // var colors = ["Red", "Orange", "Yellow", "Green", "Blue", "Purple", "Brown"]

    var colors = [Color(name: "red",    UIcolor:    UIColor.red),
                  Color(name: "orange", UIcolor: UIColor.orange),
                  Color(name: "yellow", UIcolor: UIColor.yellow),
                  Color(name: "green",  UIcolor:  UIColor.green),
                  Color(name: "blue",   UIcolor:   UIColor.blue),
                  Color(name: "purple", UIcolor: UIColor.purple),
                  Color(name: "brown",  UIcolor:  UIColor.brown)]
    
    
    @IBOutlet weak var colorsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        
        cell.textLabel?.text = colors[indexPath.row].name
        cell.backgroundColor = colors[indexPath.row].UIcolor
        cell.selectionStyle = .none
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.isSelected = false
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ColorDetailViewController,
           let row=colorsTableView.indexPathForSelectedRow?.row{
          destination.color = colors[row]
        }
    }
}
