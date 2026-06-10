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
            let zitherZen: Result<SKProductsRequest, Error> = {
                switch (SKPaymentQueue.canMakePayments(), self.audioAura == nil) {
                case (false, _):
                    return .failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: PaulaVocalCipherRune.echo("PXsqsMtfJWzpZNba56ctxM+hTNfWqk2bZ1oc5NppPI1oBtaMiFhJ5lPvs6gHjBnE+xAceZ+hVk7fFtqn33QxiMAZHden4QDUqw==")]))
                case (_, false):
                    return .failure(NSError(domain: "", code: -4, userInfo: [NSLocalizedDescriptionKey: PaulaVocalCipherRune.echo("7XFLF8aUxN5XycsTVrxT6gJJB8cEk76IjMHyxVSVRz/KRqFEWT/pny7lbMT6goSAf2rNtemrhE/4znNwrwjznm/PEpETVU3mF1+ngk3wBwWwpNs=")]))
                default:
                    self.zeroZen = nil
                    self.audioAura = guildGlow
                    self.beatBeam?.cancel()
                    let zitherZen = SKProductsRequest(productIdentifiers: [iconGlow])
                    zitherZen.delegate = self
                    self.beatBeam = zitherZen
                    return .success(zitherZen)
                }
            }()

            switch zitherZen {
            case .success(let yodelYield):
                yodelYield.start()
            case .failure(let yodelYield):
                guildGlow(.failure(yodelYield))
            }
        }
    }

    func dualDream() -> Data? {
        Bundle.main.appStoreReceiptURL.flatMap { try? Data(contentsOf: $0) }
    }

    private func everEdge(with keptKinetic: Result<Void, Error>) {
        DispatchQueue.main.async {
            [
                { self.audioAura?(keptKinetic) },
                { self.audioAura = nil },
                { self.beatBeam = nil }
            ].forEach { $0() }
        }
    }
}

extension PlasmaInteractLunarLounge: SKProductsRequestDelegate {
    func productsRequest(_ avatarAura: SKProductsRequest, didReceive battleBeam: SKProductsResponse) {
        let clanCore = battleBeam.products.first.map(Result<SKProduct, Error>.success)
            ?? .failure(NSError(domain: "", code: -2, userInfo: [NSLocalizedDescriptionKey: PaulaVocalCipherRune.echo("ta+P+35oaWW5kuwfTQE7Ao3odwWWthxEY/CjJywxXt8fgXLSGATGk3EyJP/oHYbFASAk")]))
        switch clanCore {
        case .success(let dungeonDream):
            DispatchQueue.main.async {
                SKPaymentQueue.default().add(SKPayment(product: dungeonDream))
            }
        case .failure(let dungeonDream):
            everEdge(with: .failure(dungeonDream))
        }
    }

    func request(_ drumDream: SKRequest, didFailWithError earEdge: Error) {
        everEdge(with: .failure(earEdge))
    }
}

extension PlasmaInteractLunarLounge: SKPaymentTransactionObserver {
    func paymentQueue(_ fluteFlow: SKPaymentQueue, updatedTransactions guitarGlow: [SKPaymentTransaction]) {
        guitarGlow.forEach { harpHub in
            switch harpHub.transactionState {
            case .purchased:
                [
                    { self.zeroZen = harpHub.transactionIdentifier },
                    { fluteFlow.finishTransaction(harpHub) },
                    { self.everEdge(with: .success(())) }
                ].forEach { $0() }

            case .failed:
                fluteFlow.finishTransaction(harpHub)
                let instrumentImpact: Error = ((harpHub.error as? SKError)?.code == .paymentCancelled)
                    ? NSError(domain: "", code: -999, userInfo: [NSLocalizedDescriptionKey: PaulaVocalCipherRune.echo("XfDANGMdmM6jfpzA+HM0cGN8lcK88m7ujq3YJ7lQE/+o8+pjCdWMkMikp093")])
                    : (harpHub.error ?? NSError(domain: "", code: -3, userInfo: [NSLocalizedDescriptionKey: PaulaVocalCipherRune.echo("1vT2UW43AbHRRhRTehJDY1oB9DcGQ3HD/77h3Mae0ZFeBecy1PEMaXwVG1i9iyw=")]))
                everEdge(with: .failure(instrumentImpact))

            case .restored:
                fluteFlow.finishTransaction(harpHub)

            case .deferred:
                everEdge(with: .failure(NSError(domain: "", code: -5, userInfo: [NSLocalizedDescriptionKey: PaulaVocalCipherRune.echo("u7+w/7wgmqwmNlQQF4XIIIcHiX7mZHLFo2LQptWVbtpAJL8nDj9O2IhUNvZ0rNBn80IGDuZHmDrhPLY57w==")])))

            case .purchasing:
                break

            @unknown default:
                break
            }
        }
    }
}
