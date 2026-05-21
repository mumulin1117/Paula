//
//  CatruiRhythmFieler.swift
//  NoWamFlareu
//
//  Created by  on 2026/5/6.
//

import UIKit


class PulseCatruiRhythmFieler: UIViewController {

    private var liveRooms: [SquadChamber] = PaulaHomeAPI.fallbackLiveRooms()
    private let discoveryTableView = UITableView(frame: .zero, style: .plain)
    private let headerVessel = ForYouHeaderVessel()
    private let refreshControl = UIRefreshControl()
    private let lemonGlow = UIView()
    private let oceanGlow = UIView()

    private var trendRooms: [SquadChamber] {
        Array(liveRooms.dropFirst())
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAtmosphere()
        setupNaviActions()
        constructDiscoveryLayout()
        refreshLiveRooms()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        refreshHeaderFrame()
    }

    private func setupAtmosphere() {
        view.backgroundColor = UIColor(red: 2 / 255, green: 4 / 255, blue: 7 / 255, alpha: 1)
        installBackgroundGlow()
    }

    private func setupNaviActions() {
        let topTitle = UIImageView(image: UIImage(named: "For You"))
        topTitle.contentMode = .scaleAspectFit
        topTitle.frame = CGRect(x: 0, y: 0, width: 112, height: 24)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: topTitle)

        let createActionBtn = UIButton(type: .custom)
        createActionBtn.setImage(UIImage(named: "createrRooomg"), for: .normal)
        createActionBtn.imageView?.contentMode = .scaleAspectFit
        createActionBtn.frame = CGRect(x: 0, y: 0, width: 118, height: 29)
        createActionBtn.addTarget(self, action: #selector(openCreateRoom), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: createActionBtn)
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

    private func constructDiscoveryLayout() {
        discoveryTableView.backgroundColor = .clear
        discoveryTableView.separatorStyle = .none
        discoveryTableView.dataSource = self
        discoveryTableView.delegate = self
        discoveryTableView.showsVerticalScrollIndicator = false
        discoveryTableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 18, right: 0)
        discoveryTableView.register(TrendStreamCell.self, forCellReuseIdentifier: TrendStreamCell.reuseID)
        discoveryTableView.refreshControl = refreshControl
        refreshControl.tintColor = .white
        refreshControl.addTarget(self, action: #selector(refreshLiveRooms), for: .valueChanged)

        view.addSubview(discoveryTableView)
        discoveryTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            discoveryTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            discoveryTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            discoveryTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            discoveryTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        headerVessel.onFeaturedTap = { [weak self] in
            guard let room = self?.liveRooms.first else { return }
            self?.openLiveRoom(room)
        }
        headerVessel.onTrainingTap = { [weak self] in
            self?.openTrainingRoom()
        }
        headerVessel.onVipTap = { [weak self] in
            self?.openVIP()
        }
        headerVessel.configure(with: liveRooms.first)
        discoveryTableView.tableHeaderView = headerVessel
    }

    private func refreshHeaderFrame() {
        let width = discoveryTableView.bounds.width
        guard width > 0 else { return }
        let targetFrame = CGRect(x: 0, y: 0, width: width, height: ForYouHeaderVessel.preferredHeight)
        if headerVessel.frame != targetFrame {
            headerVessel.frame = targetFrame
            discoveryTableView.tableHeaderView = headerVessel
        }
    }

    @objc private func refreshLiveRooms() {
        PaulaHomeAPI.loadLiveRooms { [weak self] rooms in
            DispatchQueue.main.async {
                guard let self else { return }
                self.liveRooms = rooms.isEmpty ? PaulaHomeAPI.fallbackLiveRooms() : rooms
                self.headerVessel.configure(with: self.liveRooms.first)
                self.discoveryTableView.reloadData()
                self.refreshControl.endRefreshing()
            }
        }
    }

    @objc private func openCreateRoom() {
        pushPaulaH5(.arenaWaveDrift)
    }

    private func openTrainingRoom() {
        let trainingRoomId = trendRooms.first?.liveId ?? liveRooms.first?.liveId ?? ""
        pushPaulaH5(.NWFUMotionBloom, param: trainingRoomId)
    }

    private func openVIP() {
        pushPaulaH5(.echoPulseField)
    }

    private func openLiveRoom(_ room: SquadChamber) {
        pushPaulaH5(.NWFUclipPulseOrbit, param: room.liveId)
    }

    private func openUserProfile(_ userId: String) {
        guard !userId.isEmpty else { return }
        pushPaulaH5(.arenaSignalRise, param: userId)
    }
}

final class ForYouHeaderVessel: UIView {
    static let preferredHeight: CGFloat = 226

    var onFeaturedTap: (() -> Void)?
    var onTrainingTap: (() -> Void)?
    var onVipTap: (() -> Void)?

    private let featuredTile = FeaturedLiveTile()
    private let trainingSmallTile = UIButton(type: .custom)
    private let vipPromoTile = UIButton(type: .custom)

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with room: SquadChamber?) {
        featuredTile.configure(with: room)
    }

    private func buildLayout() {
        backgroundColor = .clear
        featuredTile.addTarget(self, action: #selector(featuredTapped), for: .touchUpInside)

        trainingSmallTile.setBackgroundImage(UIImage(named: "trainingSmallTile"), for: .normal)
        trainingSmallTile.addTarget(self, action: #selector(trainingTapped), for: .touchUpInside)

        vipPromoTile.setBackgroundImage(UIImage(named: "vipPromoTile"), for: .normal)
        vipPromoTile.addTarget(self, action: #selector(vipTapped), for: .touchUpInside)

        [featuredTile, trainingSmallTile, vipPromoTile].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            featuredTile.leadingAnchor.constraint(equalTo: leadingAnchor),
            featuredTile.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            featuredTile.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 185 / 345),
            featuredTile.heightAnchor.constraint(equalToConstant: 207),

            trainingSmallTile.leadingAnchor.constraint(equalTo: featuredTile.trailingAnchor, constant: 15),
            trainingSmallTile.trailingAnchor.constraint(equalTo: trailingAnchor),
            trainingSmallTile.topAnchor.constraint(equalTo: featuredTile.topAnchor),
            trainingSmallTile.heightAnchor.constraint(equalToConstant: 104),

            vipPromoTile.leadingAnchor.constraint(equalTo: trainingSmallTile.leadingAnchor),
            vipPromoTile.trailingAnchor.constraint(equalTo: trailingAnchor),
            vipPromoTile.topAnchor.constraint(equalTo: trainingSmallTile.bottomAnchor, constant: 18),
            vipPromoTile.heightAnchor.constraint(equalToConstant: 95)
        ])
    }

    @objc private func featuredTapped() {
        onFeaturedTap?()
    }

    @objc private func trainingTapped() {
        onTrainingTap?()
    }

    @objc private func vipTapped() {
        onVipTap?()
    }
}

final class FeaturedLiveTile: UIControl {
    private let coverImageView = UIImageView()
    private let bottomPanel = UIView()
    private let liveBadge = UILabel()
    private let titleLabel = UILabel()
    private let avatarViews = [UIImageView(), UIImageView(), UIImageView()]

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with room: SquadChamber?) {
        titleLabel.text = room?.title ?? "Oh? And what do you hear?"
        coverImageView.setPaulaImage(
            remoteURL: room?.coverURL,
            placeholder: UIImage(named: room?.coverAssetName ?? "gamehold")
        )
        avatarViews.enumerated().forEach { index, imageView in
            let participantAvatarURL: String?
            if let participantURLs = room?.participantAvatarURLs, index < participantURLs.count {
                participantAvatarURL = participantURLs[index]
            } else {
                participantAvatarURL = room?.hostAvatarURL
            }

            imageView.setPaulaImage(
                remoteURL: participantAvatarURL,
                placeholder: PaulaAuthSession.defaultAvatarImage(size: CGSize(width: 28, height: 28))
            )
        }
    }

    private func buildLayout() {
        backgroundColor = UIColor(red: 136 / 255, green: 91 / 255, blue: 247 / 255, alpha: 1)
        layer.cornerRadius = 15
        clipsToBounds = true

        coverImageView.contentMode = .scaleAspectFill
        coverImageView.clipsToBounds = true
        addSubview(coverImageView)

        bottomPanel.backgroundColor = UIColor(red: 136 / 255, green: 91 / 255, blue: 247 / 255, alpha: 1)
        addSubview(bottomPanel)
        bottomPanel.isUserInteractionEnabled  = true
        liveBadge.text = "Live"
        liveBadge.font = .systemFont(ofSize: 12, weight: .semibold)
        liveBadge.textColor = .white
        liveBadge.textAlignment = .center
        liveBadge.backgroundColor = UIColor(red: 140 / 255, green: 45 / 255, blue: 226 / 255, alpha: 1)
        liveBadge.layer.cornerRadius = 8
        liveBadge.clipsToBounds = true
        addSubview(liveBadge)

        titleLabel.font = .systemFont(ofSize: 15, weight: .regular)
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 2
        titleLabel.lineBreakMode = .byWordWrapping
        bottomPanel.addSubview(titleLabel)

        avatarViews.enumerated().forEach { index, imageView in
            imageView.layer.cornerRadius = 13
            imageView.layer.borderColor = UIColor.white.cgColor
            imageView.layer.borderWidth = 1
            imageView.clipsToBounds = true
            imageView.contentMode = .scaleAspectFill
            imageView.tag = index
            bottomPanel.addSubview(imageView)
        }

        [coverImageView, bottomPanel, liveBadge, titleLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        avatarViews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        NSLayoutConstraint.activate([
            coverImageView.topAnchor.constraint(equalTo: topAnchor),
            coverImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            coverImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            coverImageView.heightAnchor.constraint(equalToConstant: 104),

            bottomPanel.topAnchor.constraint(equalTo: coverImageView.bottomAnchor),
            bottomPanel.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomPanel.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomPanel.bottomAnchor.constraint(equalTo: bottomAnchor),

            liveBadge.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            liveBadge.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            liveBadge.widthAnchor.constraint(equalToConstant: 46),
            liveBadge.heightAnchor.constraint(equalToConstant: 16),

            titleLabel.leadingAnchor.constraint(equalTo: bottomPanel.leadingAnchor, constant: 19),
            titleLabel.trailingAnchor.constraint(equalTo: bottomPanel.trailingAnchor, constant: -10),
            titleLabel.bottomAnchor.constraint(equalTo: bottomPanel.bottomAnchor, constant: -12)
        ])

        for (index, imageView) in avatarViews.enumerated() {
            NSLayoutConstraint.activate([
                imageView.leadingAnchor.constraint(equalTo: bottomPanel.leadingAnchor, constant: 29 + CGFloat(index * 20)),
                imageView.topAnchor.constraint(equalTo: bottomPanel.topAnchor, constant: 29),
                imageView.widthAnchor.constraint(equalToConstant: 26),
                imageView.heightAnchor.constraint(equalToConstant: 26)
            ])
        }
    }
}

// MARK: - Trend Cell
final class TrendStreamCell: UITableViewCell {
    static let reuseID = "TrendStreamCell"
    var onHostProfileTap: (() -> Void)?

    private let containerPlate = UIView()
    private let thumbnailView = UIImageView()
    private let liveRibbon = LiveRibbonView()
    private let nameLabel = UILabel()
    private let topicLabel = UILabel()
    private let followButton = UIButton(type: .custom)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCellLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        onHostProfileTap = nil
        thumbnailView.image = nil
        nameLabel.text = nil
        topicLabel.text = nil
    }

    func sync(with room: SquadChamber, isFollowing: Bool) {
        nameLabel.text = room.hostName
        topicLabel.text = room.title
        thumbnailView.setPaulaImage(
            remoteURL: room.coverURL,
            placeholder: UIImage(named: room.coverAssetName ?? "allopiehhhh")
        )
        
        liveRibbon.isHidden =   (room.livesataus != -1 )
        
        
        let symbolName = isFollowing ? "checkmark" : "plus"
        let icon = UIImage(systemName: symbolName, withConfiguration: UIImage.SymbolConfiguration(pointSize: 13, weight: .bold))
        followButton.setImage(icon, for: .normal)
        followButton.backgroundColor = isFollowing
            ? UIColor(red: 255 / 255, green: 185 / 255, blue: 100 / 255, alpha: 1)
            : UIColor(red: 166 / 255, green: 130 / 255, blue: 255 / 255, alpha: 1)
        followButton.layer.borderColor = (isFollowing ? UIColor.white : UIColor(red: 124 / 255, green: 101 / 255, blue: 255 / 255, alpha: 1)).cgColor
    }

    private func setupCellLayout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none

        containerPlate.backgroundColor = UIColor(red: 26 / 255, green: 26 / 255, blue: 57 / 255, alpha: 1)
        containerPlate.layer.cornerRadius = 15
        containerPlate.clipsToBounds = true
        contentView.addSubview(containerPlate)

        thumbnailView.backgroundColor = UIColor(red: 187 / 255, green: 91 / 255, blue: 255 / 255, alpha: 1)
        thumbnailView.contentMode = .scaleAspectFill
        thumbnailView.layer.cornerRadius = 10
        thumbnailView.clipsToBounds = true
        containerPlate.addSubview(thumbnailView)
        containerPlate.addSubview(liveRibbon)

        nameLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        nameLabel.textColor = .white
        nameLabel.lineBreakMode = .byTruncatingTail
        containerPlate.addSubview(nameLabel)

        topicLabel.font = .systemFont(ofSize: 15, weight: .regular)
        topicLabel.textColor = .white
        topicLabel.lineBreakMode = .byTruncatingTail
        containerPlate.addSubview(topicLabel)

        followButton.tintColor = .white
        followButton.layer.cornerRadius = 7.5
        followButton.layer.borderWidth = 1
        followButton.clipsToBounds = true
        followButton.addTarget(self, action: #selector(hostProfileTapped), for: .touchUpInside)
        containerPlate.addSubview(followButton)

        [containerPlate, thumbnailView, liveRibbon, nameLabel, topicLabel, followButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            containerPlate.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7),
            containerPlate.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -7),
            containerPlate.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerPlate.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            thumbnailView.leadingAnchor.constraint(equalTo: containerPlate.leadingAnchor, constant: 29),
            thumbnailView.centerYAnchor.constraint(equalTo: containerPlate.centerYAnchor),
            thumbnailView.widthAnchor.constraint(equalToConstant: 89),
            thumbnailView.heightAnchor.constraint(equalToConstant: 89),

            liveRibbon.leadingAnchor.constraint(equalTo: containerPlate.leadingAnchor),
            liveRibbon.topAnchor.constraint(equalTo: containerPlate.topAnchor),
            liveRibbon.widthAnchor.constraint(equalToConstant: 79),
            liveRibbon.heightAnchor.constraint(equalToConstant: 20),

            nameLabel.leadingAnchor.constraint(equalTo: thumbnailView.trailingAnchor, constant: 26),
            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: followButton.leadingAnchor, constant: -10),
            nameLabel.centerYAnchor.constraint(equalTo: containerPlate.centerYAnchor, constant: -12),

            topicLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            topicLabel.trailingAnchor.constraint(equalTo: containerPlate.trailingAnchor, constant: -18),
            topicLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),

            followButton.leadingAnchor.constraint(greaterThanOrEqualTo: nameLabel.trailingAnchor, constant: 10),
            followButton.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            followButton.trailingAnchor.constraint(lessThanOrEqualTo: containerPlate.trailingAnchor, constant: -28),
            followButton.widthAnchor.constraint(equalToConstant: 24),
            followButton.heightAnchor.constraint(equalToConstant: 15)
        ])
    }

    @objc private func hostProfileTapped() {
        onHostProfileTap?()
    }
}

final class LiveRibbonView: UIView {
    private let gradientLayer = CAGradientLayer()
    private let label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }

    private func buildLayout() {
        layer.cornerRadius = 9
        layer.maskedCorners = [.layerMinXMinYCorner]
        clipsToBounds = true
        gradientLayer.colors = [
            UIColor(red: 175 / 255, green: 123 / 255, blue: 255 / 255, alpha: 1).cgColor,
            UIColor(red: 91 / 255, green: 56 / 255, blue: 255 / 255, alpha: 1).cgColor,
            UIColor(red: 201 / 255, green: 142 / 255, blue: 236 / 255, alpha: 0.01).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        layer.insertSublayer(gradientLayer, at: 0)

        label.text = "Live"
        label.textColor = .white
        label.font = .systemFont(ofSize: 13, weight: .medium)
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

// MARK: - TableView DataSource
extension PulseCatruiRhythmFieler: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        trendRooms.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TrendStreamCell.reuseID, for: indexPath) as! TrendStreamCell
        let room = trendRooms[indexPath.row]
        cell.sync(with: room, isFollowing: indexPath.row % 3 == 1)
        cell.onHostProfileTap = { [weak self] in
            self?.openUserProfile(room.hostUserId)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openLiveRoom(trendRooms[indexPath.row])
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let container = UIView()
        container.backgroundColor = .clear
        let label = UILabel()
        label.text = "Trend"
        label.textColor = .white
        label.font = .italicSystemFont(ofSize: 24)
        container.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            label.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -11)
        ])
        return container
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        58
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        135
    }
}
