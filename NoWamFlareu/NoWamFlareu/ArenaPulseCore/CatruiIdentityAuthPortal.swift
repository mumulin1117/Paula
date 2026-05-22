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
    private let emailAuthParsingRivoInput = PaulaRoundTextField(systemLockIconRenderingPori: "envelope.fill", placeholder: "Enter your email")
    private let passwordGatePromptingZaliInput = PaulaRoundTextField(systemLockIconRenderingPori: "lock.fill", placeholder: "Enter password")
    private let authSessionPersistenceKumiButton = PaulaPrimaryButton(title: "Login")
    private let signupDraftStorageTaloButton = PaulaPrimaryButton(title: "Create New Account", outlined: true)
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
        eulaButton.setImage(UIImage.init(named: "eulaButton"), for: .normal)
        eulaButton.addTarget(self, action: #selector(agreementRouteMappingTeni), for: .touchUpInside)

     
        let titleLabel = UIImageView(image: UIImage.init(named: "Log Tiaoln"))
       

        passwordGatePromptingZaliInput.isSecureTextEntry = true
        emailAuthParsingRivoInput.keyboardType = .emailAddress

        let orLabel = UILabel()
        orLabel.text = "Or"
        orLabel.textColor = .white
        orLabel.font = .systemFont(ofSize: 17, weight: .bold)
        orLabel.textAlignment = .center

        let leftLine = UIView()
        let rightLine = UIView()
        [leftLine, rightLine].forEach {
            $0.backgroundColor = UIColor.white.withAlphaComponent(0.55)
        }

        let termsLabel = UILabel()
        termsLabel.text = "By continuing you agree to our <Terms of Service>\nand <Privacy Policy>."
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
            showAlert("Please accept the terms first.")
            return
        }
        let loginAddressCueMavo = (emailAuthParsingRivoInput.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        let passcodeRelayTokenDori = passwordGatePromptingZaliInput.text ?? ""
        guard loginAddressCueMavo.contains("@"), loginAddressCueMavo.contains(".") else {
            showAlert("Please enter a valid email.")
            return
        }
        guard !passcodeRelayTokenDori.isEmpty else {
            showAlert("Please enter your password.")
            return
        }

        view.isUserInteractionEnabled = false
        loadingStateRenderingQavi.startAnimating()
        PaulaAuthAPI.emailLogin(loginAddressCueMavo: loginAddressCueMavo, passcodeRelayTokenDori: passcodeRelayTokenDori, type: "1") { [weak self] requestOutcomeFluxTavi in
            self?.loadingStateRenderingQavi.stopAnimating()
            self?.view.isUserInteractionEnabled = true
            switch requestOutcomeFluxTavi {
            case .success(let playerProfileCacheNero):
                PaulaAuthSession.save(playerProfileCacheNero)
                CatruiPulseOrchestrator.shared.mainConsoleLaunchViro()
            case .failure:
                self?.showAlert("Login failed. Please try again.")
            }
        }
    }

    @objc private func signupDraftStorageTalo() {
        guard ageGateVerificationMaroCheck.isChecked else {
            showAlert("Please accept the terms first.")
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
        let url = NWFUclipFusionOrbit.arenaCascadeField.voiceHarborMist(MotionTrail: "3")
        navigationController?.pushViewController(ZoiceDriftZone(streamAuraShift: url), animated: true)
    }
}
