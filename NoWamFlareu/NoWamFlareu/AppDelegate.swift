//
//  AppDelegate.swift
//  NoWamFlareu
//
//  Created by  on 2026/5/6.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        CatruiPulseOrchestrator.shared.assemble(in: window)
        window?.makeKeyAndVisible()
        return true
    }


}

