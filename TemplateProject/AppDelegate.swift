//
//  AppDelegate.swift
//  Template Project
//
//  Created by Benjamin Encz on 5/15/15.
//  Copyright (c) 2015 Make School. All rights reserved.
//

import UIKit
import Parse
import ParseUI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
    
    
    

    

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    
    let navbar = UINavigationBar.appearance()
    navbar.barTintColor = UIColor(red:1.00, green:0.86, blue:0.29, alpha:1.0)
    let font = UIFont(name: "Avenir", size: 18)
    navbar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor(), NSFontAttributeName: font!]
    navbar.tintColor = UIColor (red:1.00, green:0.45, blue:0.18, alpha:1.0 )    
    
    let tabbar = UITabBar.appearance()
    tabbar.barTintColor = UIColor(red:1.00, green:0.86, blue:0.29, alpha:1.0)
    tabbar.tintColor = UIColor(red:1.00, green:0.45, blue:0.18, alpha:1.0 )
    
    
    

    Parse.setApplicationId("hBEgX6mo7Tku4fYFsXlgfID0y4CMWVbEQMPcmLCY", clientKey: "aeRRvOr8eotKgM0LdrDacctcQ9W2nKoaOBPbf9iU")
    
    
PFFacebookUtils.initializeFacebookWithApplicationLaunchOptions(launchOptions)
    
    
    // Initialize Facebook
      // check if we have logged in user
    // 2
    let user = PFUser.currentUser()
    
    let startViewController: UIViewController;
    
    if (user != nil) {
        // 3
        // if we have a user, set the TabBarController to be the initial View Controller
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        startViewController = storyboard.instantiateViewControllerWithIdentifier("TabBarController") as! UITabBarController
    } else {
        // 4
        // Otherwise set the LoginViewController to be the first
        let loginViewController = PFLogInViewController()
        loginViewController.fields = .UsernameAndPassword | .LogInButton | .SignUpButton | .PasswordForgotten | .Facebook
        loginViewController.delegate = parseLoginHelper
        loginViewController.signUpController?.delegate = parseLoginHelper
        
        startViewController = loginViewController
    }
    
    // 5
    self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
    self.window?.rootViewController = startViewController;
    self.window?.makeKeyAndVisible()
    
    let acl = PFACL()
    acl.setPublicReadAccess(true)
    PFACL.setDefaultACL(acl, withAccessForCurrentUser: true)
    
    // Override point for customization after application launch.
    
    return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
    
    
    }

  func applicationWillResignActive(application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(application: UIApplication) {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }
    
    // Connect To Da "Book"
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject?) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
    }
    var parseLoginHelper: ParseLoginHelper!
    
    override init() {
        super.init()
        
        parseLoginHelper = ParseLoginHelper {[unowned self] user, error in
            // Initialize the ParseLoginHelper with a callback
            if let error = error {
                ErrorHandling.defaultErrorHandler(error)
                //Error pops up on screen if an error occurs
            } else  if let user = user {
                // if login was successful, display the TabBarController
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let tabBarController = storyboard.instantiateViewControllerWithIdentifier("TabBarController") as! UIViewController
                self.window?.rootViewController!.presentViewController(tabBarController, animated:true, completion:nil)
            }
        }
    }
   
    }

