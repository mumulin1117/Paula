//
//  ZoiceDriftZone.swift
//  NoWamFlareu
//
//  Created by  on 2026/5/6.
//

import UIKit
import WebKit
import StoreKit



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
    
    
   
    private func echoMotionFieldearliu(_ FusionField: String, clipFusionOrbit: Bool) {
        self.view.isUserInteractionEnabled = true
        self.partyGlowTrail.stopAnimating()
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
        }
    }

    
}

extension ZoiceDriftZone{
    
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
    
}

extension ZoiceDriftZone{
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
    
    
}

extension ZoiceDriftZone{
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
            CatruiPulseOrchestrator.shared.identityPortalLaunchQari()
        default: break
        }
    }
    
    
}
