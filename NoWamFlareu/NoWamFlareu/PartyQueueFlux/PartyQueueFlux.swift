//
//  PartyQueueFlux.swift
//  NoWamFlareu
//
//  Created by  on 2026/5/6.
//

import UIKit

// MARK: - 个人中心模块 (Me / Profile)
class PulseMePartyQueueFlux: UIViewController {
    private struct ProfileOption {
        let title: String
        let value: String
        let route: NWFUclipFusionOrbit?
        let routeParam: String
    }

    private var profile = PaulaMeProfile.fallback()
    private var profileOptions: [ProfileOption] {
        [
            ProfileOption(title: "Today's Mood", value: profile.brief, route: nil, routeParam: ""),
            ProfileOption(title: "Avatar Frame", value: "", route: .arenaFusionRise, routeParam: ""),
            ProfileOption(title: "Birthday", value: profile.birthday, route: .echoOrbitField, routeParam: ""),
            ProfileOption(title: "Weight", value: profile.weight, route: .echoOrbitField, routeParam: ""),
            ProfileOption(title: "Height", value: profile.height, route: .echoOrbitField, routeParam: "")
        ]
    }

    private let identityTerminalTable = UITableView(frame: .zero, style: .plain)
    private let refreshControl = UIRefreshControl()
    private let profileHeaderVessel = UIView()
    private let avatarRingView = ProfileAvatarRingView()
    private let coreAvatarView = UIImageView()
    private let nameLabel = UILabel()
    private let vipBadge = UILabel()
    private let editBtn = UIButton(type: .system)
    private let signatureLabel = UILabel()
    private let statsStack = UIStackView()
    private var statCountLabels: [UILabel] = []
    private let lemonGlow = UIView()
    private let oceanGlow = UIView()
    private let goldButton = UIButton(type: .system)
    private let settingsButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        applyAtmosphere()
        setupNaviActions()
        constructIdentityLayout()
        loadUserInfo()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
        loadUserInfo()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        refreshHeaderFrame()
    }

    private func applyAtmosphere() {
        view.backgroundColor = UIColor(red: 2 / 255, green: 4 / 255, blue: 7 / 255, alpha: 1)
        installBackgroundGlow()
    }

    private func setupNaviActions() {
        let topTitle = UILabel()
        topTitle.text = "Me"
        topTitle.font = .systemFont(ofSize: 30, weight: .black)
        topTitle.textColor = .white
        topTitle.layer.shadowColor = UIColor(red: 106 / 255, green: 76 / 255, blue: 255 / 255, alpha: 1).cgColor
        topTitle.layer.shadowOpacity = 0.9
        topTitle.layer.shadowRadius = 8
        topTitle.layer.shadowOffset = .zero
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: topTitle)

        configurePillButton(goldButton, title: profile.coinBalance, imageName: "bitcoinsign.circle.fill")
        goldButton.addTarget(self, action: #selector(openGoldCharge), for: .touchUpInside)

        configurePillButton(settingsButton, title: "Settings", imageName: "gearshape")
        settingsButton.addTarget(self, action: #selector(openSettings), for: .touchUpInside)

        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(customView: settingsButton),
            UIBarButtonItem(customView: goldButton)
        ]
    }

    private func configureNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .clear
        appearance.shadowColor = .clear
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.isTranslucent = true
    }

    private func configurePillButton(_ button: UIButton, title: String, imageName: String) {
        var titleAttributes = AttributeContainer()
        titleAttributes.font = UIFont.systemFont(ofSize: 15, weight: .medium)

        var configuration = UIButton.Configuration.plain()
        configuration.attributedTitle = AttributedString(" \(title)", attributes: titleAttributes)
        configuration.image = UIImage(systemName: imageName)
        configuration.baseForegroundColor = .white
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 10, bottom: 4, trailing: 10)
        button.configuration = configuration
        button.tintColor = .white
        button.backgroundColor = UIColor(red: 39 / 255, green: 78 / 255, blue: 144 / 255, alpha: 0.58)
        button.layer.cornerRadius = 14
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 53 / 255, green: 105 / 255, blue: 200 / 255, alpha: 1).cgColor
        button.frame = CGRect(x: 0, y: 0, width: title == "Settings" ? 104 : 72, height: 29)
    }

    private func installBackgroundGlow() {
        lemonGlow.backgroundColor = UIColor(red: 207 / 255, green: 214 / 255, blue: 99 / 255, alpha: 0.45)
        oceanGlow.backgroundColor = UIColor(red: 55 / 255, green: 97 / 255, blue: 172 / 255, alpha: 0.32)
        lemonGlow.layer.cornerRadius = 58
        oceanGlow.layer.cornerRadius = 72

        [lemonGlow, oceanGlow].forEach {
            $0.layer.shadowOpacity = 0.9
            $0.layer.shadowRadius = 42
            $0.layer.shadowOffset = .zero
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        lemonGlow.layer.shadowColor = lemonGlow.backgroundColor?.cgColor
        oceanGlow.layer.shadowColor = oceanGlow.backgroundColor?.cgColor

        NSLayoutConstraint.activate([
            lemonGlow.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -56),
            lemonGlow.topAnchor.constraint(equalTo: view.topAnchor, constant: -78),
            lemonGlow.widthAnchor.constraint(equalToConstant: 154),
            lemonGlow.heightAnchor.constraint(equalToConstant: 116),

            oceanGlow.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 28),
            oceanGlow.topAnchor.constraint(equalTo: view.topAnchor, constant: -86),
            oceanGlow.widthAnchor.constraint(equalToConstant: 212),
            oceanGlow.heightAnchor.constraint(equalToConstant: 144)
        ])
    }

    private func constructIdentityLayout() {
        identityTerminalTable.backgroundColor = .clear
        identityTerminalTable.separatorStyle = .none
        identityTerminalTable.showsVerticalScrollIndicator = false
        identityTerminalTable.dataSource = self
        identityTerminalTable.delegate = self
        identityTerminalTable.register(ProfileDataCell.self, forCellReuseIdentifier: ProfileDataCell.reuseID)
        identityTerminalTable.register(MoodBoardCell.self, forCellReuseIdentifier: MoodBoardCell.reuseID)
        identityTerminalTable.contentInset = UIEdgeInsets(top: 6, left: 0, bottom: 18, right: 0)
        identityTerminalTable.refreshControl = refreshControl
        refreshControl.tintColor = .white
        refreshControl.addTarget(self, action: #selector(loadUserInfo), for: .valueChanged)

        view.addSubview(identityTerminalTable)
        identityTerminalTable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            identityTerminalTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            identityTerminalTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            identityTerminalTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            identityTerminalTable.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        buildProfileHeader()
    }

    private func buildProfileHeader() {
        profileHeaderVessel.backgroundColor = .clear
        profileHeaderVessel.addSubview(avatarRingView)
        avatarRingView.addSubview(coreAvatarView)
        avatarRingView.isUserInteractionEnabled = true
        avatarRingView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openEditProfile)))

        coreAvatarView.layer.cornerRadius = 38.5
        coreAvatarView.clipsToBounds = true
        coreAvatarView.contentMode = .scaleAspectFill
        coreAvatarView.backgroundColor = UIColor(red: 0.55, green: 0.18, blue: 1.0, alpha: 1)

        nameLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        nameLabel.textColor = .white
        nameLabel.lineBreakMode = .byTruncatingTail
        profileHeaderVessel.addSubview(nameLabel)

        vipBadge.text = "VIP"
        vipBadge.textColor = .white
        vipBadge.font = .italicSystemFont(ofSize: 13)
        vipBadge.textAlignment = .center
        vipBadge.backgroundColor = UIColor(red: 250 / 255, green: 99 / 255, blue: 147 / 255, alpha: 1)
        vipBadge.layer.cornerRadius = 8
        vipBadge.clipsToBounds = true
        vipBadge.isUserInteractionEnabled = true
        vipBadge.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openVIPInfo)))
        profileHeaderVessel.addSubview(vipBadge)

        editBtn.setImage(UIImage(systemName: "pencil.circle.fill"), for: .normal)
        editBtn.tintColor = UIColor.white.withAlphaComponent(0.7)
        editBtn.addTarget(self, action: #selector(openEditProfile), for: .touchUpInside)
        profileHeaderVessel.addSubview(editBtn)

        signatureLabel.font = .systemFont(ofSize: 16, weight: .regular)
        signatureLabel.textColor = UIColor.white.withAlphaComponent(0.71)
        signatureLabel.numberOfLines = 2
        profileHeaderVessel.addSubview(signatureLabel)

        setupStatsBar()
        profileHeaderVessel.addSubview(statsStack)

        [avatarRingView, coreAvatarView, nameLabel, vipBadge, editBtn, signatureLabel, statsStack].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            avatarRingView.topAnchor.constraint(equalTo: profileHeaderVessel.topAnchor, constant: 28),
            avatarRingView.leadingAnchor.constraint(equalTo: profileHeaderVessel.leadingAnchor, constant: 30),
            avatarRingView.widthAnchor.constraint(equalToConstant: 96),
            avatarRingView.heightAnchor.constraint(equalToConstant: 96),

            coreAvatarView.centerXAnchor.constraint(equalTo: avatarRingView.centerXAnchor),
            coreAvatarView.centerYAnchor.constraint(equalTo: avatarRingView.centerYAnchor),
            coreAvatarView.widthAnchor.constraint(equalToConstant: 77),
            coreAvatarView.heightAnchor.constraint(equalToConstant: 77),

            nameLabel.leadingAnchor.constraint(equalTo: avatarRingView.trailingAnchor, constant: 24),
            nameLabel.topAnchor.constraint(equalTo: avatarRingView.topAnchor, constant: 29),
            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: vipBadge.leadingAnchor, constant: -10),

            vipBadge.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            vipBadge.widthAnchor.constraint(equalToConstant: 38),
            vipBadge.heightAnchor.constraint(equalToConstant: 16),

            editBtn.leadingAnchor.constraint(equalTo: vipBadge.trailingAnchor, constant: 12),
            editBtn.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            editBtn.widthAnchor.constraint(equalToConstant: 28),
            editBtn.heightAnchor.constraint(equalToConstant: 28),
            editBtn.trailingAnchor.constraint(lessThanOrEqualTo: profileHeaderVessel.trailingAnchor, constant: -20),

            signatureLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            signatureLabel.trailingAnchor.constraint(equalTo: profileHeaderVessel.trailingAnchor, constant: -26),
            signatureLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 12),

            statsStack.leadingAnchor.constraint(equalTo: profileHeaderVessel.leadingAnchor, constant: 42),
            statsStack.trailingAnchor.constraint(equalTo: profileHeaderVessel.trailingAnchor, constant: -42),
            statsStack.topAnchor.constraint(equalTo: avatarRingView.bottomAnchor, constant: 24),
            statsStack.heightAnchor.constraint(equalToConstant: 58)
        ])

        identityTerminalTable.tableHeaderView = profileHeaderVessel
        applyProfileSnapshot()
    }

    private func setupStatsBar() {
        statsStack.axis = .horizontal
        statsStack.distribution = .fillEqually
        statCountLabels.removeAll()
        ["Friends", "Following", "Followers"].enumerated().forEach { index, title in
            let container = UIStackView()
            container.axis = .vertical
            container.alignment = .center
            container.spacing = 4
            container.tag = index
            if index > 0 {
                container.isUserInteractionEnabled = true
                container.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openRelationshipListFromStat(_:))))
            }

            let countLabel = UILabel()
            countLabel.font = .systemFont(ofSize: 24, weight: .bold)
            countLabel.textColor = .white

            let titleLabel = UILabel()
            titleLabel.text = title
            titleLabel.font = .systemFont(ofSize: 16, weight: .regular)
            titleLabel.textColor = UIColor.white.withAlphaComponent(0.43)

            container.addArrangedSubview(countLabel)
            container.addArrangedSubview(titleLabel)
            statsStack.addArrangedSubview(container)
            statCountLabels.append(countLabel)
        }
    }

    private func refreshHeaderFrame() {
        let width = identityTerminalTable.bounds.width
        guard width > 0 else { return }
        let targetFrame = CGRect(x: 0, y: 0, width: width, height: 234)
        if profileHeaderVessel.frame != targetFrame {
            profileHeaderVessel.frame = targetFrame
            identityTerminalTable.tableHeaderView = profileHeaderVessel
        }
    }

    @objc private func loadUserInfo() {
        PaulaMeAPI.loadCurrentUserInfo { [weak self] profile in
            DispatchQueue.main.async {
                guard let self else { return }
                self.profile = profile
                self.applyProfileSnapshot()
                self.identityTerminalTable.reloadData()
                self.refreshControl.endRefreshing()
            }
        }
    }

    private func applyProfileSnapshot() {
        let session = PaulaAuthSession.current
        if let data = session?.avatarData, let localImage = UIImage(data: data), profile.avatarURL == session?.avatarURL {
            coreAvatarView.image = localImage
        } else {
            coreAvatarView.setPaulaImage(
                remoteURL: profile.avatarURL,
                placeholder: PaulaAuthSession.avatarImage(for: session)
            )
        }
        avatarRingView.setRemoteFrame(profile.avatarFrameURL)
        nameLabel.text = profile.name
        signatureLabel.text = profile.brief
        vipBadge.isHidden = !profile.isVIP
        statCountLabels[safe: 0]?.text = "\(profile.friendsCount)"
        statCountLabels[safe: 1]?.text = "\(profile.followingCount)"
        statCountLabels[safe: 2]?.text = "\(profile.followersCount)"
        configurePillButton(goldButton, title: profile.coinBalance, imageName: "bitcoinsign.circle.fill")
    }

    @objc private func openSettings() {
        pushH5(.echoWaveRise, param: "")
    }

    @objc private func openGoldCharge() {
        pushH5(.arenaFusionTrail, param: "")
    }

    @objc private func openVIPInfo() {
        pushH5(.echoPulseField, param: "")
    }

    @objc private func openRelationshipListFromStat(_ recognizer: UITapGestureRecognizer) {
        guard let index = recognizer.view?.tag else { return }
        switch index {
        case 1:
            pushH5(.streamRhythmField, param: "1")
        case 2:
            pushH5(.streamRhythmField, param: "2")
        default:
            break
        }
    }

    @objc private func openEditProfile() {
        if PaulaAuthSession.current == nil {
            CatruiPulseOrchestrator.shared.launchIdentityPortal()
            return
        }
        pushH5(.echoOrbitField, param: "")
    }

    private func pushH5(_ route: NWFUclipFusionOrbit, param: String) {
        pushPaulaH5(route, param: param)
    }
}

final class ProfileAvatarRingView: UIView {
    private let gradientLayer = CAGradientLayer()
    private let remoteFrameImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = bounds.width / 2
        remoteFrameImageView.frame = bounds
        layer.cornerRadius = bounds.width / 2
    }

    func setRemoteFrame(_ remoteURL: String?) {
        remoteFrameImageView.setPaulaImage(remoteURL: remoteURL, placeholder: nil)
        remoteFrameImageView.isHidden = remoteURL == nil
    }

    private func setupView() {
        clipsToBounds = false
        gradientLayer.colors = [
            UIColor(red: 255 / 255, green: 232 / 255, blue: 116 / 255, alpha: 1).cgColor,
            UIColor(red: 46 / 255, green: 163 / 255, blue: 131 / 255, alpha: 1).cgColor,
            UIColor(red: 56 / 255, green: 135 / 255, blue: 247 / 255, alpha: 1).cgColor,
            UIColor(red: 140 / 255, green: 59 / 255, blue: 255 / 255, alpha: 1).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        layer.insertSublayer(gradientLayer, at: 0)

        remoteFrameImageView.contentMode = .scaleAspectFit
        remoteFrameImageView.isHidden = true
        addSubview(remoteFrameImageView)
    }
}

// MARK: - 心情展示单元格
final class MoodBoardCell: UITableViewCell {
    static let reuseID = "MoodBoardCell"

    private let glassPlate = UIView()
    private let titleLabel = UILabel()
    private let contentLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        contentView.backgroundColor = .clear

        glassPlate.backgroundColor = UIColor(red: 26 / 255, green: 26 / 255, blue: 57 / 255, alpha: 0.67)
        glassPlate.layer.cornerRadius = 10
        glassPlate.clipsToBounds = true
        contentView.addSubview(glassPlate)

        titleLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        titleLabel.textColor = .white
        glassPlate.addSubview(titleLabel)

        contentLabel.font = .systemFont(ofSize: 16, weight: .regular)
        contentLabel.textColor = UIColor(red: 198 / 255, green: 198 / 255, blue: 198 / 255, alpha: 1)
        contentLabel.numberOfLines = 0
        glassPlate.addSubview(contentLabel)

        [glassPlate, titleLabel, contentLabel].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        NSLayoutConstraint.activate([
            glassPlate.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7),
            glassPlate.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            glassPlate.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            glassPlate.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),

            titleLabel.topAnchor.constraint(equalTo: glassPlate.topAnchor, constant: 14),
            titleLabel.leadingAnchor.constraint(equalTo: glassPlate.leadingAnchor, constant: 15),

            contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            contentLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            contentLabel.trailingAnchor.constraint(equalTo: glassPlate.trailingAnchor, constant: -15),
            contentLabel.bottomAnchor.constraint(lessThanOrEqualTo: glassPlate.bottomAnchor, constant: -18)
        ])
    }

    func update(title: String, content: String) {
        titleLabel.text = title
        contentLabel.text = content.isEmpty ? "-" : content
    }

    required init?(coder: NSCoder) { fatalError() }
}

// MARK: - 属性展示单元格
final class ProfileDataCell: UITableViewCell {
    static let reuseID = "ProfileDataCell"

    private let glassPlate = UIView()
    private let labelNode = UILabel()
    private let valueNode = UILabel()
    private let forwardIcon = UIImageView(image: UIImage(systemName: "chevron.right"))

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        contentView.backgroundColor = .clear

        glassPlate.backgroundColor = UIColor(red: 26 / 255, green: 26 / 255, blue: 57 / 255, alpha: 0.67)
        glassPlate.layer.cornerRadius = 10
        glassPlate.clipsToBounds = true
        contentView.addSubview(glassPlate)

        labelNode.font = .systemFont(ofSize: 18, weight: .semibold)
        labelNode.textColor = .white
        glassPlate.addSubview(labelNode)

        valueNode.font = .systemFont(ofSize: 17, weight: .regular)
        valueNode.textColor = UIColor(red: 198 / 255, green: 198 / 255, blue: 198 / 255, alpha: 1)
        valueNode.textAlignment = .right
        glassPlate.addSubview(valueNode)

        forwardIcon.tintColor = .white
        forwardIcon.contentMode = .scaleAspectFit
        glassPlate.addSubview(forwardIcon)

        [glassPlate, labelNode, valueNode, forwardIcon].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        NSLayoutConstraint.activate([
            glassPlate.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            glassPlate.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            glassPlate.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            glassPlate.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            glassPlate.heightAnchor.constraint(equalToConstant: 53),

            labelNode.leadingAnchor.constraint(equalTo: glassPlate.leadingAnchor, constant: 15),
            labelNode.centerYAnchor.constraint(equalTo: glassPlate.centerYAnchor),

            forwardIcon.trailingAnchor.constraint(equalTo: glassPlate.trailingAnchor, constant: -16),
            forwardIcon.centerYAnchor.constraint(equalTo: glassPlate.centerYAnchor),
            forwardIcon.widthAnchor.constraint(equalToConstant: 9),
            forwardIcon.heightAnchor.constraint(equalToConstant: 14),

            valueNode.leadingAnchor.constraint(greaterThanOrEqualTo: labelNode.trailingAnchor, constant: 10),
            valueNode.trailingAnchor.constraint(equalTo: forwardIcon.leadingAnchor, constant: -13),
            valueNode.centerYAnchor.constraint(equalTo: glassPlate.centerYAnchor)
        ])
    }

    func sync(label: String, value: String) {
        labelNode.text = label
        valueNode.text = value
    }

    required init?(coder: NSCoder) { fatalError() }
}

// MARK: - DataSource
extension PulseMePartyQueueFlux: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        profileOptions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let trace = profileOptions[indexPath.row]
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: MoodBoardCell.reuseID, for: indexPath) as! MoodBoardCell
            cell.update(title: trace.title, content: trace.value)
            return cell
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileDataCell.reuseID, for: indexPath) as! ProfileDataCell
        cell.sync(label: trace.title, value: trace.value)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == 0 ? 104 : 69
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let option = profileOptions[indexPath.row]
        guard let route = option.route else { return }
        pushH5(route, param: option.routeParam)
    }
}

private extension Collection {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
