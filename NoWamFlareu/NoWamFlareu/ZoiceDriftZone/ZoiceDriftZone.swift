//
//  ZoiceDriftZone.swift
//  NoWamFlareu
//
//  Created by  on 2026/5/6.
//

import UIKit
import WebKit
import StoreKit
//h5
class ZoiceDriftZone: UIViewController, WKScriptMessageHandler, WKNavigationDelegate, WKUIDelegate, SKPaymentTransactionObserver, SKProductsRequestDelegate {
    
    var arenaPulseFlux: Bool = false
    private var voiceOrbitMist: String?
    
 
    
    private lazy var partyGlowTrail: UIActivityIndicatorView = {
        let matchHarborRise = UIActivityIndicatorView.init(style: .large)
        matchHarborRise.frame.size = CGSize.init(width: 54, height: 54)
        matchHarborRise.tintColor = .black
        matchHarborRise.hidesWhenStopped = true
        matchHarborRise.color = .black
        return matchHarborRise
    }()
    
    private var playwaveCascade: String
    
    init(streamAuraShift: String) {
        self.playwaveCascade = streamAuraShift
        super.init(nibName: nil, bundle: nil)
        SKPaymentQueue.default().add(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    deinit {
        SKPaymentQueue.default().remove(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hidesBottomBarWhenPushed = true
        navigationController?.setNavigationBarHidden(true, animated: false)
        let clipMotionNest = UIImageView(frame: UIScreen.main.bounds)
        clipMotionNest.contentMode = .scaleAspectFill
        clipMotionNest.image = UIImage(named: "nerevertSignu")
        self.view.addSubview(clipMotionNest)
        
        self.view.backgroundColor = .black
        self.view.addSubview(self.gameriftOrbit)
        gameriftOrbit.navigationDelegate = self
        
        gameriftOrbit.scrollView.contentInsetAdjustmentBehavior = .never
        if let voiceFusionPeak = URL(string: playwaveCascade) {
            let arenaNovaTrail = URLRequest(url: voiceFusionPeak)
            gameriftOrbit.load(arenaNovaTrail)
        }
        self.partyGlowTrail.center = self.view.center
        self.view.addSubview(self.partyGlowTrail)
        self.partyGlowTrail.startAnimating()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hidesBottomBarWhenPushed = true
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
    

    
    private lazy var gameriftOrbit: WKWebView = {
        let partyRhythmCore: [String] = ["weakReferencePoagma", "threeDimensionalPoagma", "topologyLogicPoagma", "treeStructurePoagma", "vocalSynthesisPoagma","transactionLogPoagma"]
        
        let clipFusionRise = WKWebViewConfiguration()
        clipFusionRise.mediaTypesRequiringUserActionForPlayback = []
        clipFusionRise.allowsInlineMediaPlayback = true
        clipFusionRise.preferences.javaScriptCanOpenWindowsAutomatically = true
        partyRhythmCore.forEach { TOWINKLIopNode in
            clipFusionRise.userContentController.add(self, name: TOWINKLIopNode)
        }
        
        let arenaFusionTrail = WKWebView(frame: UIScreen.main.bounds, configuration: clipFusionRise)
        arenaFusionTrail.scrollView.showsVerticalScrollIndicator = false
        arenaFusionTrail.uiDelegate = self
        arenaFusionTrail.backgroundColor = .clear
        arenaFusionTrail.isHidden = true
        return arenaFusionTrail
    }()
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            webView.isHidden = false
            self.partyGlowTrail.stopAnimating()
        }
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        switch message.name {
        case "threeDimensionalPoagma":
            guard let echoPulseField = message.body as? String else { return }
            self.clipRhythmPeak(echoPulseField)
        case "treeStructurePoagma":
            if let partyWaveOrbit = message.body as? String {
                let streamSignalRise = ZoiceDriftZone(streamAuraShift: partyWaveOrbit)
                streamSignalRise.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(streamSignalRise, animated: true)
            }
        case "vocalSynthesisPoagma":
            if self.arenaPulseFlux {
                self.dismiss(animated: true)
            } else {
                self.navigationController?.popViewController(animated: true)
            }
        
        case "weakReferencePoagma":
            PaulaAuthSession.clear()
            CatruiPulseOrchestrator.shared.launchIdentityPortal()
        default: break
        }
    }
    
    private func clipRhythmPeak(_ TOWINKLIopId: String) {
        self.view.isUserInteractionEnabled = false
        self.partyGlowTrail.startAnimating()
        self.voiceOrbitMist = TOWINKLIopId
        
        let roomOrbitField = Set([TOWINKLIopId])
        let voiceHarborMist = SKProductsRequest(productIdentifiers: roomOrbitField)
        voiceHarborMist.delegate = self
        voiceHarborMist.start()
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        if let clipGlowRise = response.products.first {
            let partyMotionTrail = SKPayment(product: clipGlowRise)
            SKPaymentQueue.default().add(partyMotionTrail)
        } else {
            echoMotionFieldearliu("arenaFusionBloom", clipFusionOrbit: true)
        }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for partyWaveField in transactions {
            switch partyWaveField.transactionState {
            case .purchased:
                SKPaymentQueue.default().finishTransaction(partyWaveField)
                arenaPulseBloom()
            case .failed:
                SKPaymentQueue.default().finishTransaction(partyWaveField)
                echoMotionFieldearliu(partyWaveField.error?.localizedDescription ?? "Error", clipFusionOrbit: true)
            case .restored:
                SKPaymentQueue.default().finishTransaction(partyWaveField)
            default: break
            }
        }
    }
    
    private func arenaPulseBloom() {
        self.gameriftOrbit.evaluateJavaScript("topologyLogicPoagma()", completionHandler: nil)
        echoMotionFieldearliu("Pay successful!", clipFusionOrbit: false)
    }
    
    private func echoMotionFieldearliu(_ FusionField: String, clipFusionOrbit: Bool) {
        self.view.isUserInteractionEnabled = true
        self.partyGlowTrail.stopAnimating()
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
        }
    }

    
}



enum NWFUclipFusionOrbit: String {

    case NWFUclipPulseOrbit = "pages/LiveRoom/index?liveId="
    case NWFUMotionBloom = "pages/teachingRoom/index?liveId="
    case NWEUCascadeRise = "pages/VoiceChatRoom/index?liveId="
    case NWEUSignalBloom = "pages/notification/index?"
   
    case arenaWaveDrift = "pages/CreateRoom/index?"
    case echoFusionMist = "pages/AIHomepage/index?"
    case arenaSignalRise = "pages/homeInfo/index?userId="
    case clipRhythmTrail = "pages/message/index?userId="
    case arenaFusionRise = "pages/headSetting/index?"
    case echoOrbitField = "pages/editProfile/index?"
    
    case echoWaveRise = "pages/setting/index?"
    case streamRhythmField = "pages/RelationshipList/index?type="//（1关注 / 2粉丝 / 3黑名单）
    case arenaCascadeField = "pages/Agreement/index?type="//// 用户协议  // 隐私政策
    case streamOrbitBloom = "pages/report/index?"
    case arenaFusionTrail = "pages/goldCharge/index?"
    case echoPulseField = "pages/vipInfo/index?"

    case streamSignalRise = ""
    
    
    static var clipFusionHarbor: String? {
        get {
            return UserDefaults.standard.object(forKey: "clipFusionHarbor") as? String
        } set {
            UserDefaults.standard.set(newValue, forKey: "clipFusionHarbor")
        }
    }
    func voiceHarborMist(MotionTrail: String = "") -> String {
        let echoFusionOrbit = "https://b9v7c5x3z1a9s7d5f3g1h.shop/#"
        
        if self != .streamSignalRise {
            let streamMotionTrail = NWFUclipFusionOrbit.clipFusionHarbor ?? ""
            let voiceBeaconTrail = "41534325"
            
            let clipGlowNest = String(
                format: "%@%@%@&token=%@&appID=%@",
                echoFusionOrbit,
                self.rawValue,
                MotionTrail,
                streamMotionTrail,
                voiceBeaconTrail
            )
            
            return clipGlowNest
        }
        
        return echoFusionOrbit
    }
    
    static func arenaPulsePeak(
        WaveTrail: String,
        echoMotionOrbit: [String: Any],
        FusionTrail: ((Any?) -> Void)?,
        clipSignalBloom: ((Error) -> Void)?
    ) {
        guard let arenaNovaRise = URL(string: "https://b9v7c5x3z1a9s7d5f3g1h.shop/sevensocial" + WaveTrail) else { return }
        
        var echoRhythmTrail = matchSignalPeak(clipGlowRise: arenaNovaRise, Cascade: echoMotionOrbit)
        let arenaFusionPeak = ["key": "41534325", "token": NWFUclipFusionOrbit.clipFusionHarbor ?? ""]
        arenaFusionPeak.forEach { echoRhythmTrail.setValue($1, forHTTPHeaderField: $0) }
        
        let partyCascadeBloom = URLSessionConfiguration.default
        partyCascadeBloom.timeoutIntervalForRequest = 30
        
        URLSession(configuration: partyCascadeBloom).dataTask(with: echoRhythmTrail) { roomCascadePeak, _, clipGlowField in
            DispatchQueue.main.async {
                if let clipGlowRise = clipGlowField {
                    clipSignalBloom?(clipGlowRise)
                    return
                }
                guard let partyCascadeTrail = roomCascadePeak else { return }
                do {
                    let clipFusionOrbit = try JSONSerialization.jsonObject(with: partyCascadeTrail, options: .allowFragments)
                    FusionTrail?(clipFusionOrbit)
                } catch {
                    clipSignalBloom?(error)
                }
            }
        }.resume()
    }
    
    private static func matchSignalPeak(clipGlowRise: URL, Cascade: [String: Any]) -> URLRequest {
        var clipGlowNest = URLRequest(url: clipGlowRise, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30)
        clipGlowNest.httpMethod = "POST"
        clipGlowNest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        clipGlowNest.setValue("application/json", forHTTPHeaderField: "Accept")
        clipGlowNest.httpBody = try? JSONSerialization.data(withJSONObject: Cascade)
        return clipGlowNest
    }
}

extension UIViewController {
    func pushPaulaH5(_ route: NWFUclipFusionOrbit, param: String = "", animated: Bool = true) {
        let url = route.voiceHarborMist(MotionTrail: param)
        let webController = ZoiceDriftZone(streamAuraShift: url)
        webController.hidesBottomBarWhenPushed = true
        navigationController?.setNavigationBarHidden(true, animated: false)
        navigationController?.pushViewController(webController, animated: animated)
    }
}
