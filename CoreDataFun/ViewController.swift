//
//  ViewController.swift
//  CoreDataFun
//
//  Created by sabina on 05/01/17.
//  Copyright © 2017 sabina. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Storing core data
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //allows as to work with core data
        let context = appDelegate.persistentContainer.viewContext
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        newUser.setValue("Sabina", forKey:"username")
        newUser.setValue("Sabina123", forKey:"password")
        
        
        do {
            try context.save() 
             print("SAVED")
        } catch {
            // PROCESS ERROR
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

