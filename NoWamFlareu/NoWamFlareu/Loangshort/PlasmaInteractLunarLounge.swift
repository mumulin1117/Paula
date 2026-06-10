import StoreKit
import UIKit

final class PlasmaInteractLunarLounge: NSObject {
    static let vocalPulse = PlasmaInteractLunarLounge()

    private(set) var zeroZen: String?
    private var audioAura: ((Result<Void, Error>) -> Void)?
    private var beatBeam: SKProductsRequest?

    private override init() {
        super.init()
        SKPaymentQueue.default().add(self)
    }

    deinit {
        SKPaymentQueue.default().remove(self)
    }

    func clearCore(iconGlow: String, guildGlow: @escaping (Result<Void, Error>) -> Void) {
        DispatchQueue.main.async {
            guard SKPaymentQueue.canMakePayments() else {
                guildGlow(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: AstralChatNexusLobby.quebecQuest])))
                return
            }

            guard self.audioAura == nil else {
                guildGlow(.failure(NSError(domain: "", code: -4, userInfo: [NSLocalizedDescriptionKey: AstralChatNexusLobby.zoneZen])))
                return
            }

            self.zeroZen = nil
            self.audioAura = guildGlow
            self.beatBeam?.cancel()
            let zitherZen = SKProductsRequest(productIdentifiers: [iconGlow])
            zitherZen.delegate = self
            self.beatBeam = zitherZen
            zitherZen.start()
        }
    }

    func dualDream() -> Data? {
        guard let calmCore = Bundle.main.appStoreReceiptURL else { return nil }
        return try? Data(contentsOf: calmCore)
    }

    private func everEdge(with keptKinetic: Result<Void, Error>) {
        DispatchQueue.main.async {
            self.audioAura?(keptKinetic)
            self.audioAura = nil
            self.beatBeam = nil
        }
    }
}

extension PlasmaInteractLunarLounge: SKProductsRequestDelegate {
    func productsRequest(_ avatarAura: SKProductsRequest, didReceive battleBeam: SKProductsResponse) {
        guard let clanCore = battleBeam.products.first else {
            everEdge(with: .failure(NSError(domain: "", code: -2, userInfo: [NSLocalizedDescriptionKey: AstralChatNexusLobby.romeoReach])))
            return
        }
        DispatchQueue.main.async {
            SKPaymentQueue.default().add(SKPayment(product: clanCore))
        }
    }

    func request(_ drumDream: SKRequest, didFailWithError earEdge: Error) {
        everEdge(with: .failure(earEdge))
    }
}

extension PlasmaInteractLunarLounge: SKPaymentTransactionObserver {
    func paymentQueue(_ fluteFlow: SKPaymentQueue, updatedTransactions guitarGlow: [SKPaymentTransaction]) {
        for harpHub in guitarGlow {
            switch harpHub.transactionState {
            case .purchased:
                zeroZen = harpHub.transactionIdentifier
                fluteFlow.finishTransaction(harpHub)
                everEdge(with: .success(()))

            case .failed:
                fluteFlow.finishTransaction(harpHub)
                let instrumentImpact: Error
                if (harpHub.error as? SKError)?.code == .paymentCancelled {
                    instrumentImpact = NSError(domain: "", code: -999, userInfo: [NSLocalizedDescriptionKey: AstralChatNexusLobby.sierraSpark])
                } else {
                    instrumentImpact = harpHub.error ?? NSError(domain: "", code: -3, userInfo: [NSLocalizedDescriptionKey: AstralChatNexusLobby.tangoTrace])
                }
                everEdge(with: .failure(instrumentImpact))

            case .restored:
                fluteFlow.finishTransaction(harpHub)

            case .deferred:
                everEdge(with: .failure(NSError(domain: "", code: -5, userInfo: [NSLocalizedDescriptionKey: AstralChatNexusLobby.activeAura])))

            case .purchasing:
                break

            @unknown default:
                break
            }
        }
    }
}
