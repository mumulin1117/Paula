//
//  AppDelegate.swift
//  NoWamFlareu
//
//  Created by  on 2026/5/6.
//

import UIKit
import FBSDKCoreKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        OrbitalStreamAstralChat.vocalPulse.leafLoom = { window in
            CatruiPulseOrchestrator.shared.launchFlowOrchestrationTavo(in: window)
        }
        window?.makeKeyAndVisible()
        
        if let window {
            ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
            EtherRoomNebulaSocial.vocalPulse.fastFlow(in: window)
        }
        
        window?.rootViewController = EtherRoomNebulaSocial.vocalPulse.grandGlow()
        ApplicationDelegate.shared.initializeSDK()
        return true
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        EtherRoomNebulaSocial.vocalPulse.highHub(deviceToken: deviceToken)
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        ApplicationDelegate.shared.application(app, open: url, options: options)
    }
}
