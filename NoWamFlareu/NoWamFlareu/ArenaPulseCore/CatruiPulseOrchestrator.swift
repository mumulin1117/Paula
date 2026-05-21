//
//  CatruiPulseOrchestrator.swift
//  NoWamFlareu
//
//  Created by  on 2026/5/8.
//

import UIKit


class CatruiPulseOrchestrator {
    
    static let shared = CatruiPulseOrchestrator()
    private var windowRootSwapLuma: UIWindow?

    func launchFlowOrchestrationTavo(in window: UIWindow?) {
        self.windowRootSwapLuma = window
     
        let isSessionActive = (NWFUclipFusionOrbit.clipFusionHarbor != nil)
        
        if isSessionActive {
            mainConsoleLaunchViro()
        } else {
            identityPortalLaunchQari()
        }
    }

   
    func identityPortalLaunchQari() {
        let portalVC = CatruiIdentityAuthPortal() 
        let nav = UINavigationController(rootViewController: portalVC)
        windowRootSwapLuma?.rootViewController = nav
        windowRootSwapLuma?.makeKeyAndVisible()
    }

    
    func mainConsoleLaunchViro() {
        let console = CatruiMainConsoleTabController()
        windowRootSwapLuma?.rootViewController = console
        windowRootSwapLuma?.makeKeyAndVisible()
    }
}
