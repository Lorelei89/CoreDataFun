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

    
    var passWordArray:[String] = []
    var usernameArray:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Storing core data
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        //allows as to work with core data
        let context = appDelegate.persistentContainer.viewContext
//        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
//        newUser.setValue("Sorina", forKey:"username")
//        newUser.setValue("Sorina123", forKey:"password")
//
//        do {
//            try context.save() 
//             print("SAVED")
//        } catch {
//            // PROCESS ERROR
//        }
//        
        //if you don't want to repeat for 4 time the same stepts with different users we do like that
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName:"Users")
        request.returnsObjectsAsFaults = false
        
        do {
            //put data into core data
            let results = try context.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject]{
                    if let username = result.value(forKey: "username")  as? String {
                        //USERNAME
                       // print(username)
                        usernameArray.append(username)
                    }
                    if let password = result.value(forKey: "password")  as? String {
                        //PASSWORD
                      //  print(password)
                        passWordArray.append(password)
                    }
                }
            }
            print(passWordArray)
            print(usernameArray)
            //print("SAVED")
        } catch {
            // PROCESS ERROR
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

