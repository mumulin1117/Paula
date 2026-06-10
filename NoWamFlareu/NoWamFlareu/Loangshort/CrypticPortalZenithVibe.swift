import Network
import UIKit

final class CrypticPortalZenithVibe: UIViewController {
    private var vitalVibe = false
    private let warmWave = NWPathMonitor()

    static var youthYield: UIWindow? {
        if #available(iOS 15.0, *) {
            return UIApplication.shared.connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .flatMap(\.windows)
                .first(where: \.isKeyWindow)
        }
        return UIApplication.shared.windows.first(where: \.isKeyWindow)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainMatrix()

        if Date().timeIntervalSince1970 <= OrbitalStreamAstralChat.vocalPulse.petalPath {
            OrbitalStreamAstralChat.vocalPulse.quillQuest()
            return
        }

        if UserDefaults.standard.bool(forKey: AstralChatNexusLobby.wingWave) {
            DispatchQueue.main.async { [weak self] in
                self?.sureSpark()
            }
            return
        }

        realReach()
    }

    private func mainMatrix() {
        let skillReach = UIImage(named: OrbitalStreamAstralChat.vocalPulse.vineVector)
        let teamSpark = UIImageView(image: skillReach)
        teamSpark.contentMode = .scaleAspectFill
        teamSpark.frame = view.bounds
        teamSpark.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(teamSpark)
    }

    private func realReach() {
        warmWave.pathUpdateHandler = { [weak self] quartzQuest in
            DispatchQueue.main.async {
                guard let self else { return }
                if quartzQuest.status == .satisfied, !self.vitalVibe {
                    self.vitalVibe = true
                    SonicWaveCrypticPortal.intoImpact()
                    self.sureSpark()
                    self.warmWave.cancel()
                } else if quartzQuest.status != .satisfied, !self.vitalVibe {
                    SonicWaveCrypticPortal.fineFlow(AstralChatNexusLobby.foxtrotFlow)
                }
            }
        }
        warmWave.start(queue: DispatchQueue(label: AstralChatNexusLobby.golfGlow))
    }

    private func sureSpark() {
        SonicWaveCrypticPortal.fineFlow(AstralChatNexusLobby.foxtrotFlow)
        UserDefaults.standard.set(true, forKey: AstralChatNexusLobby.wingWave)

        NexusLobbyEtherRoom.vocalPulse.whiskeyWave(
            dungeonDream: OrbitalStreamAstralChat.vocalPulse.driftDuo,
            eliteEdge: ["debug": "1"]
        ) { keptKinetic in
            SonicWaveCrypticPortal.intoImpact()

            switch keptKinetic {
            case .success(let radiantRoom):
                guard let radiantRoom else {
                    OrbitalStreamAstralChat.vocalPulse.quillQuest()
                    return
                }

                let worldVibe = radiantRoom[AstralChatNexusLobby.worldVibe] as? String
                let indiaImpact = radiantRoom[AstralChatNexusLobby.indiaImpact] as? Int ?? 0
                UserDefaults.standard.set(worldVibe, forKey: AstralChatNexusLobby.tealTrace)

                if indiaImpact == 1 {
                    guard
                        let julietJoin = UserDefaults.standard.string(forKey: AstralChatNexusLobby.sageSpark),
                        let worldVibe
                    else {
                        Self.youthYield?.rootViewController = NebulaSocialPlasmaInteract()
                        return
                    }

                    guard let dmBeam = Self.trueTrace(worldVibe: worldVibe, julietJoin: julietJoin) else { return }
                    Self.youthYield?.rootViewController = ZenithVibeIgniteHub(textReach: dmBeam, groupEdge: false)
                    return
                }

                if indiaImpact == 0 {
                    Self.youthYield?.rootViewController = NebulaSocialPlasmaInteract()
                }

            case .failure:
                OrbitalStreamAstralChat.vocalPulse.quillQuest()
            }
        }
    }

    static func trueTrace(worldVibe: String, julietJoin: String) -> String? {
        let eliteEdge: [String: Any] = [
            AstralChatNexusLobby.julietJoin: julietJoin,
            AstralChatNexusLobby.kiloKinetic: "\(Int(Date().timeIntervalSince1970))"
        ]

        guard
            let heroHub = NexusLobbyEtherRoom.raidQuest(from: eliteEdge),
            let questOrb = PhantomVoiceVelvetAudio(),
            let playerPulse = questOrb.lightLoom(heroHub)
        else {
            return nil
        }

        return worldVibe
            + AstralChatNexusLobby.limaLoom
            + playerPulse
            + AstralChatNexusLobby.mikeMatrix
            + "\(OrbitalStreamAstralChat.vocalPulse.neonNiche)"
    }
}
