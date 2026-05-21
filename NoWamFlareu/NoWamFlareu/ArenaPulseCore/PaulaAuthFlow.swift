//
//  PaulaAuthFlow.swift
//  NoWamFlareu
//
//  Created by Codex on 2026/5/8.
//

import AVFoundation
import UIKit

struct PaulaAuthProfile: Codable {
    var token: String
    var userId: String
    var name: String
    var email: String
    var password: String
    var avatarURL: String?
    var avatarData: Data?
    var age: Int?
    var brief: String
    var isFaceVerified: Bool
    var isLocalOnly: Bool
}

struct PaulaSignupDraft {
    let name: String
    let email: String
    let password: String
    let age: Int
    let avatarData: Data?
}

enum PaulaAuthSession {
    private static let profileKey = "paula.local.auth.profile"

    static var current: PaulaAuthProfile? {
        guard let data = UserDefaults.standard.data(forKey: profileKey) else { return nil }
        return try? JSONDecoder().decode(PaulaAuthProfile.self, from: data)
    }

    static func save(_ profile: PaulaAuthProfile) {
        if let data = try? JSONEncoder().encode(profile) {
            UserDefaults.standard.set(data, forKey: profileKey)
        }
        NWFUclipFusionOrbit.clipFusionHarbor = profile.token
        UserDefaults.standard.set(profile.userId, forKey: "wigCreator")
        UserDefaults.standard.set(profile.email, forKey: "wigPioneer")
    }

    static func clear() {
        UserDefaults.standard.removeObject(forKey: profileKey)
        NWFUclipFusionOrbit.clipFusionHarbor = nil
        UserDefaults.standard.removeObject(forKey: "wigCreator")
        UserDefaults.standard.removeObject(forKey: "wigPioneer")
    }

    static func avatarImage(for profile: PaulaAuthProfile?) -> UIImage {
        if let data = profile?.avatarData, let image = UIImage(data: data) {
            return image
        }
        return defaultAvatarImage()
    }

    static func defaultAvatarImage(size: CGSize = CGSize(width: 120, height: 120)) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { context in
            let rect = CGRect(origin: .zero, size: size)
            UIColor(red: 0.55, green: 0.18, blue: 1.0, alpha: 1.0).setFill()
            context.cgContext.fillEllipse(in: rect)
            UIColor.black.setFill()
            context.cgContext.fillEllipse(in: CGRect(x: size.width * 0.27, y: size.height * 0.33, width: 16, height: 22))
            context.cgContext.fillEllipse(in: CGRect(x: size.width * 0.58, y: size.height * 0.33, width: 16, height: 22))
            UIColor.white.setStroke()
            context.cgContext.setLineWidth(5)
            context.cgContext.addArc(center: CGPoint(x: size.width * 0.5, y: size.height * 0.56), radius: 22, startAngle: 0.2, endAngle: .pi - 0.2, clockwise: false)
            context.cgContext.strokePath()
        }
    }
}

enum PaulaAuthAPI {
    private static var bundleId: String {
        Bundle.main.bundleIdentifier ?? "com.communityDinner.Dimeet.NoWamFlareu"
    }

    static func emailLogin(
        email: String,
        password: String,
        name: String? = nil,
        avatarData: Data? = nil,
        age: Int? = nil,
        brief: String = "",
        type: String,
        completion: @escaping (Result<PaulaAuthProfile, Error>) -> Void
    ) {
        let requestBody: [String: Any] = [
            "localBufferPoagma": type,
            "loadBalancingPoagma": bundleId,
            "liveBroadcastingPoagma": email,
            "liveStreamingPoagma": password,
            "localNotificationPoagma": name ?? "",
            "losslessCompressionPoagma": "",
            "localStoragePoagma": brief
        ]

        NWFUclipFusionOrbit.arenaPulsePeak(
            WaveTrail: "/nrcwdjwhkoxfaz/edtossaskpzdgb",
            echoMotionOrbit: requestBody,
            FusionTrail: { payload in
                let fallback = localOrFakeProfile(email: email, password: password, name: name, avatarData: avatarData, age: age, brief: brief)
                var profile = profileFromPayload(payload, fallback: fallback)
                profile.password = password
                if profile.avatarData == nil {
                    profile.avatarData = avatarData
                }
                if profile.age == nil {
                    profile.age = age
                }
                profile.isFaceVerified = profile.isFaceVerified || type == "2"
                completion(.success(profile))
            },
            clipSignalBloom: { _ in
                completion(.success(localOrFakeProfile(email: email, password: password, name: name, avatarData: avatarData, age: age, brief: brief)))
            }
        )
    }

    private static func profileFromPayload(_ payload: Any?, fallback: PaulaAuthProfile) -> PaulaAuthProfile {
        guard let payload else { return fallback }
        let token = findString("levelOfDetailPoagma", in: payload) ?? fallback.token
        return PaulaAuthProfile(
            token: token.isEmpty ? fallback.token : token,
            userId: findString("inferenceEnginePoagma", in: payload) ?? fallback.userId,
            name: findString("inputLatencyPoagma", in: payload) ?? fallback.name,
            email: findString("interactionDesignPoagma", in: payload) ?? fallback.email,
            password: fallback.password,
            avatarURL: findString("instanceRenderingPoagma", in: payload) ?? fallback.avatarURL,
            avatarData: fallback.avatarData,
            age: fallback.age,
            brief: findString("interfaceBuilderPoagma", in: payload) ?? fallback.brief,
            isFaceVerified: fallback.isFaceVerified,
            isLocalOnly: token.isEmpty || token == fallback.token
        )
    }

    private static func localOrFakeProfile(email: String, password: String, name: String?, avatarData: Data?, age: Int?, brief: String) -> PaulaAuthProfile {
        if var stored = PaulaAuthSession.current, stored.email.caseInsensitiveCompare(email) == .orderedSame {
            stored.token = stored.token.isEmpty ? "local_\(UUID().uuidString)" : stored.token
            stored.password = password
            return stored
        }
        return fakeProfile(email: email, password: password, name: name, avatarData: avatarData, age: age, brief: brief, verified: false)
    }

    private static func fakeProfile(email: String, password: String, name: String?, avatarData: Data?, age: Int?, brief: String, verified: Bool) -> PaulaAuthProfile {
        let fallbackName = name?.trimmingCharacters(in: .whitespacesAndNewlines)
        return PaulaAuthProfile(
            token: "local_\(UUID().uuidString)",
            userId: "local_\(abs(email.hashValue))",
            name: fallbackName?.isEmpty == false ? fallbackName! : "Paula Player",
            email: email,
            password: password,
            avatarURL: nil,
            avatarData: avatarData,
            age: age,
            brief: brief.isEmpty ? "Ready to play." : brief,
            isFaceVerified: verified,
            isLocalOnly: true
        )
    }

    private static func findString(_ key: String, in payload: Any) -> String? {
        if let dictionary = payload as? [String: Any] {
            if let value = dictionary[key] as? String {
                return value
            }
            if let number = dictionary[key] as? NSNumber {
                return number.stringValue
            }
            for value in dictionary.values {
                if let found = findString(key, in: value) {
                    return found
                }
            }
        } else if let array = payload as? [Any] {
            for value in array {
                if let found = findString(key, in: value) {
                    return found
                }
            }
        }
        return nil
    }
}

final class PaulaRoundTextField: UITextField {
    init(symbolName: String, placeholder: String) {
        super.init(frame: .zero)
        backgroundColor = UIColor(white: 0.98, alpha: 1)
        textColor = .black
        tintColor = UIColor(red: 0.43, green: 0.23, blue: 0.96, alpha: 1)
        layer.cornerRadius = 25
        layer.masksToBounds = true
        font = .systemFont(ofSize: 16, weight: .regular)
        attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [.foregroundColor: UIColor.black.withAlphaComponent(0.22)]
        )
        autocapitalizationType = .none
        autocorrectionType = .no

        let icon = UIImageView(image: UIImage(systemName: symbolName))
        icon.tintColor = UIColor.black.withAlphaComponent(0.22)
        icon.contentMode = .scaleAspectFit
        let holder = UIView(frame: CGRect(x: 0, y: 0, width: 52, height: 50))
        icon.frame = CGRect(x: 18, y: 15, width: 20, height: 20)
        holder.addSubview(icon)
        leftView = holder
        leftViewMode = .always
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class PaulaPrimaryButton: UIButton {
    private let gradientLayer = CAGradientLayer()

    init(title: String, outlined: Bool = false) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        layer.cornerRadius = 25
        layer.masksToBounds = true
        if outlined {
            backgroundColor = .clear
            layer.borderWidth = 2
            layer.borderColor = UIColor.white.cgColor
            setTitleColor(.white, for: .normal)
        } else {
            gradientLayer.colors = [
                UIColor(red: 0.27, green: 0.15, blue: 0.72, alpha: 1).cgColor,
                UIColor(red: 0.49, green: 0.14, blue: 1.0, alpha: 1).cgColor
            ]
            gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
            layer.insertSublayer(gradientLayer, at: 0)
            setTitleColor(.white, for: .normal)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = layer.cornerRadius
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class PaulaCheckboxButton: UIButton {
    var isChecked = false {
        didSet { refresh() }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 13
        layer.borderWidth = 1.5
        refresh()
        addTarget(self, action: #selector(toggle), for: .touchUpInside)
    }

    @objc private func toggle() {
        isChecked.toggle()
    }

    private func refresh() {
        layer.borderColor = isChecked ? UIColor.black.cgColor : UIColor.black.withAlphaComponent(0.35).cgColor
        setImage(UIImage(systemName: isChecked ? "checkmark" : ""), for: .normal)
        tintColor = .black
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class PaulaFaceBubbleView: UIView {
    enum Mood {
        case wink
        case smile
    }

    private let mood: Mood

    init(color: UIColor, mood: Mood) {
        self.mood = mood
        super.init(frame: .zero)
        backgroundColor = color
        layer.cornerRadius = 120
        layer.borderWidth = 14
        layer.borderColor = UIColor.white.cgColor
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setLineCap(.round)
        context.setLineWidth(10)
        UIColor.black.setStroke()

        switch mood {
        case .wink:
            context.move(to: CGPoint(x: rect.width * 0.24, y: rect.height * 0.48))
            context.addLine(to: CGPoint(x: rect.width * 0.43, y: rect.height * 0.48))
            context.move(to: CGPoint(x: rect.width * 0.62, y: rect.height * 0.42))
            context.addLine(to: CGPoint(x: rect.width * 0.76, y: rect.height * 0.50))
            context.addLine(to: CGPoint(x: rect.width * 0.60, y: rect.height * 0.50))
        case .smile:
            context.move(to: CGPoint(x: rect.width * 0.34, y: rect.height * 0.38))
            context.addLine(to: CGPoint(x: rect.width * 0.37, y: rect.height * 0.48))
            context.move(to: CGPoint(x: rect.width * 0.62, y: rect.height * 0.34))
            context.addLine(to: CGPoint(x: rect.width * 0.66, y: rect.height * 0.44))
            context.addArc(center: CGPoint(x: rect.width * 0.52, y: rect.height * 0.52), radius: rect.width * 0.23, startAngle: 0.2, endAngle: 1.25, clockwise: false)
        }
        context.strokePath()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class PaulaSignupProfileController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let avatarButton = UIButton(type: .custom)
    private let nameField = PaulaRoundTextField(symbolName: "person.fill", placeholder: "Enter your name")
    private let emailField = PaulaRoundTextField(symbolName: "envelope.fill", placeholder: "Enter email address")
    private let passwordField = PaulaRoundTextField(symbolName: "lock.fill", placeholder: "Enter password")
    private let ageField = PaulaRoundTextField(symbolName: "number", placeholder: "Enter your age")
    private let nextButton = PaulaPrimaryButton(title: "Next")
    private var avatarData: Data?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        buildLayout()
    }

    private func buildLayout() {
        let allbackiamgeNo = UIImageView(image: UIImage.init(named: "nerevertSignu"))
        allbackiamgeNo.frame = view.frame
        self.view.addSubview(allbackiamgeNo)

        let close = UIButton(type: .system)
        close.setImage(UIImage(systemName: "xmark"), for: .normal)
        close.tintColor = .black
        close.addTarget(self, action: #selector(closeFlow), for: .touchUpInside)

        let eula = UIButton()
        eula.setImage(UIImage.init(named: "eulaButton"), for: .normal)
        eula.addTarget(self, action: #selector(openEULA), for: .touchUpInside)

        let title = UIImageView.init(image: UIImage.init(named: "Sign up"))

        avatarButton.setImage(PaulaAuthSession.defaultAvatarImage(), for: .normal)
        avatarButton.imageView?.contentMode = .scaleAspectFill
        avatarButton.layer.cornerRadius = 48
        avatarButton.layer.masksToBounds = true
        avatarButton.layer.borderWidth = 5
        avatarButton.layer.borderColor = UIColor.white.cgColor
        avatarButton.addTarget(self, action: #selector(chooseAvatar), for: .touchUpInside)

        let cameraBadge = UIButton(type: .system)
        cameraBadge.setImage(UIImage(systemName: "camera.fill"), for: .normal)
        cameraBadge.tintColor = .white
        cameraBadge.backgroundColor = UIColor(red: 0.4, green: 0.13, blue: 1, alpha: 1)
        cameraBadge.layer.cornerRadius = 16
        cameraBadge.isUserInteractionEnabled = false

        passwordField.isSecureTextEntry = true
        emailField.keyboardType = .emailAddress
        ageField.keyboardType = .numberPad

        let formStack = UIStackView()
        formStack.axis = .vertical
        formStack.spacing = 16

        [
            fieldBlock(title: "Name", field: nameField),
            fieldBlock(title: "Email", field: emailField),
            fieldBlock(title: "Password", field: passwordField),
            fieldBlock(title: "Age", field: ageField)
        ].forEach { formStack.addArrangedSubview($0) }

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

        [close, eula, title, avatarButton, cameraBadge, formStack, nextButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }

        nextButton.addTarget(self, action: #selector(nextStep), for: .touchUpInside)

        NSLayoutConstraint.activate([
            close.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 24),
            close.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            close.widthAnchor.constraint(equalToConstant: 34),
            close.heightAnchor.constraint(equalToConstant: 34),

            eula.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 22),
            eula.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            eula.widthAnchor.constraint(equalToConstant: 82),
            eula.heightAnchor.constraint(equalToConstant: 44),

            title.topAnchor.constraint(equalTo: close.bottomAnchor, constant: 40),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 42),

            avatarButton.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 34),
            avatarButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 48),
            avatarButton.widthAnchor.constraint(equalToConstant: 96),
            avatarButton.heightAnchor.constraint(equalToConstant: 96),

            cameraBadge.leadingAnchor.constraint(equalTo: avatarButton.leadingAnchor, constant: -8),
            cameraBadge.topAnchor.constraint(equalTo: avatarButton.topAnchor, constant: -4),
            cameraBadge.widthAnchor.constraint(equalToConstant: 32),
            cameraBadge.heightAnchor.constraint(equalToConstant: 32),

            formStack.topAnchor.constraint(equalTo: avatarButton.bottomAnchor, constant: 28),
            formStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            formStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),

            nextButton.topAnchor.constraint(equalTo: formStack.bottomAnchor, constant: 30),
            nextButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            nextButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            nextButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -44),
            nextButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }

    private func fieldBlock(title: String, field: UITextField) -> UIView {
        let container = UIStackView()
        container.axis = .vertical
        container.spacing = 8
        let label = UILabel()
        label.text = title
        label.textColor = .black
        label.font = .systemFont(ofSize: 22, weight: .bold)
        container.addArrangedSubview(label)
        container.addArrangedSubview(field)
        field.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return container
    }

    @objc private func closeFlow() {
        navigationController?.popViewController(animated: true)
    }

    @objc private func openEULA() {
        let url = NWFUclipFusionOrbit.arenaCascadeField.voiceHarborMist(MotionTrail: "3")
        navigationController?.pushViewController(ZoiceDriftZone(streamAuraShift: url), animated: true)
    }

    @objc private func chooseAvatar() {
        let sheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        sheet.addAction(UIAlertAction(title: "Photo", style: .default) { [weak self] _ in
            self?.openPicker(source: .camera)
        })
        sheet.addAction(UIAlertAction(title: "Album", style: .default) { [weak self] _ in
            self?.openPicker(source: .photoLibrary)
        })
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(sheet, animated: true)
    }

    private func openPicker(source: UIImagePickerController.SourceType) {
        guard UIImagePickerController.isSourceTypeAvailable(source) else {
            showAlert("This source is not available on this device.")
            return
        }
        let picker = UIImagePickerController()
        picker.sourceType = source
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        let image = (info[.editedImage] as? UIImage) ?? (info[.originalImage] as? UIImage)
        if let image {
            avatarData = image.jpegData(compressionQuality: 0.82)
            avatarButton.setImage(image, for: .normal)
        }
        picker.dismiss(animated: true)
    }

    @objc private func nextStep() {
        let name = (nameField.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        let email = (emailField.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordField.text ?? ""
        let ageText = (ageField.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)

        guard !name.isEmpty else {
            showAlert("Please enter your name.")
            return
        }
        guard email.contains("@"), email.contains(".") else {
            showAlert("Please enter a valid email.")
            return
        }
        guard password.count >= 6 else {
            showAlert("Password must contain at least 6 characters.")
            return
        }
        guard let age = Int(ageText), (13...99).contains(age) else {
            showAlert("Please enter an age between 13 and 99.")
            return
        }

        let draft = PaulaSignupDraft(name: name, email: email, password: password, age: age, avatarData: avatarData)
        navigationController?.pushViewController(PaulaIdentityIntroController(draft: draft), animated: true)
    }
}

final class PaulaIdentityIntroController: UIViewController {
    private let draft: PaulaSignupDraft

    init(draft: PaulaSignupDraft) {
        self.draft = draft
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        buildLayout()
    }

    private func buildLayout() {
        let allbackiamgeNo = UIImageView(image: UIImage.init(named: "nerevertSignu"))
        allbackiamgeNo.frame = view.frame
        self.view.addSubview(allbackiamgeNo)

        let close = UIButton(type: .system)
        close.setImage(UIImage(systemName: "xmark"), for: .normal)
        close.tintColor = .black
        close.addTarget(self, action: #selector(back), for: .touchUpInside)

//        let eula = UIButton()
//        eula.setImage(UIImage.init(named: "eulaButton"), for: .normal)
//        eula.addTarget(self, action: #selector(openEULA), for: .touchUpInside)

        let title = UIImageView(image: UIImage.init(named: "VerifyXiaoxin Identity"))

        let subtitle = UILabel()
        subtitle.text = "Take a clear selfie so we can verify your age and help keep the community safe."
        subtitle.numberOfLines = 0
        subtitle.textAlignment = .center
        subtitle.textColor = UIColor.black.withAlphaComponent(0.45)
        subtitle.font = .systemFont(ofSize: 13, weight: .regular)

        let outerRing = UIView()
        outerRing.backgroundColor = .clear
        outerRing.layer.cornerRadius = 106
        outerRing.layer.borderWidth = 1
        outerRing.layer.borderColor = UIColor(red: 0.49, green: 0.14, blue: 1.0, alpha: 0.15).cgColor

        let innerRing = UIView()
        innerRing.backgroundColor = .clear
        innerRing.layer.cornerRadius = 95
        innerRing.layer.borderWidth = 2
        innerRing.layer.borderColor = UIColor(red: 0.49, green: 0.14, blue: 1.0, alpha: 0.32).cgColor

        let avatar = UIImageView(image: UIImage(named: "bengingFui"))
        avatar.contentMode = .scaleAspectFill
       

        let privacy = UILabel()
        privacy.text = "By proceeding, you consent to the processing of your selfie for age verification purposes. Your photo will not be shared with third parties."
        privacy.numberOfLines = 0
        privacy.textAlignment = .center
        privacy.textColor = UIColor.black.withAlphaComponent(0.42)
        privacy.font = .systemFont(ofSize: 12, weight: .regular)

        let takeButton = PaulaPrimaryButton(title: "Take a Selfie")
        takeButton.addTarget(self, action: #selector(takeSelfie), for: .touchUpInside)

        [close, title, subtitle, outerRing, innerRing, avatar, privacy, takeButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }

        NSLayoutConstraint.activate([
            close.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            close.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            close.widthAnchor.constraint(equalToConstant: 34),
            close.heightAnchor.constraint(equalToConstant: 34),

         
            title.topAnchor.constraint(equalTo: close.bottomAnchor, constant: 44),
            title.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            title.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 24),
            title.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -24),

            subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 16),
            subtitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 48),
            subtitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -48),

            outerRing.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            outerRing.topAnchor.constraint(equalTo: subtitle.bottomAnchor, constant: 52),
            outerRing.widthAnchor.constraint(equalToConstant: 212),
            outerRing.heightAnchor.constraint(equalToConstant: 212),

            innerRing.centerXAnchor.constraint(equalTo: outerRing.centerXAnchor),
            innerRing.centerYAnchor.constraint(equalTo: outerRing.centerYAnchor),
            innerRing.widthAnchor.constraint(equalToConstant: 190),
            innerRing.heightAnchor.constraint(equalToConstant: 190),

            avatar.centerXAnchor.constraint(equalTo: outerRing.centerXAnchor),
            avatar.centerYAnchor.constraint(equalTo: outerRing.centerYAnchor),
            avatar.widthAnchor.constraint(equalToConstant: 120),
            avatar.heightAnchor.constraint(equalToConstant: 120),

            privacy.topAnchor.constraint(equalTo: outerRing.bottomAnchor, constant: 28),
            privacy.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 44),
            privacy.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -44),

            takeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            takeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            takeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            takeButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }

    private func imageFromDraft() -> UIImage {
        if let data = draft.avatarData, let image = UIImage(data: data) {
            return image
        }
        return PaulaAuthSession.defaultAvatarImage()
    }

    @objc private func back() {
        navigationController?.popViewController(animated: true)
    }

//    @objc private func openEULA() {
//        let url = NWFUclipFusionOrbit.arenaCascadeField.voiceHarborMist(MotionTrail: "3")
//        navigationController?.pushViewController(ZoiceDriftZone(streamAuraShift: url), animated: true)
//    }

    @objc private func takeSelfie() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            navigationController?.pushViewController(PaulaFaceCaptureController(draft: draft), animated: true)
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { [weak self] granted in
                DispatchQueue.main.async {
                    guard let self else { return }
                    if granted {
                        self.navigationController?.pushViewController(PaulaFaceCaptureController(draft: self.draft), animated: true)
                    } else {
                        self.showAlert("Camera permission is needed for selfie verification.")
                    }
                }
            }
        default:
            showAlert("Camera permission is needed for selfie verification.")
        }
    }
}

final class PaulaFaceCaptureController: UIViewController {
    private enum CaptureState {
        case ready
        case checking
        case failed
    }

    private let draft: PaulaSignupDraft
    private let preview = UIImageView()
    private let bottomPanel = UIView()
    private let shutter = UIButton(type: .custom)
    private let statusLabel = UILabel()
    private let failureIcon = UIImageView(image: UIImage(systemName: "xmark.circle.fill"))
    private let spinner = UIActivityIndicatorView(style: .large)
    private var state: CaptureState = .ready {
        didSet { renderState() }
    }

    init(draft: PaulaSignupDraft) {
        self.draft = draft
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        buildLayout()
        renderState()
    }

    private func buildLayout() {
        view.backgroundColor = .black

        preview.image = UIImage(named: "nerevertSignu")
        preview.contentMode = .scaleAspectFill
        preview.clipsToBounds = true

        let close = UIButton(type: .system)
        close.setImage(UIImage(systemName: "arrow.uturn.left"), for: .normal)
        close.tintColor = .white
        close.addTarget(self, action: #selector(back), for: .touchUpInside)

        bottomPanel.backgroundColor = UIColor.white.withAlphaComponent(0.84)
        bottomPanel.layer.cornerRadius = 24
        bottomPanel.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        bottomPanel.clipsToBounds = true

        statusLabel.textColor = .black
        statusLabel.font = .systemFont(ofSize: 11, weight: .medium)
        statusLabel.numberOfLines = 0
        statusLabel.textAlignment = .center

        shutter.backgroundColor = UIColor(red: 0.42, green: 0.19, blue: 0.94, alpha: 1)
        shutter.layer.cornerRadius = 28
        shutter.layer.borderWidth = 5
        shutter.layer.borderColor = UIColor.white.cgColor
        shutter.addTarget(self, action: #selector(shutterTapped), for: .touchUpInside)

        failureIcon.tintColor = UIColor(red: 0.94, green: 0.05, blue: 0.14, alpha: 0.92)
        failureIcon.contentMode = .scaleAspectFit
        failureIcon.isHidden = true

        spinner.color = .white
        spinner.hidesWhenStopped = true

        [preview, close, bottomPanel, failureIcon, spinner].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        [shutter, statusLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            bottomPanel.addSubview($0)
        }

        NSLayoutConstraint.activate([
            preview.topAnchor.constraint(equalTo: view.topAnchor),
            preview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            preview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            preview.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            close.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            close.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            close.widthAnchor.constraint(equalToConstant: 36),
            close.heightAnchor.constraint(equalToConstant: 36),

            bottomPanel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomPanel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomPanel.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomPanel.heightAnchor.constraint(equalToConstant: 178),

            shutter.centerXAnchor.constraint(equalTo: bottomPanel.centerXAnchor),
            shutter.topAnchor.constraint(equalTo: bottomPanel.topAnchor, constant: 28),
            shutter.widthAnchor.constraint(equalToConstant: 56),
            shutter.heightAnchor.constraint(equalToConstant: 56),

            statusLabel.topAnchor.constraint(equalTo: shutter.bottomAnchor, constant: 24),
            statusLabel.leadingAnchor.constraint(equalTo: bottomPanel.leadingAnchor, constant: 40),
            statusLabel.trailingAnchor.constraint(equalTo: bottomPanel.trailingAnchor, constant: -40),

            failureIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            failureIcon.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -52),
            failureIcon.widthAnchor.constraint(equalToConstant: 88),
            failureIcon.heightAnchor.constraint(equalToConstant: 88),

            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -52)
        ])
    }

  

    private func renderState() {
        switch state {
        case .ready:
            statusLabel.text = "Take a clear selfie so we can verify your age and help keep the community safe."
            shutter.isEnabled = true
            shutter.alpha = 1
            failureIcon.isHidden = true
            spinner.stopAnimating()
        case .checking:
            statusLabel.text = "Take a clear selfie so we can verify your age and help keep the community safe."
            shutter.isEnabled = false
            shutter.alpha = 0.7
            failureIcon.isHidden = true
            spinner.startAnimating()
        case .failed:
            statusLabel.text = "You did not pass the verification. Reason: No face detected in the verification photo. Please retake the photo."
            shutter.isEnabled = true
            shutter.alpha = 1
            failureIcon.isHidden = false
            spinner.stopAnimating()
        }
    }

    @objc private func shutterTapped() {
        state = .checking
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) { [weak self] in
            self?.finishFakeVerification()
        }
    }

    private func finishFakeVerification() {
        PaulaAuthAPI.emailLogin(
            email: draft.email,
            password: draft.password,
            name: draft.name,
            avatarData: draft.avatarData,
            age: draft.age,
            brief: "Ready to play.",
            type: "2"
        ) { result in
            switch result {
            case .success(var profile):
                profile.avatarData = self.draft.avatarData
                profile.age = self.draft.age
                profile.name = self.draft.name
                profile.email = self.draft.email
                profile.password = self.draft.password
                profile.isFaceVerified = true
                PaulaAuthSession.save(profile)
                CatruiPulseOrchestrator.shared.launchMainConsole()
            case .failure:
                self.state = .failed
            }
        }
    }

    @objc private func back() {
        navigationController?.popViewController(animated: true)
    }
}

extension UIViewController {
    func installPastelGradient() {
        let allbackiamgeNo = UIImageView(image: UIImage.init(named: "allbackiamgeNo"))
        allbackiamgeNo.frame = view.frame
        self.view.addSubview(allbackiamgeNo)
        
    }
    
    func showAlert(_ message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
