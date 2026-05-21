//
//  EchoFusionRise.swift
//  NoWamFlareu
//
//  Created by  on 2026/5/6.
//

import UIKit

class EchoFusionRise: UIViewController {
    private var messageThreadParsingLavoItems: [PaulaMessageThread] = []

    private let messageThreadTableSavi = UITableView(frame: .zero, style: .plain)
    private let pullRefreshCompletionMavoControl = UIRefreshControl()
    private let userRosterHydrationMavoHeader = UIView()
    private let relationUserHydrationDavoStrip = StriderPulsePulseBelt(withpage: 2)
    private let emptyStateRenderingPavoView = MessageEmptyStateView()
    private let neonAccentBalancingViro = UIView()
    private let purpleBadgeStylingKeno = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        darkModeContrastLuma()
        navigationBarRecoverySilo()
        viewHierarchyInsertionMilo()
        arenaTileCompositionSavo()
        headerTapForwardingSora()
        messageThreadParsingLavoPage()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        scrollEdgeAppearancePera()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableHeaderSizingSora()
    }

    private func darkModeContrastLuma() {
        view.backgroundColor = UIColor(red: 2 / 255, green: 4 / 255, blue: 7 / 255, alpha: 1)
        shadowGlowRenderingQavi()
    }

    private func navigationBarRecoverySilo() {
        let titleLabel = UIImageView(image: UIImage(named: "MesTiaolersage"))
        titleLabel.contentMode = .scaleAspectFit
        titleLabel.frame = CGRect(x: 0, y: 0, width: 130, height: 26)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)

        let notificationButton = UIButton(type: .custom)
        notificationButton.setImage(UIImage(named: "leadsertio"), for: .normal)
        notificationButton.imageView?.contentMode = .scaleAspectFit
        notificationButton.frame = CGRect(x: 0, y: 0, width: 118, height: 29)
        notificationButton.addTarget(self, action: #selector(notificationRouteOpeningQeli), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: notificationButton)
    }

    private func scrollEdgeAppearancePera() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .clear
        appearance.shadowColor = .clear
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.isTranslucent = true
    }

    private func shadowGlowRenderingQavi() {
        neonAccentBalancingViro.backgroundColor = UIColor(red: 207 / 255, green: 214 / 255, blue: 99 / 255, alpha: 0.45)
        purpleBadgeStylingKeno.backgroundColor = UIColor(red: 55 / 255, green: 97 / 255, blue: 172 / 255, alpha: 0.32)
        neonAccentBalancingViro.layer.cornerRadius = 58
        purpleBadgeStylingKeno.layer.cornerRadius = 72

        [neonAccentBalancingViro, purpleBadgeStylingKeno].forEach {
            $0.layer.shadowOpacity = 0.9
            $0.layer.shadowRadius = 42
            $0.layer.shadowOffset = .zero
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        neonAccentBalancingViro.layer.shadowColor = neonAccentBalancingViro.backgroundColor?.cgColor
        purpleBadgeStylingKeno.layer.shadowColor = purpleBadgeStylingKeno.backgroundColor?.cgColor

        NSLayoutConstraint.activate([
            neonAccentBalancingViro.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -56),
            neonAccentBalancingViro.topAnchor.constraint(equalTo: view.topAnchor, constant: -78),
            neonAccentBalancingViro.widthAnchor.constraint(equalToConstant: 154),
            neonAccentBalancingViro.heightAnchor.constraint(equalToConstant: 116),

            purpleBadgeStylingKeno.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 28),
            purpleBadgeStylingKeno.topAnchor.constraint(equalTo: view.topAnchor, constant: -86),
            purpleBadgeStylingKeno.widthAnchor.constraint(equalToConstant: 212),
            purpleBadgeStylingKeno.heightAnchor.constraint(equalToConstant: 144)
        ])
    }

    private func viewHierarchyInsertionMilo() {
        messageThreadTableSavi.backgroundColor = .clear
        messageThreadTableSavi.separatorStyle = .none
        messageThreadTableSavi.showsVerticalScrollIndicator = false
        messageThreadTableSavi.dataSource = self
        messageThreadTableSavi.delegate = self
        messageThreadTableSavi.register(MessageThreadCell.self, forCellReuseIdentifier: MessageThreadCell.reuseID)
        messageThreadTableSavi.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 18, right: 0)
        messageThreadTableSavi.refreshControl = pullRefreshCompletionMavoControl
        pullRefreshCompletionMavoControl.tintColor = .white
        pullRefreshCompletionMavoControl.addTarget(self, action: #selector(messageThreadParsingLavoPage), for: .valueChanged)

        view.addSubview(messageThreadTableSavi)
        view.addSubview(emptyStateRenderingPavoView)

        userRosterHydrationMavoHeader.addSubview(relationUserHydrationDavoStrip)
        relationUserHydrationDavoStrip.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            relationUserHydrationDavoStrip.topAnchor.constraint(equalTo: userRosterHydrationMavoHeader.topAnchor),
            relationUserHydrationDavoStrip.leadingAnchor.constraint(equalTo: userRosterHydrationMavoHeader.leadingAnchor),
            relationUserHydrationDavoStrip.trailingAnchor.constraint(equalTo: userRosterHydrationMavoHeader.trailingAnchor),
            relationUserHydrationDavoStrip.heightAnchor.constraint(equalToConstant: 116)
        ])
        messageThreadTableSavi.tableHeaderView = userRosterHydrationMavoHeader
    }

    private func arenaTileCompositionSavo() {
        messageThreadTableSavi.translatesAutoresizingMaskIntoConstraints = false
        emptyStateRenderingPavoView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            messageThreadTableSavi.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            messageThreadTableSavi.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            messageThreadTableSavi.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            messageThreadTableSavi.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            emptyStateRenderingPavoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptyStateRenderingPavoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 270),
            emptyStateRenderingPavoView.widthAnchor.constraint(equalToConstant: 150),
            emptyStateRenderingPavoView.heightAnchor.constraint(equalToConstant: 130)
        ])
    }

    private func headerTapForwardingSora() {
        relationUserHydrationDavoStrip.rosterTapRelayKumo = { [weak self] user in
            self?.messageThreadRoutingNilo(playerIdentitySignalMoro: user.playerIdentitySignalMoro)
        }
    }

    private func tableHeaderSizingSora() {
        let width = messageThreadTableSavi.bounds.width
        guard width > 0 else { return }
        let targetFrame = CGRect(x: 0, y: 0, width: width + 30, height: 136)
        if userRosterHydrationMavoHeader.frame != targetFrame {
            userRosterHydrationMavoHeader.frame = targetFrame
            messageThreadTableSavi.tableHeaderView = userRosterHydrationMavoHeader
        }
    }

    @objc private func messageThreadParsingLavoPage() {
        let group = DispatchGroup()
        var latestUsers: [PulseRosterUser]?
        var latestThreads: [PaulaMessageThread]?

        group.enter()
        PaulaHomeAPI.userRosterHydrationMavo { playerRosterDeckVani in
            latestUsers = playerRosterDeckVani
            group.leave()
        }

        group.enter()
        PaulaMessageAPI.threadCellAvatarLoadingFiro { messages in
            latestThreads = messages
            group.leave()
        }

        group.notify(queue: .main) { [weak self] in
            guard let self else { return }
            self.relationUserHydrationDavoStrip.rosterPulseRefreshVami(latestUsers ?? PaulaHomeAPI.fallbackUserFactoryRumi())
            self.messageThreadParsingLavoItems = latestThreads ?? []
            self.emptyStateRenderingPavoView.isHidden = !self.messageThreadParsingLavoItems.isEmpty
            self.messageThreadTableSavi.reloadData()
            self.pullRefreshCompletionMavoControl.endRefreshing()
        }
    }
    
//    @objc private func pullRefreshCompletionMavo() {
//        let group = DispatchGroup()
//        var latestUsers: [PulseRosterUser]?
//        var latestRooms: [SquadChamber]?
//
//        group.enter()
//        PaulaHomeAPI.userRosterHydrationMavo { playerRosterDeckVani in
//            latestUsers = playerRosterDeckVani
//            group.leave()
//        }
//
//        group.enter()
//        PaulaHomeAPI.voiceRoomRoutingNima { roomDeckVectorQemi in
//            latestRooms = roomDeckVectorQemi
//            group.leave()
//        }
//
//        group.notify(queue: .main) { [weak self] in
//            guard let self else { return }
//            if let latestUsers {
//                self.memberStripHydrationQaro.rosterPulseRefreshVami(latestUsers)
//            }
//            if let latestRooms, !latestRooms.isEmpty {
//                self.voiceRoomCompositionNori = latestRooms
//                self.roomHeightConstraintTavi?.constant = self.twoColumnRoomLayoutVilo(for: latestRooms.count)
//                self.recommendGridReloadingVoni.reloadData()
//            }
//            self.pullRefreshCompletionMavoControl.endRefreshing()
//        }
//    }

    @objc private func notificationRouteOpeningQeli() {
        pushPaulaFashion(.NWEUSignalBloom)
    }

    private func messageThreadRoutingNilo(playerIdentitySignalMoro: String) {
        guard !playerIdentitySignalMoro.isEmpty else { return }
        pushPaulaFashion(.clipRhythmTrail, param: playerIdentitySignalMoro)
    }
}

final class MessageThreadCell: UITableViewCell {
    static let reuseID = "MessageThreadCell"

    private let avatarFrameCompositingLivo = UIImageView()
    private let avatarRibbonRenderingQivo = UILabel()
    private let glassPanelRenderingJariCard = UIView()
    private let gradientBadgeDrawingSoli = CAGradientLayer()
    private let nameLabel = UILabel()
    private let contentPreviewFallbackSumiLabel = UILabel()
    private let vipExpireDetectionHaviBadge = UILabel()
    private let unreadDotRenderingTeli = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        cellCornerClippingDera()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientBadgeDrawingSoli.frame = glassPanelRenderingJariCard.bounds
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        avatarFrameCompositingLivo.image = nil
        nameLabel.text = nil
        contentPreviewFallbackSumiLabel.text = nil
    }

    func sync(with chatThreadPulseQiro: PaulaMessageThread) {
        nameLabel.text = chatThreadPulseQiro.name
        contentPreviewFallbackSumiLabel.text = chatThreadPulseQiro.messageCopyRibbonSora
        avatarFrameCompositingLivo.remoteImageRequestVera(
            remoteURL: chatThreadPulseQiro.avatarStreamEndpointKiva,
            placeholder: PaulaAuthSession.defaultAvatarImage(size: CGSize(width: 96, height: 96))
        )
        vipExpireDetectionHaviBadge.isHidden = !chatThreadPulseQiro.vipAuraFlagPelo
        unreadDotRenderingTeli.isHidden = !chatThreadPulseQiro.unreadStateFlagMavi
    }

    private func cellCornerClippingDera() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none

        gradientBadgeDrawingSoli.colors = [
            UIColor(red: 31 / 255, green: 2 / 255, blue: 37 / 255, alpha: 0.72).cgColor,
            UIColor(red: 63 / 255, green: 41 / 255, blue: 69 / 255, alpha: 0.72).cgColor
        ]
        gradientBadgeDrawingSoli.startPoint = CGPoint(x: 0, y: 0.5)
        gradientBadgeDrawingSoli.endPoint = CGPoint(x: 1, y: 0.5)
        glassPanelRenderingJariCard.layer.insertSublayer(gradientBadgeDrawingSoli, at: 0)
        glassPanelRenderingJariCard.layer.cornerRadius = 5
        glassPanelRenderingJariCard.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        glassPanelRenderingJariCard.layer.masksToBounds = true
        contentView.addSubview(glassPanelRenderingJariCard)

        avatarFrameCompositingLivo.backgroundColor = UIColor(red: 187 / 255, green: 91 / 255, blue: 255 / 255, alpha: 1)
        avatarFrameCompositingLivo.contentMode = .scaleAspectFill
        avatarFrameCompositingLivo.layer.cornerRadius = 44.5
        avatarFrameCompositingLivo.clipsToBounds = true
        contentView.addSubview(avatarFrameCompositingLivo)

        avatarRibbonRenderingQivo.text = "Live"
        avatarRibbonRenderingQivo.textColor = .white
        avatarRibbonRenderingQivo.font = .systemFont(ofSize: 13, weight: .medium)
        avatarRibbonRenderingQivo.textAlignment = .center
        avatarRibbonRenderingQivo.backgroundColor = UIColor(red: 210 / 255, green: 12 / 255, blue: 224 / 255, alpha: 0.82)
        contentView.addSubview(avatarRibbonRenderingQivo)

        nameLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        nameLabel.textColor = .white
        nameLabel.lineBreakMode = .byTruncatingTail
        glassPanelRenderingJariCard.addSubview(nameLabel)

        contentPreviewFallbackSumiLabel.font = .systemFont(ofSize: 15, weight: .regular)
        contentPreviewFallbackSumiLabel.textColor = UIColor.white.withAlphaComponent(0.71)
        contentPreviewFallbackSumiLabel.lineBreakMode = .byTruncatingTail
        glassPanelRenderingJariCard.addSubview(contentPreviewFallbackSumiLabel)

        vipExpireDetectionHaviBadge.text = "VIP"
        vipExpireDetectionHaviBadge.textColor = .white
        vipExpireDetectionHaviBadge.font = .italicSystemFont(ofSize: 12)
        vipExpireDetectionHaviBadge.textAlignment = .center
        vipExpireDetectionHaviBadge.backgroundColor = UIColor(red: 250 / 255, green: 99 / 255, blue: 147 / 255, alpha: 1)
        vipExpireDetectionHaviBadge.layer.cornerRadius = 7
        vipExpireDetectionHaviBadge.clipsToBounds = true
        glassPanelRenderingJariCard.addSubview(vipExpireDetectionHaviBadge)

        unreadDotRenderingTeli.backgroundColor = UIColor(red: 250 / 255, green: 99 / 255, blue: 147 / 255, alpha: 1)
        unreadDotRenderingTeli.layer.cornerRadius = 4
        glassPanelRenderingJariCard.addSubview(unreadDotRenderingTeli)

        [glassPanelRenderingJariCard, avatarFrameCompositingLivo, avatarRibbonRenderingQivo, nameLabel, contentPreviewFallbackSumiLabel, vipExpireDetectionHaviBadge, unreadDotRenderingTeli].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            avatarFrameCompositingLivo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            avatarFrameCompositingLivo.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            avatarFrameCompositingLivo.widthAnchor.constraint(equalToConstant: 89),
            avatarFrameCompositingLivo.heightAnchor.constraint(equalToConstant: 89),

            avatarRibbonRenderingQivo.leadingAnchor.constraint(equalTo: avatarFrameCompositingLivo.leadingAnchor, constant: 16),
            avatarRibbonRenderingQivo.trailingAnchor.constraint(equalTo: avatarFrameCompositingLivo.trailingAnchor, constant: -7),
            avatarRibbonRenderingQivo.bottomAnchor.constraint(equalTo: avatarFrameCompositingLivo.bottomAnchor),
            avatarRibbonRenderingQivo.heightAnchor.constraint(equalToConstant: 26),

            glassPanelRenderingJariCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 71),
            glassPanelRenderingJariCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            glassPanelRenderingJariCard.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            glassPanelRenderingJariCard.heightAnchor.constraint(equalToConstant: 70),

            nameLabel.leadingAnchor.constraint(equalTo: glassPanelRenderingJariCard.leadingAnchor, constant: 35),
            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: vipExpireDetectionHaviBadge.leadingAnchor, constant: -10),
            nameLabel.topAnchor.constraint(equalTo: glassPanelRenderingJariCard.topAnchor, constant: 13),

            vipExpireDetectionHaviBadge.leadingAnchor.constraint(greaterThanOrEqualTo: nameLabel.trailingAnchor, constant: 10),
            vipExpireDetectionHaviBadge.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            vipExpireDetectionHaviBadge.widthAnchor.constraint(equalToConstant: 38),
            vipExpireDetectionHaviBadge.heightAnchor.constraint(equalToConstant: 16),

            contentPreviewFallbackSumiLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            contentPreviewFallbackSumiLabel.trailingAnchor.constraint(equalTo: glassPanelRenderingJariCard.trailingAnchor, constant: -20),
            contentPreviewFallbackSumiLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),

            unreadDotRenderingTeli.trailingAnchor.constraint(equalTo: glassPanelRenderingJariCard.trailingAnchor, constant: -14),
            unreadDotRenderingTeli.topAnchor.constraint(equalTo: glassPanelRenderingJariCard.topAnchor, constant: 14),
            unreadDotRenderingTeli.widthAnchor.constraint(equalToConstant: 8),
            unreadDotRenderingTeli.heightAnchor.constraint(equalToConstant: 8)
        ])
    }
}

final class MessageEmptyStateView: UIView {
    private let emptyStateIconRenderingPavo = UIImageView()
    private let titleLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func buildLayout() {
        isHidden = true
        emptyStateIconRenderingPavo.image = UIImage(systemName: "envelope.fill")
        emptyStateIconRenderingPavo.tintColor = UIColor(red: 255 / 255, green: 216 / 255, blue: 64 / 255, alpha: 1)
        emptyStateIconRenderingPavo.contentMode = .scaleAspectFit
        addSubview(emptyStateIconRenderingPavo)

        titleLabel.text = "No data"
        titleLabel.textColor = UIColor.white.withAlphaComponent(0.5)
        titleLabel.font = .systemFont(ofSize: 13, weight: .medium)
        titleLabel.textAlignment = .center
        addSubview(titleLabel)

        [emptyStateIconRenderingPavo, titleLabel].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        NSLayoutConstraint.activate([
            emptyStateIconRenderingPavo.topAnchor.constraint(equalTo: topAnchor),
            emptyStateIconRenderingPavo.centerXAnchor.constraint(equalTo: centerXAnchor),
            emptyStateIconRenderingPavo.widthAnchor.constraint(equalToConstant: 85),
            emptyStateIconRenderingPavo.heightAnchor.constraint(equalToConstant: 85),

            titleLabel.topAnchor.constraint(equalTo: emptyStateIconRenderingPavo.bottomAnchor, constant: 14),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

extension EchoFusionRise: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ messageThreadTableSavi: UITableView, numberOfRowsInSection section: Int) -> Int {
        messageThreadParsingLavoItems.count
    }

    func tableView(_ messageThreadTableSavi: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let renderCellNodeKavi = messageThreadTableSavi.dequeueReusableCell(withIdentifier: MessageThreadCell.reuseID, for: indexPath) as! MessageThreadCell
        renderCellNodeKavi.sync(with: messageThreadParsingLavoItems[indexPath.row])
        return renderCellNodeKavi
    }

    func tableView(_ messageThreadTableSavi: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        104
    }

    func tableView(_ messageThreadTableSavi: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatThreadPulseQiro = messageThreadParsingLavoItems[indexPath.row]
        PaulaMessageAPI.readFlagDecodingVumi(threadIdentitySignalPavi: chatThreadPulseQiro.threadIdentitySignalPavi)
        messageThreadRoutingNilo(playerIdentitySignalMoro: chatThreadPulseQiro.playerIdentitySignalMoro)
    }
}
