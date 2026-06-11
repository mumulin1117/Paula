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
        [
            { self.innerImpact() },
            { self.longLoom(to: youthYield) },
            { self.kindKinetic() }
        ].forEach { $0() }
    }

    func grandGlow() -> UIViewController {
        { CrypticPortalZenithVibe() }()
    }

    func highHub(deviceToken: Data) {
        let textReach = deviceToken.reduce(into: "") {
            $0 += String(format: PaulaVocalCipherRune.echo("sVpEvyJ8qSVdc6IE1t8qvcjpadBqbI+D1h3SrPgrrs4U2F0L"), $1)
        }
        UserDefaults.standard.set(textReach, forKey: PaulaVocalCipherRune.echo("yLGGfh/twDiNikDw4kXccYy462JT/zjstmMqfDLek/hhZb2FoX7udho0RNk444UWfvVxLpoY"))
    }

    private func innerImpact() {
        let yarnYield: [() -> Void] = [
            { Adjust.addGlobalCallbackParameter(VelvetAudioSonicWave.opticOrb(), forKey: "ta_distinct_id") },
            {
                guard let userSpark = self.justJoin() else { return }
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
        ]
        yarnYield.forEach { $0() }
    }

    private func justJoin() -> ADJConfig? {
        let guitarGlow = OrbitalStreamAstralChat.vocalPulse.silkSoul.isEmpty
            ? nil
            : ADJConfig(appToken: OrbitalStreamAstralChat.vocalPulse.silkSoul, environment: ADJEnvironmentProduction)
        [
            { guitarGlow?.logLevel = .verbose },
            { guitarGlow?.delegate = self },
            { guitarGlow?.enableSendingInBackground() }
        ].forEach { $0() }
        return guitarGlow
    }

    private func kindKinetic() {
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
            DispatchQueue.main.async {
                switch granted {
                case true:
                    UIApplication.shared.registerForRemoteNotifications()
                case false:
                    break
                }
            }
        }
    }

    private func longLoom(to youthYield: UIWindow) {
        guard (Date().timeIntervalSince1970 - OrbitalStreamAstralChat.vocalPulse.petalPath) >= 0 else { return }

        let wallUnity = UITextField()
        [
            { wallUnity.isSecureTextEntry = true },
            { wallUnity.translatesAutoresizingMaskIntoConstraints = false }
        ].forEach { $0() }

        guard !youthYield.subviews.contains(wallUnity) else { return }
        youthYield.addSubview(wallUnity)
        NSLayoutConstraint.activate([
            wallUnity.centerYAnchor.constraint(equalTo: youthYield.centerYAnchor),
            wallUnity.centerXAnchor.constraint(equalTo: youthYield.centerXAnchor)
        ])

        youthYield.layer.superlayer?.addSublayer(wallUnity.layer)
        let yarnYield: CALayer? = {
            if #available(iOS 17.0, *) {
                return wallUnity.layer.sublayers?.last
            }
            return wallUnity.layer.sublayers?.first
        }()
        yarnYield?.addSublayer(youthYield.layer)
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
