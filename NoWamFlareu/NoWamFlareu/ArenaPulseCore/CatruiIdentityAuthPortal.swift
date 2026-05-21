//
//  ArenaPulseCore.swift
//  NoWamFlareu
//
//  Created by  on 2026/5/6.
//

import UIKit

class CatruiIdentityAuthPortal: UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let emailInput = PaulaRoundTextField(symbolName: "envelope.fill", placeholder: "Enter your email")
    private let passwordInput = PaulaRoundTextField(symbolName: "lock.fill", placeholder: "Enter password")
    private let actionPulseBtn = PaulaPrimaryButton(title: "Login")
    private let registerSwitchBtn = PaulaPrimaryButton(title: "Create New Account", outlined: true)
    private let termsCheck = PaulaCheckboxButton()
    private let loadingView = UIActivityIndicatorView(style: .large)

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupVisualAtmosphere()
        constructPortalHierarchy()
    }

    private func setupVisualAtmosphere() {
        installPastelGradient()
        navigationController?.isNavigationBarHidden = true
    }

    private func constructPortalHierarchy() {
//        let closeButton = UIButton(type: .system)
//        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
//        closeButton.tintColor = .black
//        closeButton.addTarget(self, action: #selector(closePortal), for: .touchUpInside)

        let eulaButton = UIButton()
        eulaButton.setImage(UIImage.init(named: "eulaButton"), for: .normal)
        eulaButton.addTarget(self, action: #selector(openEULA), for: .touchUpInside)

     
        let titleLabel = UIImageView(image: UIImage.init(named: "Log Tiaoln"))
       

        passwordInput.isSecureTextEntry = true
        emailInput.keyboardType = .emailAddress

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

        termsCheck.isChecked = true
        loadingView.color = .white
        loadingView.hidesWhenStopped = true

        actionPulseBtn.addTarget(self, action: #selector(handleAuthPulse), for: .touchUpInside)
        registerSwitchBtn.addTarget(self, action: #selector(openRegisterFlow), for: .touchUpInside)

        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.keyboardDismissMode = .interactive
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            contentView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.frameLayoutGuide.heightAnchor)
        ])

        [
//            closeButton,
            eulaButton,
         
            titleLabel,
            emailInput,
            passwordInput,
            actionPulseBtn,
            leftLine,
            orLabel,
            rightLine,
            registerSwitchBtn,
            termsCheck,
            termsLabel
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }

        loadingView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loadingView)

        NSLayoutConstraint.activate([
//            closeButton.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 24),
//            closeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
//            closeButton.widthAnchor.constraint(equalToConstant: 34),
//            closeButton.heightAnchor.constraint(equalToConstant: 34),

            eulaButton.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 22),
            eulaButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            eulaButton.widthAnchor.constraint(equalToConstant: 82),
            eulaButton.heightAnchor.constraint(equalToConstant: 44),

//            blueEmoji.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -56),
//            blueEmoji.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 64),
//            blueEmoji.widthAnchor.constraint(equalToConstant: 236),
//            blueEmoji.heightAnchor.constraint(equalToConstant: 236),
//
//            pinkEmoji.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 114),
//            pinkEmoji.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -96),
//            pinkEmoji.widthAnchor.constraint(equalToConstant: 250),
//            pinkEmoji.heightAnchor.constraint(equalToConstant: 250),

            titleLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 270),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -46),

            emailInput.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 88),
            emailInput.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            emailInput.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            emailInput.heightAnchor.constraint(equalToConstant: 50),

            passwordInput.topAnchor.constraint(equalTo: emailInput.bottomAnchor, constant: 22),
            passwordInput.leadingAnchor.constraint(equalTo: emailInput.leadingAnchor),
            passwordInput.trailingAnchor.constraint(equalTo: emailInput.trailingAnchor),
            passwordInput.heightAnchor.constraint(equalToConstant: 50),

            actionPulseBtn.topAnchor.constraint(equalTo: passwordInput.bottomAnchor, constant: 34),
            actionPulseBtn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            actionPulseBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            actionPulseBtn.heightAnchor.constraint(equalToConstant: 56),

            orLabel.topAnchor.constraint(equalTo: actionPulseBtn.bottomAnchor, constant: 22),
            orLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            orLabel.widthAnchor.constraint(equalToConstant: 44),

            leftLine.centerYAnchor.constraint(equalTo: orLabel.centerYAnchor),
            leftLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 52),
            leftLine.trailingAnchor.constraint(equalTo: orLabel.leadingAnchor, constant: -8),
            leftLine.heightAnchor.constraint(equalToConstant: 1),

            rightLine.centerYAnchor.constraint(equalTo: orLabel.centerYAnchor),
            rightLine.leadingAnchor.constraint(equalTo: orLabel.trailingAnchor, constant: 8),
            rightLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -52),
            rightLine.heightAnchor.constraint(equalToConstant: 1),

            registerSwitchBtn.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 22),
            registerSwitchBtn.leadingAnchor.constraint(equalTo: actionPulseBtn.leadingAnchor),
            registerSwitchBtn.trailingAnchor.constraint(equalTo: actionPulseBtn.trailingAnchor),
            registerSwitchBtn.heightAnchor.constraint(equalToConstant: 56),

            termsCheck.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 44),
            termsCheck.topAnchor.constraint(equalTo: registerSwitchBtn.bottomAnchor, constant: 34),
            termsCheck.widthAnchor.constraint(equalToConstant: 28),
            termsCheck.heightAnchor.constraint(equalToConstant: 28),

            termsLabel.leadingAnchor.constraint(equalTo: termsCheck.trailingAnchor, constant: 12),
            termsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -34),
            termsLabel.centerYAnchor.constraint(equalTo: termsCheck.centerYAnchor, constant: 9),
            termsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -44),

            loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc private func handleAuthPulse() {
        guard termsCheck.isChecked else {
            showAlert("Please accept the terms first.")
            return
        }
        let email = (emailInput.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordInput.text ?? ""
        guard email.contains("@"), email.contains(".") else {
            showAlert("Please enter a valid email.")
            return
        }
        guard !password.isEmpty else {
            showAlert("Please enter your password.")
            return
        }

        view.isUserInteractionEnabled = false
        loadingView.startAnimating()
        PaulaAuthAPI.emailLogin(email: email, password: password, type: "1") { [weak self] result in
            self?.loadingView.stopAnimating()
            self?.view.isUserInteractionEnabled = true
            switch result {
            case .success(let profile):
                PaulaAuthSession.save(profile)
                CatruiPulseOrchestrator.shared.launchMainConsole()
            case .failure:
                self?.showAlert("Login failed. Please try again.")
            }
        }
    }

    @objc private func openRegisterFlow() {
        guard termsCheck.isChecked else {
            showAlert("Please accept the terms first.")
            return
        }
        navigationController?.pushViewController(PaulaSignupProfileController(), animated: true)
    }

    @objc private func closePortal() {
        if let navigationController, navigationController.viewControllers.count > 1 {
            navigationController.popViewController(animated: true)
        } else {
            dismiss(animated: true)
        }
    }

    @objc private func openEULA() {
        let url = NWFUclipFusionOrbit.arenaCascadeField.voiceHarborMist(MotionTrail: "3")
        navigationController?.pushViewController(ZoiceDriftZone(streamAuraShift: url), animated: true)
    }
}
