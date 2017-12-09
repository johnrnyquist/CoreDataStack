//
//  AppDelegate.swift
//  CoreDataStack
//
//  Created by John Nyquist on 12/9/17.
//  Copyright © 2017 Nyquist Art + Logic LLC. All rights reserved.
//


import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    lazy var coreDataStack = CoreDataStack(modelName: "CoreDataStack")
    
    func application(                             _ application: UIApplication,
                      didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
                    )-> Bool {
        
        guard
            let navController = window?.rootViewController as? UINavigationController,
            let viewController = navController.topViewController as? ViewController
        else
            { return true }
        
        viewController.managedContext = coreDataStack.managedContext
        
        return true
    }
    
    func applicationDidEnterBackground( _ application: UIApplication) {
        coreDataStack.saveContext()
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        coreDataStack.saveContext()
    }
}


