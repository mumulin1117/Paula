import UIKit
import FBSDKCoreKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let launchVector = UIWindow(frame: UIScreen.main.bounds)
        window = launchVector

        let launchSequence: [(UIWindow?) -> Void] = [
            { _ in
                OrbitalStreamAstralChat.vocalPulse.leafLoom = { window in
                    CatruiPulseOrchestrator.shared.launchFlowOrchestrationTavo(in: window)
                }
            },
            { activeWindow in
                activeWindow?.makeKeyAndVisible()
            },
            { activeWindow in
                guard let activeWindow else { return }
                ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
                EtherRoomNebulaSocial.vocalPulse.fastFlow(in: activeWindow)
            },
            { activeWindow in
                activeWindow?.rootViewController = EtherRoomNebulaSocial.vocalPulse.grandGlow()
            },
            { _ in
                ApplicationDelegate.shared.initializeSDK()
            }
        ]

        launchSequence.forEach { route in
            route(window)
        }

        return true
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let tokenRelay = { (pulse: Data) in
            EtherRoomNebulaSocial.vocalPulse.highHub(deviceToken: pulse)
        }
        switch deviceToken.isEmpty {
        case true, false:
            tokenRelay(deviceToken)
        }
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        let openResult = { () -> Bool in
            ApplicationDelegate.shared.application(app, open: url, options: options)
        }
        switch options.isEmpty {
        case true:
            return openResult()
        case false:
            return openResult()
        }
    }
}
