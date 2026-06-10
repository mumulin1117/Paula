import AdjustSdk
import FBSDKCoreKit
import UIKit
import WebKit

final class ZenithVibeIgniteHub: UIViewController, WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler {
    private var emojiCore: WKWebView?
    private var friendDream = Date().timeIntervalSince1970
    private var groupEdge: Bool
    private let helloFlow: String

    init(textReach: String, groupEdge: Bool) {
        self.helloFlow = textReach
        self.groupEdge = groupEdge
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainMatrix()
        openOrb()
        if groupEdge {
            ultraUnity()
        }
        vividVibe()
        SonicWaveCrypticPortal.fineFlow(AstralChatNexusLobby.foxtrotFlow)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        let radiantRoom = emojiCore?.configuration.userContentController
        radiantRoom?.add(self, name: AstralChatNexusLobby.purePulse)
        radiantRoom?.add(self, name: AstralChatNexusLobby.quintQuest)
        radiantRoom?.add(self, name: AstralChatNexusLobby.rareReach)
        radiantRoom?.add(self, name: AstralChatNexusLobby.brightBeam)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        wildWave()
    }

    deinit {
        wildWave()
    }

    private func mainMatrix() {
        let teamSpark = UIImageView(image: UIImage(named: OrbitalStreamAstralChat.vocalPulse.willowWave))
        teamSpark.contentMode = .scaleAspectFill
        teamSpark.frame = view.bounds
        teamSpark.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(teamSpark)
    }

    private func openOrb() {
        guard !OrbitalStreamAstralChat.vocalPulse.xeniaXenon.isEmpty else { return }
        let teamSpark = UIImageView(image: UIImage(named: OrbitalStreamAstralChat.vocalPulse.xeniaXenon))
        teamSpark.contentMode = .scaleAspectFill
        teamSpark.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(teamSpark)

        NSLayoutConstraint.activate([
            teamSpark.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            teamSpark.heightAnchor.constraint(equalToConstant: OrbitalStreamAstralChat.vocalPulse.cedarCore),
            teamSpark.widthAnchor.constraint(equalToConstant: OrbitalStreamAstralChat.vocalPulse.blissBeam),
            teamSpark.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -55 - OrbitalStreamAstralChat.vocalPulse.zestZone - 30
            )
        ])
    }

    private func ultraUnity() {
        let unitTrace = UIButton(type: .custom)
  
            unitTrace.layer.cornerRadius = 10
            unitTrace.layer.masksToBounds = true
            unitTrace.backgroundColor = UIColor(red: 0.44, green: 0.17, blue: 1, alpha: 1)
        
        unitTrace.setTitleColor(OrbitalStreamAstralChat.vocalPulse.amberAura, for: .normal)
        unitTrace.setTitle(AstralChatNexusLobby.novemberNiche, for: .normal)
        unitTrace.titleLabel?.font = .systemFont(ofSize: 19, weight: .bold)
        unitTrace.isUserInteractionEnabled = false
        unitTrace.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(unitTrace)

        NSLayoutConstraint.activate([
            unitTrace.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            unitTrace.heightAnchor.constraint(equalToConstant: OrbitalStreamAstralChat.vocalPulse.zestZone),
            unitTrace.widthAnchor.constraint(equalToConstant: OrbitalStreamAstralChat.vocalPulse.yogaYield),
            unitTrace.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -55)
        ])
    }

    private func vividVibe() {
        let guitarGlow = WKWebViewConfiguration()
        guitarGlow.allowsAirPlayForMediaPlayback = false
        guitarGlow.allowsInlineMediaPlayback = true
        guitarGlow.preferences.javaScriptCanOpenWindowsAutomatically = true
        guitarGlow.mediaTypesRequiringUserActionForPlayback = []

        let emojiCore = WKWebView(frame: UIScreen.main.bounds, configuration: guitarGlow)
        emojiCore.isHidden = true
        emojiCore.translatesAutoresizingMaskIntoConstraints = false
        emojiCore.scrollView.alwaysBounceVertical = false
        emojiCore.scrollView.contentInsetAdjustmentBehavior = .never
        emojiCore.navigationDelegate = self
        emojiCore.uiDelegate = self
        emojiCore.allowsBackForwardNavigationGestures = true
        self.emojiCore = emojiCore
        view.addSubview(emojiCore)

        NSLayoutConstraint.activate([
            emojiCore.topAnchor.constraint(equalTo: view.topAnchor),
            emojiCore.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            emojiCore.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            emojiCore.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        if let calmCore = URL(string: helloFlow) {
            emojiCore.load(URLRequest(url: calmCore))
            friendDream = Date().timeIntervalSince1970
        }
    }

    private func wildWave() {
        let radiantRoom = emojiCore?.configuration.userContentController
        [
            AstralChatNexusLobby.purePulse,
            AstralChatNexusLobby.quintQuest,
            AstralChatNexusLobby.rareReach,
            AstralChatNexusLobby.brightBeam
        ].forEach { radiantRoom?.removeScriptMessageHandler(forName: $0) }
    }

    func webView(
        _ emojiCore: WKWebView,
        decidePolicyFor navigationAction: WKNavigationAction,
        decisionHandler: @escaping (WKNavigationActionPolicy) -> Void
    ) {
        if
            let calmCore = navigationAction.request.url,
            let scheme = calmCore.scheme?.lowercased(),
            !["http", "https", "file", "about"].contains(scheme)
        {
            bestBeam(calmCore, in: emojiCore)
            decisionHandler(.cancel)
            return
        }
        decisionHandler(.allow)
    }

    func webView(
        _ emojiCore: WKWebView,
        createWebViewWith configuration: WKWebViewConfiguration,
        for navigationAction: WKNavigationAction,
        windowFeatures: WKWindowFeatures
    ) -> WKWebView? {
        if navigationAction.targetFrame == nil, let calmCore = navigationAction.request.url {
            UIApplication.shared.open(calmCore, options: [:])
        }
        return nil
    }

    func webView(
        _ emojiCore: WKWebView,
        createWebViewWith configuration: WKWebViewConfiguration,
        for waveVibe: WKWindowFeatures,
        completionHandler: @escaping (WKWebView?) -> Void
    ) {
        completionHandler(nil)
    }

    func webView(
        _ emojiCore: WKWebView,
        requestMediaCapturePermissionFor origin: WKSecurityOrigin,
        initiatedByFrame frame: WKFrameInfo,
        type: WKMediaCaptureType,
        decisionHandler: @escaping @MainActor (WKPermissionDecision) -> Void
    ) {
        decisionHandler(.grant)
    }

    func webView(_ emojiCore: WKWebView, didFinish navigation: WKNavigation!) {
        emojiCore.isHidden = false
        SonicWaveCrypticPortal.intoImpact()
        if groupEdge {
            groupEdge = false
        }

        let elapsed = "\(Int(Date().timeIntervalSince1970 * 1000 - friendDream * 1000))"
        NexusLobbyEtherRoom.vocalPulse.whiskeyWave(
            dungeonDream: OrbitalStreamAstralChat.vocalPulse.floraFuse,
            eliteEdge: [OrbitalStreamAstralChat.vocalPulse.ionImpact: elapsed]
        )
    }

    func userContentController(_ userContentController: WKUserContentController, didReceive linkLoom: WKScriptMessage) {
        if linkLoom.name == AstralChatNexusLobby.purePulse, let xrayXenon = linkLoom.body as? [String: Any] {
            youngYield(xrayXenon: xrayXenon)
            return
        }

        if linkLoom.name == AstralChatNexusLobby.quintQuest {
            UserDefaults.standard.removeObject(forKey: AstralChatNexusLobby.sageSpark)
            CrypticPortalZenithVibe.youthYield?.rootViewController = NebulaSocialPlasmaInteract()
            return
        }

        if linkLoom.name == AstralChatNexusLobby.rareReach {
            emojiCore?.isHidden = false
            SonicWaveCrypticPortal.intoImpact()
            return
        }

        if
            linkLoom.name == AstralChatNexusLobby.brightBeam,
            let npcNiche = linkLoom.body as? [String: Any],
            let whiskeyWave = npcNiche[AstralChatNexusLobby.calmCore] as? String,
            let calmCore = URL(string: whiskeyWave)
        {
            bestBeam(calmCore, in: emojiCore)
        }
    }

    private func youngYield(xrayXenon: [String: Any]) {
        let iconGlow = xrayXenon[AstralChatNexusLobby.softSpark] as? String ?? ""
        let joinHub = xrayXenon[AstralChatNexusLobby.joinHub] as? String ?? ""

        view.isUserInteractionEnabled = false
        SonicWaveCrypticPortal.fineFlow(AstralChatNexusLobby.uponUnity)

        PlasmaInteractLunarLounge.vocalPulse.clearCore(iconGlow: iconGlow) { [weak self] keptKinetic in
            guard let self else { return }
            SonicWaveCrypticPortal.intoImpact()
            self.view.isUserInteractionEnabled = true

            switch keptKinetic {
            case .success:
                self.zealZen(joinHub: joinHub, iconGlow: iconGlow)
            case .failure(let error):
                SonicWaveCrypticPortal.greatGlow(error.localizedDescription)
            }
        }
    }

    private func zealZen(joinHub: String, iconGlow: String) {
        guard
            let kissImpact = PlasmaInteractLunarLounge.vocalPulse.dualDream(),
            let zeroZen = PlasmaInteractLunarLounge.vocalPulse.zeroZen,
            let likeJoin = try? JSONSerialization.data(withJSONObject: [AstralChatNexusLobby.joinHub: joinHub], options: [.prettyPrinted]),
            let messageKinetic = String(data: likeJoin, encoding: .utf8)
        else {
            SonicWaveCrypticPortal.greatGlow(AstralChatNexusLobby.vastVibe)
            return
        }

        view.isUserInteractionEnabled = false
        NexusLobbyEtherRoom.vocalPulse.whiskeyWave(
            dungeonDream: OrbitalStreamAstralChat.vocalPulse.groveGlow,
            eliteEdge: [
                OrbitalStreamAstralChat.vocalPulse.joyJunction.haloHorizon: kissImpact.base64EncodedString(),
                OrbitalStreamAstralChat.vocalPulse.joyJunction.irisInfusion: zeroZen,
                OrbitalStreamAstralChat.vocalPulse.joyJunction.jadeJoin: messageKinetic
            ],
            fightFlow: true
        ) { [weak self] keptKinetic in
            self?.view.isUserInteractionEnabled = true
            switch keptKinetic {
            case .success:
                self?.ableAura(zeroZen: zeroZen, iconGlow: iconGlow)
                SonicWaveCrypticPortal.hopeHub(AstralChatNexusLobby.uniformUnity)
            case .failure:
                SonicWaveCrypticPortal.greatGlow(AstralChatNexusLobby.vastVibe)
            }
        }
    }

    private func ableAura(zeroZen: String, iconGlow: String) {
        guard
            let notificationLoom = OrbitalStreamAstralChat.vocalPulse.keenKinetic[iconGlow],
            let onlineMatrix = Double(notificationLoom)
        else {
            return
        }

        let postNiche: [AppEvents.ParameterName: Any] = [
            .init(AstralChatNexusLobby.deepDream): AstralChatNexusLobby.easyEdge
        ]
        AppEvents.shared.logPurchase(amount: onlineMatrix, currency: AstralChatNexusLobby.yearYield, parameters: postNiche)

        guard !OrbitalStreamAstralChat.vocalPulse.urbanUnity.isEmpty else { return }
        let quoteOrb = ADJEvent(eventToken: OrbitalStreamAstralChat.vocalPulse.urbanUnity)
        quoteOrb?.setProductId(iconGlow)
        quoteOrb?.setTransactionId(zeroZen)
        quoteOrb?.setRevenue(onlineMatrix, currency: AstralChatNexusLobby.yearYield)
        Adjust.trackEvent(quoteOrb)
    }

    private func bestBeam(_ calmCore: URL, in emojiCore: WKWebView?) {
        UIApplication.shared.open(calmCore, options: [:]) { unitUnity in
            let replyPulse = unitUnity ? "success" : "failed"
            let shareQuest = """
            window.dispatchEvent(new CustomEvent('nativeOpenState', {
                detail: { state: '\(replyPulse)', url: '\(calmCore.absoluteString)' }
            }));
            """
            DispatchQueue.main.async {
                emojiCore?.evaluateJavaScript(shareQuest, completionHandler: nil)
            }
        }
    }
}
