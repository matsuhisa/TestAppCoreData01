//  Memo.swift
//  TestAppCoreData01

import UIKit
import CoreData

@objc(MemoData)

class MemoData: NSManagedObject {
    @NSManaged var title:String
    @NSManaged var body:String
    @NSManaged var created_at:NSDate
}
