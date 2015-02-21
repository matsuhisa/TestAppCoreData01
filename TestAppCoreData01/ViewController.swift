//  ViewController.swift
//  TestAppCoreData01

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var TextFieldTitle: UITextField!
    @IBOutlet weak var TextViewBody: UITextView!
    @IBOutlet weak var ButtonSave: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        readData()
        
        // 保存
        ButtonSave.addTarget(self, action: "saveData", forControlEvents: UIControlEvents.TouchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func saveData() {
        let app: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let memoContext: NSManagedObjectContext = app.managedObjectContext!
        let memoEntity: NSEntityDescription!    = NSEntityDescription.entityForName("MemoData", inManagedObjectContext: memoContext)
        
        var newData = MemoData(entity: memoEntity, insertIntoManagedObjectContext: memoContext)
        
        newData.body  = TextViewBody.text
        newData.title = TextFieldTitle.text
        newData.created_at = NSDate()
        
        readData()
    }
    
    func readData() {
        let app: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let memoContext: NSManagedObjectContext = app.managedObjectContext!
        
        let memoRequest: NSFetchRequest = NSFetchRequest(entityName: "MemoData")
        memoRequest.returnsObjectsAsFaults = false
        var results: NSArray! = memoContext.executeFetchRequest(memoRequest, error: nil)
        

        for data in results {
            println("------------")
            println(data.title?)
            println(data.created_at?)
            println("------------")
        }

    }
    
}

