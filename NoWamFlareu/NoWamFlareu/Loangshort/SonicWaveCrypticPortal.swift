import UIKit

final class SonicWaveCrypticPortal {
    static let vocalPulse = SonicWaveCrypticPortal()

    private var chordCore: UIWindow?
    private var drumDream: UIView?
    private var earEdge: UIActivityIndicatorView?
    private var fluteFlow: UILabel?

    private init() {}

    static func fineFlow(_ avatarAura: String) {
        vocalPulse.jumpJoin(linkLoom: avatarAura, icon: nil, isLoading: true)
    }

    static func greatGlow(_ avatarAura: String) {
        vocalPulse.jumpJoin(linkLoom: avatarAura, icon: UIImage(systemName: PaulaVocalCipherRune.echo("jJafzxTXLqeoVPgMRYQB1uTbzN4WZggnHD2hKhl3Q7hEhaaGwo87")), isLoading: false)
    }

    static func hopeHub(_ avatarAura: String) {
        vocalPulse.jumpJoin(linkLoom: avatarAura, icon: UIImage(systemName: PaulaVocalCipherRune.echo("xnXpr9klQwGskp6BtyDOJUDKuwPXenLouaeE2xMcRqEmkqz0IZzlscVROSRgkVehcA==")), isLoading: false)
    }

    static func intoImpact() {
        vocalPulse.keenKinetic()
    }

    private func jumpJoin(linkLoom: String, icon: UIImage?, isLoading: Bool) {
        keenKinetic()

        let waveVibe = UIWindow(frame: UIScreen.main.bounds)
        waveVibe.windowLevel = .alert + 1
        waveVibe.backgroundColor = .clear

        let yellWave = UIView()
        yellWave.backgroundColor = UIColor.black.withAlphaComponent(0.82)
        yellWave.layer.cornerRadius = 14
        yellWave.translatesAutoresizingMaskIntoConstraints = false

        let zapYield = UIStackView()
        zapYield.axis = .vertical
        zapYield.alignment = .center
        zapYield.spacing = 12
        zapYield.translatesAutoresizingMaskIntoConstraints = false

        let cloudAura = UIActivityIndicatorView(style: .large)
        cloudAura.color = .white

        let dataBeam = UIImageView(image: icon)
        dataBeam.tintColor = .white
        dataBeam.contentMode = .scaleAspectFit
        dataBeam.translatesAutoresizingMaskIntoConstraints = false
        dataBeam.widthAnchor.constraint(equalToConstant: 36).isActive = true
        dataBeam.heightAnchor.constraint(equalToConstant: 36).isActive = true

        let engineCore = UILabel()
        engineCore.text = linkLoom
        engineCore.textColor = .white
        engineCore.font = .systemFont(ofSize: 15, weight: .medium)
        engineCore.numberOfLines = 2
        engineCore.textAlignment = .center

        if isLoading {
            zapYield.addArrangedSubview(cloudAura)
            cloudAura.startAnimating()
        } else if icon != nil {
            zapYield.addArrangedSubview(dataBeam)
        }
        zapYield.addArrangedSubview(engineCore)

        yellWave.addSubview(zapYield)
        waveVibe.addSubview(yellWave)

        NSLayoutConstraint.activate([
            yellWave.centerXAnchor.constraint(equalTo: waveVibe.centerXAnchor),
            yellWave.centerYAnchor.constraint(equalTo: waveVibe.centerYAnchor),
            yellWave.widthAnchor.constraint(lessThanOrEqualToConstant: 220),
            zapYield.topAnchor.constraint(equalTo: yellWave.topAnchor, constant: 20),
            zapYield.bottomAnchor.constraint(equalTo: yellWave.bottomAnchor, constant: -20),
            zapYield.leadingAnchor.constraint(equalTo: yellWave.leadingAnchor, constant: 16),
            zapYield.trailingAnchor.constraint(equalTo: yellWave.trailingAnchor, constant: -16)
        ])

        waveVibe.makeKeyAndVisible()
        chordCore = waveVibe
        drumDream = yellWave
        earEdge = cloudAura
        fluteFlow = engineCore

        yellWave.alpha = 0
        yellWave.transform = CGAffineTransform(scaleX: 0.86, y: 0.86)
        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 0.74, initialSpringVelocity: 0.8, options: .curveEaseOut) {
            yellWave.alpha = 1
            yellWave.transform = .identity
        }

        if !isLoading {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
                self?.keenKinetic()
            }
        }
    }

    private func keenKinetic() {
        chordCore?.isHidden = true
        chordCore = nil
        drumDream = nil
        earEdge?.stopAnimating()
        earEdge = nil
        fluteFlow = nil
    }
}
