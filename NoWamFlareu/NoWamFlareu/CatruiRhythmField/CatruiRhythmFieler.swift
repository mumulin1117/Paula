//
//  CatruiRhythmFieler.swift
//  NoWamFlareu
//
//  Created by  on 2026/5/6.
//

import UIKit


class PulseCatruiRhythmFieler: UIViewController {

    private var streamDiscoverySortingSeno: [SquadChamber] = PaulaHomeAPI.streamDiscoverySortingPila()
    private let trendStreamOrderingVilo = UITableView(frame: .zero, style: .plain)
    private let featuredTileHydrationLemi = ForYouHeaderVessel()
    private let pullRefreshCompletionMavoControl = UIRefreshControl()
    private let neonAccentBalancingViro = UIView()
    private let purpleBadgeStylingKeno = UIView()

    private var trendCellSyncingPaxo: [SquadChamber] {
        Array(streamDiscoverySortingSeno.dropFirst())
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        roomEnergyEstimationTali()
        navigationOverlayGuardQina()
        streamTileCompositionKula()
        liveRoomPaginationNari()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        scrollEdgeAppearancePera()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableHeaderSizingSora()
    }

    private func roomEnergyEstimationTali() {
        view.backgroundColor = UIColor(red: 2 / 255, green: 4 / 255, blue: 7 / 255, alpha: 1)
        shadowGlowRenderingQavi()
    }

    private func navigationOverlayGuardQina() {
        let topTitle = UIImageView(image: UIImage(named: "For You"))
        topTitle.contentMode = .scaleAspectFit
        topTitle.frame = CGRect(x: 0, y: 0, width: 112, height: 24)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: topTitle)

        let createActionBtn = UIButton(type: .custom)
        createActionBtn.setImage(UIImage(named: "createrRooomg"), for: .normal)
        createActionBtn.imageView?.contentMode = .scaleAspectFit
        createActionBtn.frame = CGRect(x: 0, y: 0, width: 118, height: 29)
        createActionBtn.addTarget(self, action: #selector(createRoomEntryZavi), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: createActionBtn)
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

    private func streamTileCompositionKula() {
        trendStreamOrderingVilo.backgroundColor = .clear
        trendStreamOrderingVilo.separatorStyle = .none
        trendStreamOrderingVilo.dataSource = self
        trendStreamOrderingVilo.delegate = self
        trendStreamOrderingVilo.showsVerticalScrollIndicator = false
        trendStreamOrderingVilo.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 18, right: 0)
        trendStreamOrderingVilo.register(TrendStreamCell.self, forCellReuseIdentifier: TrendStreamCell.reuseID)
        trendStreamOrderingVilo.refreshControl = pullRefreshCompletionMavoControl
        pullRefreshCompletionMavoControl.tintColor = .white
        pullRefreshCompletionMavoControl.addTarget(self, action: #selector(liveRoomPaginationNari), for: .valueChanged)

        view.addSubview(trendStreamOrderingVilo)
        trendStreamOrderingVilo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            trendStreamOrderingVilo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            trendStreamOrderingVilo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            trendStreamOrderingVilo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            trendStreamOrderingVilo.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        featuredTileHydrationLemi.headerTapForwardingSora = { [weak self] in
            guard let liveRoomCapsuleVexa = self?.streamDiscoverySortingSeno.first else { return }
            self?.liveStatusMappingDeni(liveRoomCapsuleVexa)
        }
        featuredTileHydrationLemi.trainingRoomEntryJiro = { [weak self] in
            self?.teachingRoomRoutingZavi()
        }
        featuredTileHydrationLemi.vipPanelEntryMero = { [weak self] in
            self?.vipPanelEntryMero()
        }
        featuredTileHydrationLemi.configure(with: streamDiscoverySortingSeno.first)
        trendStreamOrderingVilo.tableHeaderView = featuredTileHydrationLemi
    }

    private func tableHeaderSizingSora() {
        let width = trendStreamOrderingVilo.bounds.width
        guard width > 0 else { return }
        let targetFrame = CGRect(x: 0, y: 0, width: width, height: ForYouHeaderVessel.preferredHeight)
        if featuredTileHydrationLemi.frame != targetFrame {
            featuredTileHydrationLemi.frame = targetFrame
            trendStreamOrderingVilo.tableHeaderView = featuredTileHydrationLemi
        }
    }

    @objc private func liveRoomPaginationNari() {
        PaulaHomeAPI.liveRoomPaginationNari { [weak self] roomDeckVectorQemi in
            DispatchQueue.main.async {
                guard let self else { return }
                self.streamDiscoverySortingSeno = roomDeckVectorQemi.isEmpty ? PaulaHomeAPI.streamDiscoverySortingPila() : roomDeckVectorQemi
                self.featuredTileHydrationLemi.configure(with: self.streamDiscoverySortingSeno.first)
                self.trendStreamOrderingVilo.reloadData()
                self.pullRefreshCompletionMavoControl.endRefreshing()
            }
        }
    }

    @objc private func createRoomEntryZavi() {
        pushPaulaFashion(.arenaWaveDrift)
    }

    private func teachingRoomRoutingZavi() {
        let trainingRoomId = trendCellSyncingPaxo.first?.roomStreamIdentityPavo ?? streamDiscoverySortingSeno.first?.roomStreamIdentityPavo ?? ""
        pushPaulaFashion(.NWFUMotionBloom, param: trainingRoomId)
    }

    private func vipPanelEntryMero() {
        pushPaulaFashion(.echoPulseField)
    }

    private func liveStatusMappingDeni(_ liveRoomCapsuleVexa: SquadChamber) {
        pushPaulaFashion(.NWFUclipPulseOrbit, param: liveRoomCapsuleVexa.roomStreamIdentityPavo)
    }

    private func profileParamBridgeRafi(_ playerIdentitySignalMoro: String) {
        guard !playerIdentitySignalMoro.isEmpty else { return }
        pushPaulaFashion(.arenaSignalRise, param: playerIdentitySignalMoro)
    }
}

final class ForYouHeaderVessel: UIView {
    static let preferredHeight: CGFloat = 226

    var headerTapForwardingSora: (() -> Void)?
    var trainingRoomEntryJiro: (() -> Void)?
    var vipPanelEntryMero: (() -> Void)?

    private let featuredLargeTileHydrationLemi = FeaturedLiveTile()
    private let tacticalTrainingCueMeso = UIButton(type: .custom)
    private let vipPanelEntryMeroTile = UIButton(type: .custom)

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with liveRoomCapsuleVexa: SquadChamber?) {
        featuredLargeTileHydrationLemi.configure(with: liveRoomCapsuleVexa)
    }

    private func buildLayout() {
        backgroundColor = .clear
        featuredLargeTileHydrationLemi.addTarget(self, action: #selector(featuredTileHydrationPalo), for: .touchUpInside)

        tacticalTrainingCueMeso.setBackgroundImage(UIImage(named: "tacticalTrainingCueMeso"), for: .normal)
        tacticalTrainingCueMeso.addTarget(self, action: #selector(trainingRoomEntryRalo), for: .touchUpInside)

        vipPanelEntryMeroTile.setBackgroundImage(UIImage(named: "vipPanelEntryMeroTile"), for: .normal)
        vipPanelEntryMeroTile.addTarget(self, action: #selector(vipPanelEntryZalo), for: .touchUpInside)

        [featuredLargeTileHydrationLemi, tacticalTrainingCueMeso, vipPanelEntryMeroTile].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            featuredLargeTileHydrationLemi.leadingAnchor.constraint(equalTo: leadingAnchor),
            featuredLargeTileHydrationLemi.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            featuredLargeTileHydrationLemi.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 185 / 345),
            featuredLargeTileHydrationLemi.heightAnchor.constraint(equalToConstant: 207),

            tacticalTrainingCueMeso.leadingAnchor.constraint(equalTo: featuredLargeTileHydrationLemi.trailingAnchor, constant: 15),
            tacticalTrainingCueMeso.trailingAnchor.constraint(equalTo: trailingAnchor),
            tacticalTrainingCueMeso.topAnchor.constraint(equalTo: featuredLargeTileHydrationLemi.topAnchor),
            tacticalTrainingCueMeso.heightAnchor.constraint(equalToConstant: 104),

            vipPanelEntryMeroTile.leadingAnchor.constraint(equalTo: tacticalTrainingCueMeso.leadingAnchor),
            vipPanelEntryMeroTile.trailingAnchor.constraint(equalTo: trailingAnchor),
            vipPanelEntryMeroTile.topAnchor.constraint(equalTo: tacticalTrainingCueMeso.bottomAnchor, constant: 18),
            vipPanelEntryMeroTile.heightAnchor.constraint(equalToConstant: 95)
        ])
    }

    @objc private func featuredTileHydrationPalo() {
        headerTapForwardingSora?()
    }

    @objc private func trainingRoomEntryRalo() {
        trainingRoomEntryJiro?()
    }

    @objc private func vipPanelEntryZalo() {
        vipPanelEntryMero?()
    }
}

final class FeaturedLiveTile: UIControl {
    private let coverImageHydrationRexa = UIImageView()
    private let bottomPanelCompositingRiku = UIView()
    private let streamBadgeVisibilityRola = UILabel()
    private let titleLabel = UILabel()
    private let participantAvatarStackZori = [UIImageView(), UIImageView(), UIImageView()]

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with liveRoomCapsuleVexa: SquadChamber?) {
        titleLabel.text = liveRoomCapsuleVexa?.title ?? "Oh? And what do you hear?"
        coverImageHydrationRexa.remoteImageRequestVera(
            remoteURL: liveRoomCapsuleVexa?.coverStreamEndpointRumi,
            placeholder: UIImage(named: liveRoomCapsuleVexa?.coverFallbackAssetQaro ?? "gamehold")
        )
        participantAvatarStackZori.enumerated().forEach { selectionIndexPulseHemi, imageView in
            let multicastAvatarMappingPalo: String?
            if let streamUserAvatarParsingRexo = liveRoomCapsuleVexa?.participantAvatarQueueZori, selectionIndexPulseHemi < streamUserAvatarParsingRexo.count {
                multicastAvatarMappingPalo = streamUserAvatarParsingRexo[selectionIndexPulseHemi]
            } else {
                multicastAvatarMappingPalo = liveRoomCapsuleVexa?.hostAvatarEndpointTuni
            }

            imageView.remoteImageRequestVera(
                remoteURL: multicastAvatarMappingPalo,
                placeholder: PaulaAuthSession.defaultAvatarImage(size: CGSize(width: 28, height: 28))
            )
        }
    }

    private func buildLayout() {
        backgroundColor = UIColor(red: 136 / 255, green: 91 / 255, blue: 247 / 255, alpha: 1)
        layer.cornerRadius = 15
        clipsToBounds = true

        coverImageHydrationRexa.contentMode = .scaleAspectFill
        coverImageHydrationRexa.clipsToBounds = true
        addSubview(coverImageHydrationRexa)

        bottomPanelCompositingRiku.backgroundColor = UIColor(red: 136 / 255, green: 91 / 255, blue: 247 / 255, alpha: 1)
        addSubview(bottomPanelCompositingRiku)
        bottomPanelCompositingRiku.isUserInteractionEnabled  = true
        streamBadgeVisibilityRola.text = "Live"
        streamBadgeVisibilityRola.font = .systemFont(ofSize: 12, weight: .semibold)
        streamBadgeVisibilityRola.textColor = .white
        streamBadgeVisibilityRola.textAlignment = .center
        streamBadgeVisibilityRola.backgroundColor = UIColor(red: 140 / 255, green: 45 / 255, blue: 226 / 255, alpha: 1)
        streamBadgeVisibilityRola.layer.cornerRadius = 8
        streamBadgeVisibilityRola.clipsToBounds = true
        addSubview(streamBadgeVisibilityRola)

        titleLabel.font = .systemFont(ofSize: 15, weight: .regular)
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 2
        titleLabel.lineBreakMode = .byWordWrapping
        bottomPanelCompositingRiku.addSubview(titleLabel)

        participantAvatarStackZori.enumerated().forEach { selectionIndexPulseHemi, imageView in
            imageView.layer.cornerRadius = 13
            imageView.layer.borderColor = UIColor.white.cgColor
            imageView.layer.borderWidth = 1
            imageView.clipsToBounds = true
            imageView.contentMode = .scaleAspectFill
            imageView.tag = selectionIndexPulseHemi
            bottomPanelCompositingRiku.addSubview(imageView)
        }

        [coverImageHydrationRexa, bottomPanelCompositingRiku, streamBadgeVisibilityRola, titleLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        participantAvatarStackZori.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        NSLayoutConstraint.activate([
            coverImageHydrationRexa.topAnchor.constraint(equalTo: topAnchor),
            coverImageHydrationRexa.leadingAnchor.constraint(equalTo: leadingAnchor),
            coverImageHydrationRexa.trailingAnchor.constraint(equalTo: trailingAnchor),
            coverImageHydrationRexa.heightAnchor.constraint(equalToConstant: 104),

            bottomPanelCompositingRiku.topAnchor.constraint(equalTo: coverImageHydrationRexa.bottomAnchor),
            bottomPanelCompositingRiku.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomPanelCompositingRiku.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomPanelCompositingRiku.bottomAnchor.constraint(equalTo: bottomAnchor),

            streamBadgeVisibilityRola.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            streamBadgeVisibilityRola.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            streamBadgeVisibilityRola.widthAnchor.constraint(equalToConstant: 46),
            streamBadgeVisibilityRola.heightAnchor.constraint(equalToConstant: 16),

            titleLabel.leadingAnchor.constraint(equalTo: bottomPanelCompositingRiku.leadingAnchor, constant: 19),
            titleLabel.trailingAnchor.constraint(equalTo: bottomPanelCompositingRiku.trailingAnchor, constant: -10),
            titleLabel.bottomAnchor.constraint(equalTo: bottomPanelCompositingRiku.bottomAnchor, constant: -12)
        ])

        for (selectionIndexPulseHemi, imageView) in participantAvatarStackZori.enumerated() {
            NSLayoutConstraint.activate([
                imageView.leadingAnchor.constraint(equalTo: bottomPanelCompositingRiku.leadingAnchor, constant: 29 + CGFloat(selectionIndexPulseHemi * 20)),
                imageView.topAnchor.constraint(equalTo: bottomPanelCompositingRiku.topAnchor, constant: 29),
                imageView.widthAnchor.constraint(equalToConstant: 26),
                imageView.heightAnchor.constraint(equalToConstant: 26)
            ])
        }
    }
}

// MARK: - Trend Cell
final class TrendStreamCell: UITableViewCell {
    static let reuseID = "TrendStreamCell"
    var hostProfileTapRoutingMiva: (() -> Void)?

    private let glassPanelRenderingJari = UIView()
    private let thumbnailPrefetchQueueDori = UIImageView()
    private let liveRibbonGradientTavo = LiveRibbonView()
    private let nameLabel = UILabel()
    private let contentPreviewFallbackSumi = UILabel()
    private let followButtonStateKuro = UIButton(type: .custom)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        cellCornerClippingDera()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        hostProfileTapRoutingMiva = nil
        thumbnailPrefetchQueueDori.image = nil
        nameLabel.text = nil
        contentPreviewFallbackSumi.text = nil
    }

    func sync(with liveRoomCapsuleVexa: SquadChamber, isFollowing: Bool) {
        nameLabel.text = liveRoomCapsuleVexa.hostAliasCueVero
        contentPreviewFallbackSumi.text = liveRoomCapsuleVexa.title
        thumbnailPrefetchQueueDori.remoteImageRequestVera(
            remoteURL: liveRoomCapsuleVexa.coverStreamEndpointRumi,
            placeholder: UIImage(named: liveRoomCapsuleVexa.coverFallbackAssetQaro ?? "allopiehhhh")
        )
        
        liveRibbonGradientTavo.isHidden =   (liveRoomCapsuleVexa.livesataus != -1 )
        
        
        let systemLockIconRenderingPori = isFollowing ? "checkmark" : "plus"
        let icon = UIImage(systemName: systemLockIconRenderingPori, withConfiguration: UIImage.SymbolConfiguration(pointSize: 13, weight: .bold))
        followButtonStateKuro.setImage(icon, for: .normal)
        followButtonStateKuro.backgroundColor = isFollowing
            ? UIColor(red: 255 / 255, green: 185 / 255, blue: 100 / 255, alpha: 1)
            : UIColor(red: 166 / 255, green: 130 / 255, blue: 255 / 255, alpha: 1)
        followButtonStateKuro.layer.borderColor = (isFollowing ? UIColor.white : UIColor(red: 124 / 255, green: 101 / 255, blue: 255 / 255, alpha: 1)).cgColor
    }

    private func cellCornerClippingDera() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none

        glassPanelRenderingJari.backgroundColor = UIColor(red: 26 / 255, green: 26 / 255, blue: 57 / 255, alpha: 1)
        glassPanelRenderingJari.layer.cornerRadius = 15
        glassPanelRenderingJari.clipsToBounds = true
        contentView.addSubview(glassPanelRenderingJari)

        thumbnailPrefetchQueueDori.backgroundColor = UIColor(red: 187 / 255, green: 91 / 255, blue: 255 / 255, alpha: 1)
        thumbnailPrefetchQueueDori.contentMode = .scaleAspectFill
        thumbnailPrefetchQueueDori.layer.cornerRadius = 10
        thumbnailPrefetchQueueDori.clipsToBounds = true
        glassPanelRenderingJari.addSubview(thumbnailPrefetchQueueDori)
        glassPanelRenderingJari.addSubview(liveRibbonGradientTavo)

        nameLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        nameLabel.textColor = .white
        nameLabel.lineBreakMode = .byTruncatingTail
        glassPanelRenderingJari.addSubview(nameLabel)

        contentPreviewFallbackSumi.font = .systemFont(ofSize: 15, weight: .regular)
        contentPreviewFallbackSumi.textColor = .white
        contentPreviewFallbackSumi.lineBreakMode = .byTruncatingTail
        glassPanelRenderingJari.addSubview(contentPreviewFallbackSumi)

        followButtonStateKuro.tintColor = .white
        followButtonStateKuro.layer.cornerRadius = 7.5
        followButtonStateKuro.layer.borderWidth = 1
        followButtonStateKuro.clipsToBounds = true
        followButtonStateKuro.addTarget(self, action: #selector(hostIdentityExtractionMaro), for: .touchUpInside)
        glassPanelRenderingJari.addSubview(followButtonStateKuro)

        [glassPanelRenderingJari, thumbnailPrefetchQueueDori, liveRibbonGradientTavo, nameLabel, contentPreviewFallbackSumi, followButtonStateKuro].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            glassPanelRenderingJari.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7),
            glassPanelRenderingJari.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -7),
            glassPanelRenderingJari.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            glassPanelRenderingJari.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            thumbnailPrefetchQueueDori.leadingAnchor.constraint(equalTo: glassPanelRenderingJari.leadingAnchor, constant: 29),
            thumbnailPrefetchQueueDori.centerYAnchor.constraint(equalTo: glassPanelRenderingJari.centerYAnchor),
            thumbnailPrefetchQueueDori.widthAnchor.constraint(equalToConstant: 89),
            thumbnailPrefetchQueueDori.heightAnchor.constraint(equalToConstant: 89),

            liveRibbonGradientTavo.leadingAnchor.constraint(equalTo: glassPanelRenderingJari.leadingAnchor),
            liveRibbonGradientTavo.topAnchor.constraint(equalTo: glassPanelRenderingJari.topAnchor),
            liveRibbonGradientTavo.widthAnchor.constraint(equalToConstant: 79),
            liveRibbonGradientTavo.heightAnchor.constraint(equalToConstant: 20),

            nameLabel.leadingAnchor.constraint(equalTo: thumbnailPrefetchQueueDori.trailingAnchor, constant: 26),
            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: followButtonStateKuro.leadingAnchor, constant: -10),
            nameLabel.centerYAnchor.constraint(equalTo: glassPanelRenderingJari.centerYAnchor, constant: -12),

            contentPreviewFallbackSumi.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            contentPreviewFallbackSumi.trailingAnchor.constraint(equalTo: glassPanelRenderingJari.trailingAnchor, constant: -18),
            contentPreviewFallbackSumi.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),

            followButtonStateKuro.leadingAnchor.constraint(greaterThanOrEqualTo: nameLabel.trailingAnchor, constant: 10),
            followButtonStateKuro.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            followButtonStateKuro.trailingAnchor.constraint(lessThanOrEqualTo: glassPanelRenderingJari.trailingAnchor, constant: -28),
            followButtonStateKuro.widthAnchor.constraint(equalToConstant: 24),
            followButtonStateKuro.heightAnchor.constraint(equalToConstant: 15)
        ])
    }

    @objc private func hostIdentityExtractionMaro() {
        hostProfileTapRoutingMiva?()
    }
}

final class LiveRibbonView: UIView {
    private let gradientBadgeDrawingSoli = CAGradientLayer()
    private let glyphLabelSignalNavo = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientBadgeDrawingSoli.frame = bounds
    }

    private func buildLayout() {
        layer.cornerRadius = 9
        layer.maskedCorners = [.layerMinXMinYCorner]
        clipsToBounds = true
        gradientBadgeDrawingSoli.colors = [
            UIColor(red: 175 / 255, green: 123 / 255, blue: 255 / 255, alpha: 1).cgColor,
            UIColor(red: 91 / 255, green: 56 / 255, blue: 255 / 255, alpha: 1).cgColor,
            UIColor(red: 201 / 255, green: 142 / 255, blue: 236 / 255, alpha: 0.01).cgColor
        ]
        gradientBadgeDrawingSoli.startPoint = CGPoint(x: 0, y: 0.5)
        gradientBadgeDrawingSoli.endPoint = CGPoint(x: 1, y: 0.5)
        layer.insertSublayer(gradientBadgeDrawingSoli, at: 0)

        glyphLabelSignalNavo.text = "Live"
        glyphLabelSignalNavo.textColor = .white
        glyphLabelSignalNavo.font = .systemFont(ofSize: 13, weight: .medium)
        addSubview(glyphLabelSignalNavo)
        glyphLabelSignalNavo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            glyphLabelSignalNavo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            glyphLabelSignalNavo.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

// MARK: - TableView DataSource
extension PulseCatruiRhythmFieler: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ messageThreadTableSavi: UITableView, numberOfRowsInSection section: Int) -> Int {
        trendCellSyncingPaxo.count
    }

    func tableView(_ messageThreadTableSavi: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let renderCellNodeKavi = messageThreadTableSavi.dequeueReusableCell(withIdentifier: TrendStreamCell.reuseID, for: indexPath) as! TrendStreamCell
        let liveRoomCapsuleVexa = trendCellSyncingPaxo[indexPath.row]
        renderCellNodeKavi.sync(with: liveRoomCapsuleVexa, isFollowing: indexPath.row % 3 == 1)
        renderCellNodeKavi.hostProfileTapRoutingMiva = { [weak self] in
            self?.profileParamBridgeRafi(liveRoomCapsuleVexa.hostIdentitySignalRivo)
        }
        return renderCellNodeKavi
    }

    func tableView(_ messageThreadTableSavi: UITableView, didSelectRowAt indexPath: IndexPath) {
        liveStatusMappingDeni(trendCellSyncingPaxo[indexPath.row])
    }

    func tableView(_ messageThreadTableSavi: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let container = UIView()
        container.backgroundColor = .clear
        let glyphLabelSignalNavo = UILabel()
        glyphLabelSignalNavo.text = "Trend"
        glyphLabelSignalNavo.textColor = .white
        glyphLabelSignalNavo.font = .italicSystemFont(ofSize: 24)
        container.addSubview(glyphLabelSignalNavo)
        glyphLabelSignalNavo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            glyphLabelSignalNavo.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            glyphLabelSignalNavo.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -11)
        ])
        return container
    }

    func tableView(_ messageThreadTableSavi: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        58
    }

    func tableView(_ messageThreadTableSavi: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        135
    }
}
