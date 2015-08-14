//
//  Message.swift
//  TemplateProject
//
//  Created by Jahvon on 8/5/15.
//  Copyright (c) 2015 Make School. All rights reserved.
//

//import Foundation
//import Parse
//
//class Message: PFObject, PFSubclassing {
//
//    @NSManaged var message: String?
//    @NSManaged var user: PFUser?
//    @NSManaged var location: PFGeoPoint?
//    @NSManaged var  imageFile: PFFile?
//    @NSManaged var videoFile: PFFile?
//    
//    override init() {
//        super.init()
//    }
//    
//    static func parseClassName() -> String {
//        return "Message"
//    }
//    
//    override class func initialize() {
//        var onceToken : dispatch_once_t = 0
//        dispatch_once(&onceToken) {
//            //Parse is being told about this class
//            self.registerSubclass()
//        }
//    }
//
//        }
//
//
