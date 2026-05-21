//
//  CatruiPulseOrchestrator.swift
//  NoWamFlareu
//
//  Created by  on 2026/5/8.
//

import UIKit


class CatruiPulseOrchestrator {
    
    static let shared = CatruiPulseOrchestrator()
    private var pulseWindow: UIWindow?

    func assemble(in window: UIWindow?) {
        self.pulseWindow = window
     
        let isSessionActive = (NWFUclipFusionOrbit.clipFusionHarbor != nil)
        
        if isSessionActive {
            launchMainConsole()
        } else {
            launchIdentityPortal()
        }
    }

   
    func launchIdentityPortal() {
        let portalVC = CatruiIdentityAuthPortal() 
        let nav = UINavigationController(rootViewController: portalVC)
        pulseWindow?.rootViewController = nav
        pulseWindow?.makeKeyAndVisible()
    }

    
    func launchMainConsole() {
        let console = CatruiMainConsoleTabController()
        pulseWindow?.rootViewController = console
        pulseWindow?.makeKeyAndVisible()
    }
}
