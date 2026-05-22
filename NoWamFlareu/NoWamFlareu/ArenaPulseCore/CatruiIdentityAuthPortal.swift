//
//  ArenaPulseCore.swift
//  NoWamFlareu
//
//  Created by  on 2026/5/6.
//

import UIKit

class CatruiIdentityAuthPortal: UIViewController {
    private let scrollFrameBudgetingLiroView = UIScrollView()
    private let contentStackHydrationRivoView = UIView()
    private let emailAuthParsingRivoInput = PaulaRoundTextField(systemLockIconRenderingPori: PaulaVocalCipherRune.echo("c1ZyCgwP3VmQvUm7pmQpwPlkifhwcXuhg4T95Vb6ukCCWV7uZTUDV+c="), placeholder: PaulaVocalCipherRune.echo("Pw1HXAeAgdnuTBY9oEH+gfn1E+11mP+6VdY0VD5/SXU7vF37UO96bnM48eY="))
    private let passwordGatePromptingZaliInput = PaulaRoundTextField(systemLockIconRenderingPori: PaulaVocalCipherRune.echo("xiJKJwkmFnoJBi81PDEX7sM70n4nd3aDBh/kXKA6kTYdBpJQkQ=="), placeholder: PaulaVocalCipherRune.echo("x5hWkkvV19FC0O2CZdXPubK4bxnKMRm1xkVtS+9LrwtOtjnEOObdgh1t"))
    private let authSessionPersistenceKumiButton = PaulaPrimaryButton(title: PaulaVocalCipherRune.echo("CyaL8EwPMRRJfJGEG7m3AKmDTXYuGlBsKCXVKsDvtNOH"))
    private let signupDraftStorageTaloButton = PaulaPrimaryButton(title: PaulaVocalCipherRune.echo("J/JKc3iF24WHJpBDQhhmPjVvlTNdQA9mARxo/vqDvlw1x++HsbRaeTxZhWFgkg=="), outlined: true)
    private let ageGateVerificationMaroCheck = PaulaCheckboxButton()
    private let loadingStateRenderingQavi = UIActivityIndicatorView(style: .large)

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        darkModeContrastLuma()
        identityPortalLaunchQariLayout()
    }

    private func darkModeContrastLuma() {
        installPastelGradient()
        navigationController?.isNavigationBarHidden = true
    }

    private func identityPortalLaunchQariLayout() {

        let eulaButton = UIButton()
        eulaButton.setImage(UIImage.init(named: PaulaVocalCipherRune.echo("VpjHHo4jYbjRasmcZ4z1/vFNmJ7fBtJS8cfPZ9q/RP+60NzY/pY=")), for: .normal)
        eulaButton.addTarget(self, action: #selector(agreementRouteMappingTeni), for: .touchUpInside)

     
        let titleLabel = UIImageView(image: UIImage.init(named: PaulaVocalCipherRune.echo("KaPLbCCgy/8IS4SjoJ+m7ZxBZT+g38gjtdmjyqfYPJaTCsgZnZY=")))
       

        passwordGatePromptingZaliInput.isSecureTextEntry = true
        emailAuthParsingRivoInput.keyboardType = .emailAddress

        let orLabel = UILabel()
        orLabel.text = PaulaVocalCipherRune.echo("019+Ky/Znf6trP97vF4PjB4ckdTnbzrqDCHm+x1k")
        orLabel.textColor = .white
        orLabel.font = .systemFont(ofSize: 17, weight: .bold)
        orLabel.textAlignment = .center

        let leftLine = UIView()
        let rightLine = UIView()
        [leftLine, rightLine].forEach {
            $0.backgroundColor = UIColor.white.withAlphaComponent(0.55)
        }

        let termsLabel = UILabel()
        termsLabel.text = PaulaVocalCipherRune.echo("BRtAIGMmMQiN4bcDP2HfU9Ee9f4H+2ZMD5Qs8h0eYxbPvXxjdKBMxVSDii6n+6GZQsy6zpNcJM2mWJn+c6SjIUiMvibDuik94EaRTVuM+wqQeY/hqam+D/eF5cKtrE1MhB0d")
        termsLabel.textColor = UIColor.black.withAlphaComponent(0.45)
        termsLabel.font = .systemFont(ofSize: 14, weight: .regular)
        termsLabel.numberOfLines = 0

        ageGateVerificationMaroCheck.isChecked = true
        loadingStateRenderingQavi.color = .white
        loadingStateRenderingQavi.hidesWhenStopped = true

        authSessionPersistenceKumiButton.addTarget(self, action: #selector(authSessionPersistenceKumi), for: .touchUpInside)
        signupDraftStorageTaloButton.addTarget(self, action: #selector(signupDraftStorageTalo), for: .touchUpInside)

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

        [

            eulaButton,
         
            titleLabel,
            emailAuthParsingRivoInput,
            passwordGatePromptingZaliInput,
            authSessionPersistenceKumiButton,
            leftLine,
            orLabel,
            rightLine,
            signupDraftStorageTaloButton,
            ageGateVerificationMaroCheck,
            termsLabel
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentStackHydrationRivoView.addSubview($0)
        }

        loadingStateRenderingQavi.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loadingStateRenderingQavi)

        NSLayoutConstraint.activate([

            eulaButton.topAnchor.constraint(equalTo: contentStackHydrationRivoView.safeAreaLayoutGuide.topAnchor, constant: 22),
            eulaButton.trailingAnchor.constraint(equalTo: contentStackHydrationRivoView.trailingAnchor, constant: -30),
            eulaButton.widthAnchor.constraint(equalToConstant: 82),
            eulaButton.heightAnchor.constraint(equalToConstant: 44),


            titleLabel.topAnchor.constraint(equalTo: contentStackHydrationRivoView.safeAreaLayoutGuide.topAnchor, constant: 270),
            titleLabel.trailingAnchor.constraint(equalTo: contentStackHydrationRivoView.trailingAnchor, constant: -46),

            emailAuthParsingRivoInput.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 88),
            emailAuthParsingRivoInput.leadingAnchor.constraint(equalTo: contentStackHydrationRivoView.leadingAnchor, constant: 40),
            emailAuthParsingRivoInput.trailingAnchor.constraint(equalTo: contentStackHydrationRivoView.trailingAnchor, constant: -40),
            emailAuthParsingRivoInput.heightAnchor.constraint(equalToConstant: 50),

            passwordGatePromptingZaliInput.topAnchor.constraint(equalTo: emailAuthParsingRivoInput.bottomAnchor, constant: 22),
            passwordGatePromptingZaliInput.leadingAnchor.constraint(equalTo: emailAuthParsingRivoInput.leadingAnchor),
            passwordGatePromptingZaliInput.trailingAnchor.constraint(equalTo: emailAuthParsingRivoInput.trailingAnchor),
            passwordGatePromptingZaliInput.heightAnchor.constraint(equalToConstant: 50),

            authSessionPersistenceKumiButton.topAnchor.constraint(equalTo: passwordGatePromptingZaliInput.bottomAnchor, constant: 34),
            authSessionPersistenceKumiButton.leadingAnchor.constraint(equalTo: contentStackHydrationRivoView.leadingAnchor, constant: 30),
            authSessionPersistenceKumiButton.trailingAnchor.constraint(equalTo: contentStackHydrationRivoView.trailingAnchor, constant: -30),
            authSessionPersistenceKumiButton.heightAnchor.constraint(equalToConstant: 56),

            orLabel.topAnchor.constraint(equalTo: authSessionPersistenceKumiButton.bottomAnchor, constant: 22),
            orLabel.centerXAnchor.constraint(equalTo: contentStackHydrationRivoView.centerXAnchor),
            orLabel.widthAnchor.constraint(equalToConstant: 44),

            leftLine.centerYAnchor.constraint(equalTo: orLabel.centerYAnchor),
            leftLine.leadingAnchor.constraint(equalTo: contentStackHydrationRivoView.leadingAnchor, constant: 52),
            leftLine.trailingAnchor.constraint(equalTo: orLabel.leadingAnchor, constant: -8),
            leftLine.heightAnchor.constraint(equalToConstant: 1),

            rightLine.centerYAnchor.constraint(equalTo: orLabel.centerYAnchor),
            rightLine.leadingAnchor.constraint(equalTo: orLabel.trailingAnchor, constant: 8),
            rightLine.trailingAnchor.constraint(equalTo: contentStackHydrationRivoView.trailingAnchor, constant: -52),
            rightLine.heightAnchor.constraint(equalToConstant: 1),

            signupDraftStorageTaloButton.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 22),
            signupDraftStorageTaloButton.leadingAnchor.constraint(equalTo: authSessionPersistenceKumiButton.leadingAnchor),
            signupDraftStorageTaloButton.trailingAnchor.constraint(equalTo: authSessionPersistenceKumiButton.trailingAnchor),
            signupDraftStorageTaloButton.heightAnchor.constraint(equalToConstant: 56),

            ageGateVerificationMaroCheck.leadingAnchor.constraint(equalTo: contentStackHydrationRivoView.leadingAnchor, constant: 44),
            ageGateVerificationMaroCheck.topAnchor.constraint(equalTo: signupDraftStorageTaloButton.bottomAnchor, constant: 34),
            ageGateVerificationMaroCheck.widthAnchor.constraint(equalToConstant: 28),
            ageGateVerificationMaroCheck.heightAnchor.constraint(equalToConstant: 28),

            termsLabel.leadingAnchor.constraint(equalTo: ageGateVerificationMaroCheck.trailingAnchor, constant: 12),
            termsLabel.trailingAnchor.constraint(equalTo: contentStackHydrationRivoView.trailingAnchor, constant: -34),
            termsLabel.centerYAnchor.constraint(equalTo: ageGateVerificationMaroCheck.centerYAnchor, constant: 9),
            termsLabel.bottomAnchor.constraint(equalTo: contentStackHydrationRivoView.bottomAnchor, constant: -44),

            loadingStateRenderingQavi.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingStateRenderingQavi.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc private func authSessionPersistenceKumi() {
        guard ageGateVerificationMaroCheck.isChecked else {
            showAlert(PaulaVocalCipherRune.echo("F6inJKRMMKrwqAOUmv6fbbYfaNH7LZ/tDxftdCIHN5kjxMcaRZLXwW7xKe+aa8D5vxsqDE3rBXB1SQ=="))
            return
        }
        let loginAddressCueMavo = (emailAuthParsingRivoInput.text ?? PaulaVocalCipherRune.echo("vosEQcrVts9CnlySdDxuFx0GMmvJlVMFYjcKOg==")).trimmingCharacters(in: .whitespacesAndNewlines)
        let passcodeRelayTokenDori = passwordGatePromptingZaliInput.text ?? PaulaVocalCipherRune.echo("j7+FgEa2uLknkwdxx2rJ0FMZr8QiR1j5PT1nHg==")
        guard loginAddressCueMavo.contains(PaulaVocalCipherRune.echo("eCq+sn2NnznMxiRh8/rmJww3bwMnDMpee2we+K8=")), loginAddressCueMavo.contains(PaulaVocalCipherRune.echo("77p6oTxw30VYDj/zuDjlvCeqdmWnMb3Oc0wZ3X8=")) else {
            showAlert(PaulaVocalCipherRune.echo("h7Q5WNN71bsqzjsLbtJzoRS7URHy5SMDJR7xo4NM8rEX8A+KFdoLBo9LfFzn6037ef5syMiQlQ=="))
            return
        }
        guard !passcodeRelayTokenDori.isEmpty else {
            showAlert(PaulaVocalCipherRune.echo("uWVRwTFMkWzGB/0QyOSef6LFy0oGlOQfxt3XIZWtZU+52QQNACOrvzkqUKfSeyMxvhrP/QweaA=="))
            return
        }

        view.isUserInteractionEnabled = false
        loadingStateRenderingQavi.startAnimating()
        PaulaAuthAPI.emailLogin(loginAddressCueMavo: loginAddressCueMavo, passcodeRelayTokenDori: passcodeRelayTokenDori, type: PaulaVocalCipherRune.echo("UH9wp+TTKeeMo9KYDli33TGIUQQtoP+muqne0uw=")) { [weak self] requestOutcomeFluxTavi in
            self?.loadingStateRenderingQavi.stopAnimating()
            self?.view.isUserInteractionEnabled = true
            switch requestOutcomeFluxTavi {
            case .success(let playerProfileCacheNero):
                PaulaAuthSession.save(playerProfileCacheNero)
                CatruiPulseOrchestrator.shared.mainConsoleLaunchViro()
            case .failure:
                self?.showAlert(PaulaVocalCipherRune.echo("nV0Et1b4nGDPIFYxSxFW91AqQmDWPZEGhQfnYVm+kDd11gPYU+t6684Qf2mjyso0xSrrqxHmQ+OTrIs="))
            }
        }
    }

    @objc private func signupDraftStorageTalo() {
        guard ageGateVerificationMaroCheck.isChecked else {
            showAlert(PaulaVocalCipherRune.echo("crYdyx499x5eSYK3B3WQJGz0M2qCWsgD9zonar4GiLfblYBKBoUcuXg+fGatstb1BWeJHR8Cq8/WjA=="))
            return
        }
        navigationController?.pushViewController(PaulaSignupProfileController(), animated: true)
    }

    @objc private func rootPortalLaunchKeno() {
        if let navigationController, navigationController.viewControllers.count > 1 {
            navigationController.popViewController(animated: true)
        } else {
            dismiss(animated: true)
        }
    }

    @objc private func agreementRouteMappingTeni() {
        let url = NWFUclipFusionOrbit.arenaCascadeField.voiceHarborMist(MotionTrail: PaulaVocalCipherRune.echo("sFNiD+vdqNs5WG/ucaQNcpJpx4GE5t4TFBgvyKo="))
        navigationController?.pushViewController(ZoiceDriftZone(streamAuraShift: url), animated: true)
    }
}
