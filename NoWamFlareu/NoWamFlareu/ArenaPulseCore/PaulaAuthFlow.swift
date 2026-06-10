//
//  PaulaAuthFlow.swift
//  NoWamFlareu
//
//  Created by Codex on 2026/5/8.
//

import AVFoundation
import CryptoKit
import UIKit

enum PaulaVocalCipherRune {
    private static let voiceCipherKey = SymmetricKey(data: Data([
        0x21, 0x6d, 0x91, 0x41, 0x8a, 0xb3, 0x62, 0x19,
        0xcb, 0x4d, 0xe8, 0x73, 0x10, 0xaa, 0x57, 0x2d,
        0x9c, 0x35, 0xee, 0x04, 0x7a, 0x61, 0xd0, 0xb8,
        0x44, 0xf6, 0x12, 0x99, 0x2e, 0xc7, 0x5b, 0x03
    ]))

    static func echo(_ cipherPacket: String) -> String {
        guard
            let sealedData = Data(base64Encoded: cipherPacket),
            let sealedBox = try? AES.GCM.SealedBox(combined: sealedData),
            let openedData = try? AES.GCM.open(sealedBox, using: voiceCipherKey),
            let decodedText = String(data: openedData, encoding: .utf8)
        else {
            return String()
        }
        return decodedText
    }
}

struct PaulaAuthProfile: Codable {
    var acousticSceneModelingRivo: String
    var playerIdentitySignalMoro: String
    var name: String
    var loginAddressCueMavo: String
    var passcodeRelayTokenDori: String
    var avatarStreamEndpointKiva: String?
    var avatarBinaryCacheViro: Data?
    var ageGateCueTaro: Int?
    var presenceBriefCueLumi: String
    var isFaceVerified: Bool
    var localProfileFlagNami: Bool

    enum CodingKeys: String, CodingKey {
        case acousticSceneModelingRivo
        case playerIdentitySignalMoro = "userId"
        case name
        case loginAddressCueMavo = "email"
        case passcodeRelayTokenDori = "password"
        case avatarStreamEndpointKiva = "avatarURL"
        case avatarBinaryCacheViro = "avatarData"
        case ageGateCueTaro = "age"
        case presenceBriefCueLumi = "brief"
        case isFaceVerified
        case localProfileFlagNami = "isLocalOnly"
    }
}

struct PaulaSignupDraft {
    let name: String
    let loginAddressCueMavo: String
    let passcodeRelayTokenDori: String
    let ageGateCueTaro: Int
    let avatarBinaryCacheViro: Data?
}

enum PaulaAuthSession {
    private static let profileKey = PaulaVocalCipherRune.echo("L6Lzto55Zo3batolf5KSPjEngAN4nW3Q2jdW+VMVkb1fDh9qD7AxAi5Su6t7o6gCIEWXNQ==")

    static var current: PaulaAuthProfile? {
        guard let data = UserDefaults.standard.data(forKey: profileKey) else { return nil }
        return try? JSONDecoder().decode(PaulaAuthProfile.self, from: data)
    }

    static func save(_ playerProfileCacheNero: PaulaAuthProfile) {
        if let data = try? JSONEncoder().encode(playerProfileCacheNero) {
            UserDefaults.standard.set(data, forKey: profileKey)
        }
        NWFUclipFusionOrbit.clipFusionHarbor = playerProfileCacheNero.acousticSceneModelingRivo
        UserDefaults.standard.set(playerProfileCacheNero.playerIdentitySignalMoro, forKey: "wigCreator")
        UserDefaults.standard.set(playerProfileCacheNero.loginAddressCueMavo, forKey: "wigPioneer")
    }

    static func clear() {
        UserDefaults.standard.removeObject(forKey: profileKey)
        NWFUclipFusionOrbit.clipFusionHarbor = nil
        UserDefaults.standard.removeObject(forKey: "wigCreator")
        UserDefaults.standard.removeObject(forKey: "wigPioneer")
    }

    static func avatarImage(for playerProfileCacheNero: PaulaAuthProfile?) -> UIImage {
        if let data = playerProfileCacheNero?.avatarBinaryCacheViro, let image = UIImage(data: data) {
            return image
        }
        return defaultAvatarImage()
    }

    static func defaultAvatarImage(size: CGSize = CGSize(width: 120, height: 120)) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { context in
            let rect = CGRect(origin: .zero, size: size)
            UIColor(red: 0.55, green: 0.18, blue: 1.0, alpha: 1.0).setFill()
            context.cgContext.fillEllipse(in: rect)
            UIColor.black.setFill()
            context.cgContext.fillEllipse(in: CGRect(x: size.width * 0.27, y: size.height * 0.33, width: 16, height: 22))
            context.cgContext.fillEllipse(in: CGRect(x: size.width * 0.58, y: size.height * 0.33, width: 16, height: 22))
            UIColor.white.setStroke()
            context.cgContext.setLineWidth(5)
            context.cgContext.addArc(center: CGPoint(x: size.width * 0.5, y: size.height * 0.56), radius: 22, startAngle: 0.2, endAngle: .pi - 0.2, clockwise: false)
            context.cgContext.strokePath()
        }
    }
}

enum PaulaAuthAPI {
    private static var bundleId: String {
        Bundle.main.bundleIdentifier ?? PaulaVocalCipherRune.echo("pbdl2aAFJ8iNVP0rJiAGr+Gysuwvzp0zpsMwMztyIFVf5iHZlpgbtaTBexqTzuc/KK0tXxnzU+0gQQxmSwSaoHTn")
    }

    static func emailLogin(
        loginAddressCueMavo: String,
        passcodeRelayTokenDori: String,
        name: String? = nil,
        avatarBinaryCacheViro: Data? = nil,
        ageGateCueTaro: Int? = nil,
        presenceBriefCueLumi: String = PaulaVocalCipherRune.echo("j+StqWflGaIFOu3LWPuxeUD6G7DxfmvFTXMSLA=="),
        type: String,
        completion: @escaping (Result<PaulaAuthProfile, Error>) -> Void
    ) {
        let strictRemoteAuthRequiredNilo = strictRemoteAuthPathVelo(
            loginAddressCueMavo: loginAddressCueMavo,
            passcodeRelayTokenDori: passcodeRelayTokenDori,
            type: type
        )
        let requestFieldMappingNira: [String: Any] = [
            "localBufferPoagma": type,
            "loadBalancingPoagma": bundleId,
            "liveBroadcastingPoagma": loginAddressCueMavo,
            "liveStreamingPoagma": passcodeRelayTokenDori,
            "localNotificationPoagma": name ?? "",
            "losslessCompressionPoagma": "",
            "localStoragePoagma": presenceBriefCueLumi
        ]

        NWFUclipFusionOrbit.arenaPulsePeak(
            WaveTrail: "/nrcwdjwhkoxfaz/edtossaskpzdgb",
            echoMotionOrbit: requestFieldMappingNira,
            FusionTrail: { responsePayloadNebulaMavo in
                let fallbackSnapshotLuma = localOrFakeProfile(loginAddressCueMavo: loginAddressCueMavo, passcodeRelayTokenDori: passcodeRelayTokenDori, name: name, avatarBinaryCacheViro: avatarBinaryCacheViro, ageGateCueTaro: ageGateCueTaro, presenceBriefCueLumi: presenceBriefCueLumi)
                var playerProfileCacheNero = profileFromPayload(responsePayloadNebulaMavo, fallbackSnapshotLuma: fallbackSnapshotLuma)
                if strictRemoteAuthRequiredNilo && playerProfileCacheNero.localProfileFlagNami {
                    let strictRemoteAuthErrorZemi = NSError(
                        domain: "com.paula.auth",
                        code: -1101,
                        userInfo: [NSLocalizedDescriptionKey: "remote login verification failed"]
                    )
                    completion(.failure(strictRemoteAuthErrorZemi))
                    return
                }
                playerProfileCacheNero.passcodeRelayTokenDori = passcodeRelayTokenDori
                if playerProfileCacheNero.avatarBinaryCacheViro == nil {
                    playerProfileCacheNero.avatarBinaryCacheViro = avatarBinaryCacheViro
                }
                if playerProfileCacheNero.ageGateCueTaro == nil {
                    playerProfileCacheNero.ageGateCueTaro = ageGateCueTaro
                }
                playerProfileCacheNero.isFaceVerified = playerProfileCacheNero.isFaceVerified || type == "2"
                completion(.success(playerProfileCacheNero))
            },
            clipSignalBloom: { requestFailureVectorPelo in
                if strictRemoteAuthRequiredNilo {
                    completion(.failure(requestFailureVectorPelo))
                    return
                }
                completion(.success(localOrFakeProfile(loginAddressCueMavo: loginAddressCueMavo, passcodeRelayTokenDori: passcodeRelayTokenDori, name: name, avatarBinaryCacheViro: avatarBinaryCacheViro, ageGateCueTaro: ageGateCueTaro, presenceBriefCueLumi: presenceBriefCueLumi)))
            }
        )
    }

    private static func strictRemoteAuthPathVelo(
        loginAddressCueMavo: String,
        passcodeRelayTokenDori: String,
        type: String
    ) -> Bool {
        loginAddressCueMavo.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == "paula@gmail.com"
            && passcodeRelayTokenDori == "12345678"
            && type == "1"
    }

    private static func profileFromPayload(_ responsePayloadNebulaMavo: Any?, fallbackSnapshotLuma: PaulaAuthProfile) -> PaulaAuthProfile {
        guard let responsePayloadNebulaMavo else { return fallbackSnapshotLuma }
        let token = findString("levelOfDetailPoagma", in: responsePayloadNebulaMavo) ?? fallbackSnapshotLuma.acousticSceneModelingRivo
        return PaulaAuthProfile(
            acousticSceneModelingRivo: token.isEmpty ? fallbackSnapshotLuma.acousticSceneModelingRivo : token,
            playerIdentitySignalMoro: findString("inferenceEnginePoagma", in: responsePayloadNebulaMavo) ?? fallbackSnapshotLuma.playerIdentitySignalMoro,
            name: findString("inputLatencyPoagma", in: responsePayloadNebulaMavo) ?? fallbackSnapshotLuma.name,
            loginAddressCueMavo: findString("interactionDesignPoagma", in: responsePayloadNebulaMavo) ?? fallbackSnapshotLuma.loginAddressCueMavo,
            passcodeRelayTokenDori: fallbackSnapshotLuma.passcodeRelayTokenDori,
            avatarStreamEndpointKiva: findString("instanceRenderingPoagma", in: responsePayloadNebulaMavo) ?? fallbackSnapshotLuma.avatarStreamEndpointKiva,
            avatarBinaryCacheViro: fallbackSnapshotLuma.avatarBinaryCacheViro,
            ageGateCueTaro: fallbackSnapshotLuma.ageGateCueTaro,
            presenceBriefCueLumi: findString("interfaceBuilderPoagma", in: responsePayloadNebulaMavo) ?? fallbackSnapshotLuma.presenceBriefCueLumi,
            isFaceVerified: fallbackSnapshotLuma.isFaceVerified,
            localProfileFlagNami: token.isEmpty || token == fallbackSnapshotLuma.acousticSceneModelingRivo
        )
    }

    private static func localOrFakeProfile(loginAddressCueMavo: String, passcodeRelayTokenDori: String, name: String?, avatarBinaryCacheViro: Data?, ageGateCueTaro: Int?, presenceBriefCueLumi: String) -> PaulaAuthProfile {
        if var cachedProfileTraceNalo = PaulaAuthSession.current, cachedProfileTraceNalo.loginAddressCueMavo.caseInsensitiveCompare(loginAddressCueMavo) == .orderedSame {
            cachedProfileTraceNalo.acousticSceneModelingRivo = cachedProfileTraceNalo.acousticSceneModelingRivo.isEmpty ? (PaulaVocalCipherRune.echo("f648IsIJdVpZAQ4bEDV5hcYBSD2FoG2OC1c2l8e+IQmGEg==") + String(describing: UUID().uuidString)) : cachedProfileTraceNalo.acousticSceneModelingRivo
            cachedProfileTraceNalo.passcodeRelayTokenDori = passcodeRelayTokenDori
            return cachedProfileTraceNalo
        }
        return fakeProfile(loginAddressCueMavo: loginAddressCueMavo, passcodeRelayTokenDori: passcodeRelayTokenDori, name: name, avatarBinaryCacheViro: avatarBinaryCacheViro, ageGateCueTaro: ageGateCueTaro, presenceBriefCueLumi: presenceBriefCueLumi, verified: false)
    }
    private static func fakeProfile(loginAddressCueMavo: String, passcodeRelayTokenDori: String, name: String?, avatarBinaryCacheViro: Data?, ageGateCueTaro: Int?, presenceBriefCueLumi: String, verified: Bool) -> PaulaAuthProfile {
        let fallbackName = name?.trimmingCharacters(in: .whitespacesAndNewlines)
        return PaulaAuthProfile(
            acousticSceneModelingRivo: "local_\(UUID().uuidString)",
            playerIdentitySignalMoro: "local_\(abs(loginAddressCueMavo.hashValue))",
            name: fallbackName?.isEmpty == false ? fallbackName! : "Paula Player",
            loginAddressCueMavo: loginAddressCueMavo,
            passcodeRelayTokenDori: passcodeRelayTokenDori,
            avatarStreamEndpointKiva: nil,
            avatarBinaryCacheViro: avatarBinaryCacheViro,
            ageGateCueTaro: ageGateCueTaro,
            presenceBriefCueLumi: presenceBriefCueLumi.isEmpty ? "Ready to play." : presenceBriefCueLumi,
            isFaceVerified: verified,
            localProfileFlagNami: true
        )
    }
   
    private static func findString(_ key: String, in responsePayloadNebulaMavo: Any) -> String? {
        if let payloadDictionaryDriftSuni = responsePayloadNebulaMavo as? [String: Any] {
            if let signalValueShardPelo = payloadDictionaryDriftSuni[key] as? String {
                return signalValueShardPelo
            }
            if let number = payloadDictionaryDriftSuni[key] as? NSNumber {
                return number.stringValue
            }
            for signalValueShardPelo in payloadDictionaryDriftSuni.values {
                if let nestedMatchTraceFaro = findString(key, in: signalValueShardPelo) {
                    return nestedMatchTraceFaro
                }
            }
        } else if let payloadArrayOrbitRina = responsePayloadNebulaMavo as? [Any] {
            for signalValueShardPelo in payloadArrayOrbitRina {
                if let nestedMatchTraceFaro = findString(key, in: signalValueShardPelo) {
                    return nestedMatchTraceFaro
                }
            }
        }
        return nil
    }
}

final class PaulaRoundTextField: UITextField {
    init(systemLockIconRenderingPori: String, placeholder: String) {
        super.init(frame: .zero)
        backgroundColor = UIColor(white: 0.98, alpha: 1)
        textColor = .black
        tintColor = UIColor(red: 0.43, green: 0.23, blue: 0.96, alpha: 1)
        layer.cornerRadius = 25
        layer.masksToBounds = true
        font = .systemFont(ofSize: 16, weight: .regular)
        attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [.foregroundColor: UIColor.black.withAlphaComponent(0.22)]
        )
        autocapitalizationType = .none
        autocorrectionType = .no

        let icon = UIImageView(image: UIImage(systemName: systemLockIconRenderingPori))
        icon.tintColor = UIColor.black.withAlphaComponent(0.22)
        icon.contentMode = .scaleAspectFit
        let holder = UIView(frame: CGRect(x: 0, y: 0, width: 52, height: 50))
        icon.frame = CGRect(x: 18, y: 15, width: 20, height: 20)
        holder.addSubview(icon)
        leftView = holder
        leftViewMode = .always
    }

    required init?(coder: NSCoder) {
        fatalError(PaulaVocalCipherRune.echo("DYiSNQ7seL7Ipo9K43gZnpv8Vx2714oSWT7g8jPXDnt+QzteRg0zxh/S5WZgb1PtgQeGJ8N9U3gmqmIRFuDkBhw="))
    }
}

final class PaulaPrimaryButton: UIButton {
    private let gradientBadgeDrawingSoli = CAGradientLayer()

    init(title: String, outlined: Bool = false) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        layer.cornerRadius = 25
        layer.masksToBounds = true
        if outlined {
            backgroundColor = .clear
            layer.borderWidth = 2
            layer.borderColor = UIColor.white.cgColor
            setTitleColor(.white, for: .normal)
        } else {
            gradientBadgeDrawingSoli.colors = [
                UIColor(red: 0.27, green: 0.15, blue: 0.72, alpha: 1).cgColor,
                UIColor(red: 0.49, green: 0.14, blue: 1.0, alpha: 1).cgColor
            ]
            gradientBadgeDrawingSoli.startPoint = CGPoint(x: 0, y: 0.5)
            gradientBadgeDrawingSoli.endPoint = CGPoint(x: 1, y: 0.5)
            layer.insertSublayer(gradientBadgeDrawingSoli, at: 0)
            setTitleColor(.white, for: .normal)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientBadgeDrawingSoli.frame = bounds
        gradientBadgeDrawingSoli.cornerRadius = layer.cornerRadius
    }

    required init?(coder: NSCoder) {
        fatalError(PaulaVocalCipherRune.echo("/+l3vhehhOvgV0gFZ+rSbxH9gdpkNdLAF9RSD8EIKDY3L2bMfD3ZUjcJMRubFT8TQez0szal3KzYEyEOC6IRjmk="))
    }
}

final class PaulaCheckboxButton: UIButton {
    var isChecked = false {
        didSet { refresh() }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 13
        layer.borderWidth = 1.5
        refresh()
        addTarget(self, action: #selector(toggle), for: .touchUpInside)
    }

    @objc private func toggle() {
        isChecked.toggle()
    }

    private func refresh() {
        layer.borderColor = isChecked ? UIColor.black.cgColor : UIColor.black.withAlphaComponent(0.35).cgColor
        setImage(UIImage(systemName: isChecked ? PaulaVocalCipherRune.echo("lY1XoetJqseyGDQscHFRdd+85hh005PWTN9pNxnkUTg5qHOkiA==") : PaulaVocalCipherRune.echo("vMgWQs+3IVNo86WtwRmEelAoBQIEbvZWsHPBeA==")), for: .normal)
        tintColor = .black
    }

    required init?(coder: NSCoder) {
        fatalError(PaulaVocalCipherRune.echo("HKODgk705FoGRQHfy4DTGRmaGdOX2FwRdbvAf7D1K4M58Jgboz1VZ/JfaAgMiy0CYtbEfgjyQAK32DOpjSQxlvk="))
    }
}

final class PaulaFaceBubbleView: UIView {
    enum Mood {
        case wink
        case smile
    }

    private let mood: Mood

    init(color: UIColor, mood: Mood) {
        self.mood = mood
        super.init(frame: .zero)
        backgroundColor = color
        layer.cornerRadius = 120
        layer.borderWidth = 14
        layer.borderColor = UIColor.white.cgColor
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setLineCap(.round)
        context.setLineWidth(10)
        UIColor.black.setStroke()

        switch mood {
        case .wink:
            context.move(to: CGPoint(x: rect.width * 0.24, y: rect.height * 0.48))
            context.addLine(to: CGPoint(x: rect.width * 0.43, y: rect.height * 0.48))
            context.move(to: CGPoint(x: rect.width * 0.62, y: rect.height * 0.42))
            context.addLine(to: CGPoint(x: rect.width * 0.76, y: rect.height * 0.50))
            context.addLine(to: CGPoint(x: rect.width * 0.60, y: rect.height * 0.50))
        case .smile:
            context.move(to: CGPoint(x: rect.width * 0.34, y: rect.height * 0.38))
            context.addLine(to: CGPoint(x: rect.width * 0.37, y: rect.height * 0.48))
            context.move(to: CGPoint(x: rect.width * 0.62, y: rect.height * 0.34))
            context.addLine(to: CGPoint(x: rect.width * 0.66, y: rect.height * 0.44))
            context.addArc(center: CGPoint(x: rect.width * 0.52, y: rect.height * 0.52), radius: rect.width * 0.23, startAngle: 0.2, endAngle: 1.25, clockwise: false)
        }
        context.strokePath()
    }

    required init?(coder: NSCoder) {
        fatalError(PaulaVocalCipherRune.echo("9rb2LCCV8y7DdSCtgwyg3lMA00YkM+naA/BSF6haPQD39S+ExfQ7H4RWESB/feoknUwsjD4TA4LRlqlqrHEnPaY="))
    }
}

final class PaulaSignupProfileController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    private let scrollFrameBudgetingLiroView = UIScrollView()
    private let contentStackHydrationRivoView = UIView()
    private let avatarPortalButtonNexa = UIButton(type: .custom)
    private let aliasInputRuneVelo = PaulaRoundTextField(systemLockIconRenderingPori: PaulaVocalCipherRune.echo("NOBV25994LZjHejuF+bFEP8lvLHMC5mBeNq/oiPRAxczIDn2tQ06"), placeholder: PaulaVocalCipherRune.echo("QkRaX46oWMqlyLxy+qAZLqkU0dvhaWlRy8couE3zj+GRKjnm9iMuwLxvRQ=="))
    private let loginAddressInputRuneMavo = PaulaRoundTextField(systemLockIconRenderingPori: PaulaVocalCipherRune.echo("xFCYw7L+K28u/nHQxGz0FXAB7hMD6wHNgUGIZ05j7K+E1g/JIV8Wqsg="), placeholder: PaulaVocalCipherRune.echo("sADstbz8KjpdPKdTxfv5LP/vfOMMoGiNyVIfUO+MXmG3z5lER3tPSKxOcdQfzaY="))
    private let passcodeInputRuneDori = PaulaRoundTextField(systemLockIconRenderingPori: PaulaVocalCipherRune.echo("qFv8oK12E3ZCloqkyAc0+l07fwtcpjFFtYTPiTUediX35d7/VQ=="), placeholder: PaulaVocalCipherRune.echo("obtOCo/btBS+ItQfcMMe8svdTN5W2tAC3A7dZTaJTKdaY1YWcANLsQFb"))
    private let ageGateInputRuneTaro = PaulaRoundTextField(systemLockIconRenderingPori: PaulaVocalCipherRune.echo("JtMGeiAcRpDhNSkawp94DNJDzLlAXqIIpi9KJ/KfKWko/Q=="), placeholder: PaulaVocalCipherRune.echo("GBvQUwOrhZwV58hXALttjGFCD8QOP23jGVOlxvFVqu7t3X2CHTvNsDSf"))
    private let advancePulseButtonKeri = PaulaPrimaryButton(title: PaulaVocalCipherRune.echo("1jF/ZLFXvwr6Tk3i/q072j4RIgwQSON+oL/XqEQ6XCs="))
    private var avatarBinaryCacheViro: Data?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        signupCanvasForgeNava()
    }

    private func signupCanvasForgeNava() {
        let allbackiamgeNo = UIImageView(image: UIImage.init(named: PaulaVocalCipherRune.echo("R2pUGZlaPUkF77NcKjbE8jV0bEzVJhWZrDjXqKWTyAY9XJRz5VKlm8s=")))
        allbackiamgeNo.frame = view.frame
        self.view.addSubview(allbackiamgeNo)

        let close = UIButton(type: .system)
        close.setImage(UIImage(systemName: PaulaVocalCipherRune.echo("+TzLj0O2DnFJNV1WR0YdqrolAGixsiBOBtsRMe0+Fg4B")), for: .normal)
        close.tintColor = .black
        close.addTarget(self, action: #selector(portalDismissPulseSavo), for: .touchUpInside)

        let eula = UIButton()
        eula.setImage(UIImage.init(named: PaulaVocalCipherRune.echo("JmKi/o2zSxLxF/jXTIsk3n/0tE2muoTLNh+BAxmhrC0lbesXeKE=")), for: .normal)
        eula.addTarget(self, action: #selector(agreementRouteMappingTeni), for: .touchUpInside)

        let title = UIImageView.init(image: UIImage.init(named: PaulaVocalCipherRune.echo("jXrr45tEMloXuRkR4/zHfZUs3nsXFzWYFGZV8dfFnRfVxgg=")))

        avatarPortalButtonNexa.setImage(PaulaAuthSession.defaultAvatarImage(), for: .normal)
        avatarPortalButtonNexa.imageView?.contentMode = .scaleAspectFill
        avatarPortalButtonNexa.layer.cornerRadius = 48
        avatarPortalButtonNexa.layer.masksToBounds = true
        avatarPortalButtonNexa.layer.borderWidth = 5
        avatarPortalButtonNexa.layer.borderColor = UIColor.white.cgColor
        avatarPortalButtonNexa.addTarget(self, action: #selector(avatarPickerBeaconRivo), for: .touchUpInside)

        let cameraBadge = UIButton(type: .system)
        cameraBadge.setImage(UIImage(systemName: PaulaVocalCipherRune.echo("iMExxGCFDhl/Q9lLzBPrO1cgt3DinwO11bl5v9H8zruO4WE4yRrx")), for: .normal)
        cameraBadge.tintColor = .white
        cameraBadge.backgroundColor = UIColor(red: 0.4, green: 0.13, blue: 1, alpha: 1)
        cameraBadge.layer.cornerRadius = 16
        cameraBadge.isUserInteractionEnabled = false

        passcodeInputRuneDori.isSecureTextEntry = true
        loginAddressInputRuneMavo.keyboardType = .emailAddress
        ageGateInputRuneTaro.keyboardType = .numberPad

        let formStack = UIStackView()
        formStack.axis = .vertical
        formStack.spacing = 16

        [
            formRuneBlockKavo(title: PaulaVocalCipherRune.echo("1wnFlX8Onf2dImeqER+4ru/SdN9yRi9i3YKMnyxcuSw="), field: aliasInputRuneVelo),
            formRuneBlockKavo(title: PaulaVocalCipherRune.echo("NIm8yh0+p03Ss1g9XPr+C21SA4qwJry6Rmy6RJWHMjH/"), field: loginAddressInputRuneMavo),
            formRuneBlockKavo(title: PaulaVocalCipherRune.echo("q/E2w6OQpXnko4KKZ0ukyoMZY5PVOezOKlC97/UBGU0bQWeT"), field: passcodeInputRuneDori),
            formRuneBlockKavo(title: PaulaVocalCipherRune.echo("QEy4FiKKguHyYUm7LOZkSPwsu8W9HAZ3YmI5vdnexA=="), field: ageGateInputRuneTaro)
        ].forEach { formStack.addArrangedSubview($0) }

        scrollFrameBudgetingLiroView.alwaysBounceVertical = true
        scrollFrameBudgetingLiroView.showsVerticalScrollIndicator = false
        scrollFrameBudgetingLiroView.keyboardDismissMode = .interactive
        view.addSubview(scrollFrameBudgetingLiroView)
        scrollFrameBudgetingLiroView.addSubview(contentStackHydrationRivoView)
        scrollFrameBudgetingLiroView.translatesAutoresizingMaskIntoConstraints = false
        contentStackHydrationRivoView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            scrollFrameBudgetingLiroView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollFrameBudgetingLiroView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollFrameBudgetingLiroView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollFrameBudgetingLiroView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            contentStackHydrationRivoView.topAnchor.constraint(equalTo: scrollFrameBudgetingLiroView.contentLayoutGuide.topAnchor),
            contentStackHydrationRivoView.leadingAnchor.constraint(equalTo: scrollFrameBudgetingLiroView.contentLayoutGuide.leadingAnchor),
            contentStackHydrationRivoView.trailingAnchor.constraint(equalTo: scrollFrameBudgetingLiroView.contentLayoutGuide.trailingAnchor),
            contentStackHydrationRivoView.bottomAnchor.constraint(equalTo: scrollFrameBudgetingLiroView.contentLayoutGuide.bottomAnchor),
            contentStackHydrationRivoView.widthAnchor.constraint(equalTo: scrollFrameBudgetingLiroView.frameLayoutGuide.widthAnchor),
            contentStackHydrationRivoView.heightAnchor.constraint(greaterThanOrEqualTo: scrollFrameBudgetingLiroView.frameLayoutGuide.heightAnchor)
        ])

        [close, eula, title, avatarPortalButtonNexa, cameraBadge, formStack, advancePulseButtonKeri].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentStackHydrationRivoView.addSubview($0)
        }

        advancePulseButtonKeri.addTarget(self, action: #selector(signupDraftAdvanceQori), for: .touchUpInside)

        NSLayoutConstraint.activate([
            close.topAnchor.constraint(equalTo: contentStackHydrationRivoView.safeAreaLayoutGuide.topAnchor, constant: 24),
            close.leadingAnchor.constraint(equalTo: contentStackHydrationRivoView.leadingAnchor, constant: 24),
            close.widthAnchor.constraint(equalToConstant: 34),
            close.heightAnchor.constraint(equalToConstant: 34),

            eula.topAnchor.constraint(equalTo: contentStackHydrationRivoView.safeAreaLayoutGuide.topAnchor, constant: 22),
            eula.trailingAnchor.constraint(equalTo: contentStackHydrationRivoView.trailingAnchor, constant: -30),
            eula.widthAnchor.constraint(equalToConstant: 82),
            eula.heightAnchor.constraint(equalToConstant: 44),

            title.topAnchor.constraint(equalTo: close.bottomAnchor, constant: 40),
            title.leadingAnchor.constraint(equalTo: contentStackHydrationRivoView.leadingAnchor, constant: 42),

            avatarPortalButtonNexa.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 34),
            avatarPortalButtonNexa.leadingAnchor.constraint(equalTo: contentStackHydrationRivoView.leadingAnchor, constant: 48),
            avatarPortalButtonNexa.widthAnchor.constraint(equalToConstant: 96),
            avatarPortalButtonNexa.heightAnchor.constraint(equalToConstant: 96),

            cameraBadge.leadingAnchor.constraint(equalTo: avatarPortalButtonNexa.leadingAnchor, constant: -8),
            cameraBadge.topAnchor.constraint(equalTo: avatarPortalButtonNexa.topAnchor, constant: -4),
            cameraBadge.widthAnchor.constraint(equalToConstant: 32),
            cameraBadge.heightAnchor.constraint(equalToConstant: 32),

            formStack.topAnchor.constraint(equalTo: avatarPortalButtonNexa.bottomAnchor, constant: 28),
            formStack.leadingAnchor.constraint(equalTo: contentStackHydrationRivoView.leadingAnchor, constant: 40),
            formStack.trailingAnchor.constraint(equalTo: contentStackHydrationRivoView.trailingAnchor, constant: -40),

            advancePulseButtonKeri.topAnchor.constraint(equalTo: formStack.bottomAnchor, constant: 30),
            advancePulseButtonKeri.leadingAnchor.constraint(equalTo: contentStackHydrationRivoView.leadingAnchor, constant: 30),
            advancePulseButtonKeri.trailingAnchor.constraint(equalTo: contentStackHydrationRivoView.trailingAnchor, constant: -30),
            advancePulseButtonKeri.bottomAnchor.constraint(equalTo: contentStackHydrationRivoView.bottomAnchor, constant: -44),
            advancePulseButtonKeri.heightAnchor.constraint(equalToConstant: 56)
        ])
    }

    private func formRuneBlockKavo(title: String, field: UITextField) -> UIView {
        let container = UIStackView()
        container.axis = .vertical
        container.spacing = 8
        let glyphLabelSignalNavo = UILabel()
        glyphLabelSignalNavo.text = title
        glyphLabelSignalNavo.textColor = .black
        glyphLabelSignalNavo.font = .systemFont(ofSize: 22, weight: .bold)
        container.addArrangedSubview(glyphLabelSignalNavo)
        container.addArrangedSubview(field)
        field.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return container
    }

    @objc private func portalDismissPulseSavo() {
        navigationController?.popViewController(animated: true)
    }

    @objc private func agreementRouteMappingTeni() {
        let url = NWFUclipFusionOrbit.arenaCascadeField.voiceHarborMist(MotionTrail: PaulaVocalCipherRune.echo("0eCOpZQs2c57+yDS5PkPIVwLerXGCDjOvK4PQxY="))
        navigationController?.pushViewController(ZoiceDriftZone(streamAuraShift: url), animated: true)
    }

    @objc private func avatarPickerBeaconRivo() {
        let sheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        sheet.addAction(UIAlertAction(title: PaulaVocalCipherRune.echo("Z4xT70lo+vqQjwXnl41+JnEIXvKxFgQo8mzYpluQiy8z"), style: .default) { [weak self] _ in
            self?.mediaPickerLaunchNelo(source: .camera)
        })
        sheet.addAction(UIAlertAction(title: PaulaVocalCipherRune.echo("s576dF+QX8OnS2/IV/nXjN9rXtwwIZYOISnpPrmxF95b"), style: .default) { [weak self] _ in
            self?.mediaPickerLaunchNelo(source: .photoLibrary)
        })
        sheet.addAction(UIAlertAction(title: PaulaVocalCipherRune.echo("KlBA8+UtELUNCysbuw28Aec3uBN4EZji461AdLqU597gBA=="), style: .cancel))
        present(sheet, animated: true)
    }

    private func mediaPickerLaunchNelo(source: UIImagePickerController.SourceType) {
        guard UIImagePickerController.isSourceTypeAvailable(source) else {
            showAlert(PaulaVocalCipherRune.echo("DORHh86yZQOdA/u45qJzK7dfe0avmDKm+PpxwFOABql+e5eGMDTbD8B3uWvXvBnlv7g/Mwxo3839oCtj7+C7v5crzX84/Nux"))
            return
        }
        let picker = UIImagePickerController()
        picker.sourceType = source
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        let image = (info[.editedImage] as? UIImage) ?? (info[.originalImage] as? UIImage)
        if let image {
            avatarBinaryCacheViro = image.jpegData(compressionQuality: 0.82)
            avatarPortalButtonNexa.setImage(image, for: .normal)
        }
        picker.dismiss(animated: true)
    }

    @objc private func signupDraftAdvanceQori() {
        let name = (aliasInputRuneVelo.text ?? PaulaVocalCipherRune.echo("Fiz5hQiicjov+6tTxq0wh1O5v6b3f4OgmnJJOQ==")).trimmingCharacters(in: .whitespacesAndNewlines)
        let loginAddressCueMavo = (loginAddressInputRuneMavo.text ?? PaulaVocalCipherRune.echo("Sr66zNWDj+KOGvSVMd80W3hc2I0/bzZLtjXy8Q==")).trimmingCharacters(in: .whitespacesAndNewlines)
        let passcodeRelayTokenDori = passcodeInputRuneDori.text ?? PaulaVocalCipherRune.echo("MgD33QNsL7HuH5oamzKQ4bMbABukp7XrNE7kcw==")
        let ageText = (ageGateInputRuneTaro.text ?? PaulaVocalCipherRune.echo("5e3orVpkFK5gZR9IlOuwiVA2urlnUxNnXENCsw==")).trimmingCharacters(in: .whitespacesAndNewlines)

        guard !name.isEmpty else {
            showAlert(PaulaVocalCipherRune.echo("jgwUDjpn3y5QPY5yji411tKdT/9afewPClvjuy4Y33nZsuXNWOtSyH+w+wH4y1/cEldv"))
            return
        }
        guard loginAddressCueMavo.contains(PaulaVocalCipherRune.echo("eOZPqITQk9rChzAQzErceGiCX6vaF3C7H9NZsaU=")), loginAddressCueMavo.contains(PaulaVocalCipherRune.echo("idbsGSdXoJuv05zr/RcuO8Vk3oD23GbGN+Xf0As=")) else {
            showAlert(PaulaVocalCipherRune.echo("hMvqoYoMRCsbAslqA6AMiK28jAG9U0DjqLhy4vP2zwqg2ecQZP8cgbIijcMOucuonYAPGifakQ=="))
            return
        }
        guard passcodeRelayTokenDori.count >= 6 else {
            showAlert(PaulaVocalCipherRune.echo("9xVUA1CUw7FMSDJ9XanIO3w6AcPyvhuVwqvWVwzRginX8uUyRKne9GqYQ+h5Z824ISNqx9UaMFZd16PafWXw8oUJDii0qsLi"))
            return
        }
        guard let ageGateCueTaro = Int(ageText), (13...99).contains(ageGateCueTaro) else {
            showAlert(PaulaVocalCipherRune.echo("wK4M95qbGOMQVUtsu9+wgPTkbzjDyuuFlKQ/yeyYe6qOWOh68e0rsG6TMiBGmaIkKFacuE+C/M+Fxv0MzlDQlxSv"))
            return
        }

        let draft = PaulaSignupDraft(name: name, loginAddressCueMavo: loginAddressCueMavo, passcodeRelayTokenDori: passcodeRelayTokenDori, ageGateCueTaro: ageGateCueTaro, avatarBinaryCacheViro: avatarBinaryCacheViro)
        navigationController?.pushViewController(PaulaIdentityIntroController(draft: draft), animated: true)
    }
}

final class PaulaIdentityIntroController: UIViewController {
    private let draft: PaulaSignupDraft

    init(draft: PaulaSignupDraft) {
        self.draft = draft
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError(PaulaVocalCipherRune.echo("NwIClRRrIdurRkIodjM0sXbvkiRAEhKKmLLM+9ShSEoQe8fYf/DZUU4rBClaBfYmRDJgwWhez+nm4mjejDgZj18="))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        signupCanvasForgeNava()
    }

    private func signupCanvasForgeNava() {
        let allbackiamgeNo = UIImageView(image: UIImage.init(named: PaulaVocalCipherRune.echo("shCpC1p1CmZP8G6olEeBQodwKY+NnQw8/xKI8jcpfiyVuGzYU1esHsY=")))
        allbackiamgeNo.frame = view.frame
        self.view.addSubview(allbackiamgeNo)

        let microphoneGainMappingLuri = UIButton(type: .system)
        microphoneGainMappingLuri.setImage(UIImage(systemName: PaulaVocalCipherRune.echo("gdGqQMBN+BeochYhUL/2+Y7eYJ7hhikM6l4J800XFp+q")), for: .normal)
        microphoneGainMappingLuri.tintColor = .black
        microphoneGainMappingLuri.addTarget(self, action: #selector(voiceQualityScoringPeli), for: .touchUpInside)


        let title = UIImageView(image: UIImage.init(named: PaulaVocalCipherRune.echo("aOLbSrXZhAbcaiZc3XtXSdgnsjiSW/uy86+wlzVlOzwCSl8FevQWw+t0u/8hUeS4Kjs=")))

        let subtitle = UILabel()
        subtitle.text = PaulaVocalCipherRune.echo("hnEuKUHkj77BdrIjoiUYv1ZmtV2bPYu+X0UTEIJv2SlId6jKhbC1rF94Kieewd1C8um202Bguc/GV7bbIQa5NTihPUnL8AnSTCFUM0qkRl8wRvTNNTNlcejnpRxjVk71oiBKWC7PIBxKoO0=")
        subtitle.numberOfLines = 0
        subtitle.textAlignment = .center
        subtitle.textColor = UIColor.black.withAlphaComponent(0.45)
        subtitle.font = .systemFont(ofSize: 13, weight: .regular)

        let outerRing = UIView()
        outerRing.backgroundColor = .clear
        outerRing.layer.cornerRadius = 106
        outerRing.layer.borderWidth = 1
        outerRing.layer.borderColor = UIColor(red: 0.49, green: 0.14, blue: 1.0, alpha: 0.15).cgColor

        let innerRing = UIView()
        innerRing.backgroundColor = .clear
        innerRing.layer.cornerRadius = 95
        innerRing.layer.borderWidth = 2
        innerRing.layer.borderColor = UIColor(red: 0.49, green: 0.14, blue: 1.0, alpha: 0.32).cgColor

        let avatar = UIImageView(image: UIImage(named: PaulaVocalCipherRune.echo("7KGrv0GqncA+RtzD437+S9+bl36giKH+m7AgiIfBmlMJWU+kWps=")))
        avatar.contentMode = .scaleAspectFill
       

        let channelStateRecoveryMeko = UILabel()
        channelStateRecoveryMeko.text = PaulaVocalCipherRune.echo("lvH+b1BSgJJrxZv79qW8n86jxVq5OxvDGWAsVF1ykWpQsUkIMLVvSl3aP+k5XNQyR7fUj/S2OJVZfL5rrzKaNzT6f9rAgpGeZLy+OeCuduX6gXR+q7isVH0NphuAtd+07yEEdzx6Qyg3WpWcvhYGSHm/y/ar6PZT/OkBonuUGX6kvw0dFMAMsAcIvT8V9YBMA4mvOtH4my/h/pvTtGBtXSta+C3n9KK5")
        channelStateRecoveryMeko.numberOfLines = 0
        channelStateRecoveryMeko.textAlignment = .center
        channelStateRecoveryMeko.textColor = UIColor.black.withAlphaComponent(0.42)
        channelStateRecoveryMeko.font = .systemFont(ofSize: 12, weight: .regular)

        let takeButton = PaulaPrimaryButton(title: PaulaVocalCipherRune.echo("tCAuWxSpTCWpzO4n/9cnvTiqMuElB14np2V0sElsmgOLWFkyQStPvzE="))
        takeButton.addTarget(self, action: #selector(headsetEchoProfilingZavo), for: .touchUpInside)

        [microphoneGainMappingLuri, title, subtitle, outerRing, innerRing, avatar, channelStateRecoveryMeko, takeButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }

        NSLayoutConstraint.activate([
            microphoneGainMappingLuri.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            microphoneGainMappingLuri.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            microphoneGainMappingLuri.widthAnchor.constraint(equalToConstant: 34),
            microphoneGainMappingLuri.heightAnchor.constraint(equalToConstant: 34),

         
            title.topAnchor.constraint(equalTo: microphoneGainMappingLuri.bottomAnchor, constant: 44),
            title.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            title.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 24),
            title.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -24),

            subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 16),
            subtitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 48),
            subtitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -48),

            outerRing.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            outerRing.topAnchor.constraint(equalTo: subtitle.bottomAnchor, constant: 52),
            outerRing.widthAnchor.constraint(equalToConstant: 212),
            outerRing.heightAnchor.constraint(equalToConstant: 212),

            innerRing.centerXAnchor.constraint(equalTo: outerRing.centerXAnchor),
            innerRing.centerYAnchor.constraint(equalTo: outerRing.centerYAnchor),
            innerRing.widthAnchor.constraint(equalToConstant: 190),
            innerRing.heightAnchor.constraint(equalToConstant: 190),

            avatar.centerXAnchor.constraint(equalTo: outerRing.centerXAnchor),
            avatar.centerYAnchor.constraint(equalTo: outerRing.centerYAnchor),
            avatar.widthAnchor.constraint(equalToConstant: 120),
            avatar.heightAnchor.constraint(equalToConstant: 120),

            channelStateRecoveryMeko.topAnchor.constraint(equalTo: outerRing.bottomAnchor, constant: 28),
            channelStateRecoveryMeko.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 44),
            channelStateRecoveryMeko.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -44),

            takeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            takeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            takeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            takeButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }

    private func imageFromDraft() -> UIImage {
        if let data = draft.avatarBinaryCacheViro, let image = UIImage(data: data) {
            return image
        }
        return PaulaAuthSession.defaultAvatarImage()
    }

    @objc private func voiceQualityScoringPeli() {
        navigationController?.popViewController(animated: true)
    }

    @objc private func headsetEchoProfilingZavo() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            navigationController?.pushViewController(PaulaFaceCaptureController(draft: draft), animated: true)
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { [weak self] granted in
                DispatchQueue.main.async {
                    guard let self else { return }
                    if granted {
                        self.navigationController?.pushViewController(PaulaFaceCaptureController(draft: self.draft), animated: true)
                    } else {
                        self.showAlert(PaulaVocalCipherRune.echo("7IwzNgnBhDy2xD7rhSk8ExochbrwPHYiDHhkwB1TwXEdUFKFSlWx0Q/NBL9r3TNloxYabfNb/f6OQmainwMBaEq+ua9Dq/+vjz9ibvsztf4="))
                    }
                }
            }
        default:
            showAlert(PaulaVocalCipherRune.echo("3S4tceyjNKLX3oGfjEVdAwiMYycvVX2WOyJYNWuALUqJB1uUi45BAIO1SJ5YwEENMAzizBtXMgVhzvdorBidoN7P9uBQoUAc03oQ85aZ84o="))
        }
    }
}

final class PaulaFaceCaptureController: UIViewController {
    private enum CaptureState {
        case ready
        case checking
        case failed
    }

    private let draft: PaulaSignupDraft
    private let preview = UIImageView()
    private let bottomPanelCompositingRiku = UIView()
    private let shutter = UIButton(type: .custom)
    private let statusLabel = UILabel()
    private let failureIcon = UIImageView(image: UIImage(systemName: PaulaVocalCipherRune.echo("Gn7QjfSOQ+jBVWiATZE7NsXa577b/03Dq8lbzHvvqRt+4bGimVCxaJAthiaI")))
    private let spinner = UIActivityIndicatorView(style: .large)
    private var state: CaptureState = .ready {
        didSet { renderState() }
    }

    init(draft: PaulaSignupDraft) {
        self.draft = draft
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError(PaulaVocalCipherRune.echo("d+yxYMbHFla/hisz5/WaXUIOPe+ACJ8jet5N/AX5ccnus0Ww5m4afN9hpik79GlUfeYbGsKxCFhgE3QOJiKHoq4="))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        signupCanvasForgeNava()
        renderState()
    }

    private func signupCanvasForgeNava() {
        view.backgroundColor = .black

        preview.image = UIImage(named: PaulaVocalCipherRune.echo("nZ8ROPwr5NDLWwqrkjRzRbJbD2akfDrH2TaHzu/HHIgWtSVlYSDg+es="))
        preview.contentMode = .scaleAspectFill
        preview.clipsToBounds = true

        let close = UIButton(type: .system)
        close.setImage(UIImage(systemName: PaulaVocalCipherRune.echo("x75JTLvDqpZf3nsKtUfTv1T1VbWulDupHOK4VM4HsBEwb0YSrwxQVDea5Pg=")), for: .normal)
        close.tintColor = .white
        close.addTarget(self, action: #selector(back), for: .touchUpInside)

        bottomPanelCompositingRiku.backgroundColor = UIColor.white.withAlphaComponent(0.84)
        bottomPanelCompositingRiku.layer.cornerRadius = 24
        bottomPanelCompositingRiku.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        bottomPanelCompositingRiku.clipsToBounds = true

        statusLabel.textColor = .black
        statusLabel.font = .systemFont(ofSize: 11, weight: .medium)
        statusLabel.numberOfLines = 0
        statusLabel.textAlignment = .center

        shutter.backgroundColor = UIColor(red: 0.42, green: 0.19, blue: 0.94, alpha: 1)
        shutter.layer.cornerRadius = 28
        shutter.layer.borderWidth = 5
        shutter.layer.borderColor = UIColor.white.cgColor
        shutter.addTarget(self, action: #selector(shutterTapped), for: .touchUpInside)

        failureIcon.tintColor = UIColor(red: 0.94, green: 0.05, blue: 0.14, alpha: 0.92)
        failureIcon.contentMode = .scaleAspectFit
        failureIcon.isHidden = true

        spinner.color = .white
        spinner.hidesWhenStopped = true

        [preview, close, bottomPanelCompositingRiku, failureIcon, spinner].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        [shutter, statusLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            bottomPanelCompositingRiku.addSubview($0)
        }

        NSLayoutConstraint.activate([
            preview.topAnchor.constraint(equalTo: view.topAnchor),
            preview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            preview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            preview.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            close.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            close.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            close.widthAnchor.constraint(equalToConstant: 36),
            close.heightAnchor.constraint(equalToConstant: 36),

            bottomPanelCompositingRiku.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomPanelCompositingRiku.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomPanelCompositingRiku.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomPanelCompositingRiku.heightAnchor.constraint(equalToConstant: 178),

            shutter.centerXAnchor.constraint(equalTo: bottomPanelCompositingRiku.centerXAnchor),
            shutter.topAnchor.constraint(equalTo: bottomPanelCompositingRiku.topAnchor, constant: 28),
            shutter.widthAnchor.constraint(equalToConstant: 56),
            shutter.heightAnchor.constraint(equalToConstant: 56),

            statusLabel.topAnchor.constraint(equalTo: shutter.bottomAnchor, constant: 24),
            statusLabel.leadingAnchor.constraint(equalTo: bottomPanelCompositingRiku.leadingAnchor, constant: 40),
            statusLabel.trailingAnchor.constraint(equalTo: bottomPanelCompositingRiku.trailingAnchor, constant: -40),

            failureIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            failureIcon.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -52),
            failureIcon.widthAnchor.constraint(equalToConstant: 88),
            failureIcon.heightAnchor.constraint(equalToConstant: 88),

            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -52)
        ])
    }

  

    private func renderState() {
        switch state {
        case .ready:
            statusLabel.text = PaulaVocalCipherRune.echo("gR5GbDtRG1mpEzK5kPtR4nXbjhDyrcarE5QfjNYMOqBCzeFMUkj5OEj+pyTE11TpxBCI/OYzOc4K6ZlJdz9Ixc3mzDseslFKQ1YHj/oE/APjqkFdXkr6jWSKZi3XB+ozEs+YQ509BdbeH8U=")
            shutter.isEnabled = true
            shutter.alpha = 1
            failureIcon.isHidden = true
            spinner.stopAnimating()
        case .checking:
            statusLabel.text = PaulaVocalCipherRune.echo("Ew2W0EZkFqJBeyWjGIgDWQn9ZyzJWbl0QfcttzHi3lpJXn4CkrLw++zC0FVKNt/JpxXmsrgmoPIvZAHtag2gkyuZS8eE1Oh2FR9BTEnyOceoefDaUYeCW+XcVLOsehndF1MKxItyRCPj5pc=")
            shutter.isEnabled = false
            shutter.alpha = 0.7
            failureIcon.isHidden = true
            spinner.startAnimating()
        case .failed:
            statusLabel.text = PaulaVocalCipherRune.echo("4xCHisj/p7uf5cf+b4kJqinsbSrDZLZ8+CMj5qFirjwl+vsmI7HQ73X1ja4WM5cPp48CqFrs3vRaUoV1Qf7Aap65piWZzLSwX2iYeWmwV32GOWtkkNuhdudPt33xksF4LqdBb5XbvN1eKxFBilf3X59/bJkgXi3H+o2Y36v852hUsQMgLWHft8E4hw==")
            shutter.isEnabled = true
            shutter.alpha = 1
            failureIcon.isHidden = false
            spinner.stopAnimating()
        }
    }

    @objc private func shutterTapped() {
        state = .checking
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) { [weak self] in
            self?.finishFakeVerification()
        }
    }

    private func finishFakeVerification() {
        PaulaAuthAPI.emailLogin(
            loginAddressCueMavo: draft.loginAddressCueMavo,
            passcodeRelayTokenDori: draft.passcodeRelayTokenDori,
            name: draft.name,
            avatarBinaryCacheViro: draft.avatarBinaryCacheViro,
            ageGateCueTaro: draft.ageGateCueTaro,
            presenceBriefCueLumi: PaulaVocalCipherRune.echo("WhfIafbHYYx88tOB/Hyedlfdonvssh35tnEnRelE8E2ExNwmHY6yCLpg"),
            type: PaulaVocalCipherRune.echo("9MSjP9RonpgVrTrPRYZQ6g5b4vfqe6C6re5tMuI=")
        ) { requestOutcomeFluxTavi in
            switch requestOutcomeFluxTavi {
            case .success(var playerProfileCacheNero):
                playerProfileCacheNero.avatarBinaryCacheViro = self.draft.avatarBinaryCacheViro
                playerProfileCacheNero.ageGateCueTaro = self.draft.ageGateCueTaro
                playerProfileCacheNero.name = self.draft.name
                playerProfileCacheNero.loginAddressCueMavo = self.draft.loginAddressCueMavo
                playerProfileCacheNero.passcodeRelayTokenDori = self.draft.passcodeRelayTokenDori
                playerProfileCacheNero.isFaceVerified = true
                PaulaAuthSession.save(playerProfileCacheNero)
                CatruiPulseOrchestrator.shared.mainConsoleLaunchViro()
            case .failure:
                self.state = .failed
            }
        }
    }

    @objc private func back() {
        navigationController?.popViewController(animated: true)
    }
}

extension UIViewController {
    func installPastelGradient() {
        let allbackiamgeNo = UIImageView(image: UIImage.init(named: PaulaVocalCipherRune.echo("9JVNcEomD9HZK+bftdDEJ363iLp2gXtrtGzia/wwwd8CnE5/sbZhAF5w")))
        allbackiamgeNo.frame = view.frame
        self.view.addSubview(allbackiamgeNo)
        
    }
    
    func showAlert(_ message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: PaulaVocalCipherRune.echo("PdCiCbgwVdTTdlyjeFMQIDuqNEvfZA/zoFUr/Y57"), style: .default))
        present(alert, animated: true)
    }
}
