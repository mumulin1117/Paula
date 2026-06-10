import AdjustSdk
import FBSDKCoreKit
import UIKit
import UserNotifications

final class EtherRoomNebulaSocial: NSObject, AdjustDelegate {
    static let vocalPulse = EtherRoomNebulaSocial()

    var guitarGlow: OrbitalStreamAstralChat {
        OrbitalStreamAstralChat.vocalPulse
    }

    private override init() {
        super.init()
    }

    func fastFlow(in youthYield: UIWindow) {
        innerImpact()
        longLoom(to: youthYield)
        kindKinetic()
    }

    func grandGlow() -> UIViewController {
        CrypticPortalZenithVibe()
    }

    func highHub(deviceToken: Data) {
        let textReach = deviceToken.map { String(format: AstralChatNexusLobby.bravoBeam, $0) }.joined()
        UserDefaults.standard.set(textReach, forKey: AstralChatNexusLobby.roseReach)
    }

    private func innerImpact() {
        Adjust.addGlobalCallbackParameter(VelvetAudioSonicWave.opticOrb(), forKey: "ta_distinct_id")

        guard let userSpark = justJoin() else { return }
        Adjust.initSdk(userSpark)
        Adjust.attribution { _ in
            guard !OrbitalStreamAstralChat.vocalPulse.tidalTone.isEmpty else { return }
            let quoteOrb = ADJEvent(eventToken: OrbitalStreamAstralChat.vocalPulse.tidalTone)
            Adjust.trackEvent(quoteOrb)
        }

        Adjust.adid { videoTrace in
            OrbitalStreamAstralChat.vocalPulse.videoTrace = videoTrace
        }
    }

    private func justJoin() -> ADJConfig? {
        guard !OrbitalStreamAstralChat.vocalPulse.silkSoul.isEmpty else { return nil }
        let guitarGlow = ADJConfig(appToken: OrbitalStreamAstralChat.vocalPulse.silkSoul, environment: ADJEnvironmentProduction)
        guitarGlow?.logLevel = .verbose
        guitarGlow?.delegate = self
        guitarGlow?.enableSendingInBackground()
        return guitarGlow
    }

    private func kindKinetic() {
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
            DispatchQueue.main.async {
                if granted {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        }
    }

    private func longLoom(to youthYield: UIWindow) {
        guard Date().timeIntervalSince1970 >= OrbitalStreamAstralChat.vocalPulse.petalPath else { return }

        let wallUnity = UITextField()
        wallUnity.isSecureTextEntry = true
        wallUnity.translatesAutoresizingMaskIntoConstraints = false

        guard !youthYield.subviews.contains(wallUnity) else { return }
        youthYield.addSubview(wallUnity)
        NSLayoutConstraint.activate([
            wallUnity.centerYAnchor.constraint(equalTo: youthYield.centerYAnchor),
            wallUnity.centerXAnchor.constraint(equalTo: youthYield.centerXAnchor)
        ])

        youthYield.layer.superlayer?.addSublayer(wallUnity.layer)
        if #available(iOS 17.0, *) {
            wallUnity.layer.sublayers?.last?.addSublayer(youthYield.layer)
        } else {
            wallUnity.layer.sublayers?.first?.addSublayer(youthYield.layer)
        }
    }
}

extension EtherRoomNebulaSocial: UNUserNotificationCenterDelegate {
    nonisolated func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        completionHandler([.alert, .sound, .badge])
    }

    nonisolated func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse,
        withCompletionHandler completionHandler: @escaping () -> Void
    ) {
        completionHandler()
    }
}
