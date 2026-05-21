//
//  EchoFusionRise.swift
//  NoWamFlareu
//
//  Created by  on 2026/5/6.
//

import UIKit

// Message
class EchoFusionRise: UIViewController {
    private var threads: [PaulaMessageThread] = []

    private let tableView = UITableView(frame: .zero, style: .plain)
    private let refreshControl = UIRefreshControl()
    private let userHeaderView = UIView()
    private let userStrip = StriderPulsePulseBelt(withpage: 2)
    private let emptyStateView = MessageEmptyStateView()
    private let lemonGlow = UIView()
    private let oceanGlow = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDeepSpaceVisuals()
        setupNavigationElements()
        constructHierarchy()
        layoutArenaElements()
        bindInteractions()
        loadMessagePage()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        refreshHeaderFrame()
    }

    private func setupDeepSpaceVisuals() {
        view.backgroundColor = UIColor(red: 2 / 255, green: 4 / 255, blue: 7 / 255, alpha: 1)
        installBackgroundGlow()
    }

    private func setupNavigationElements() {
        let titleLabel = UIImageView(image: UIImage(named: "MesTiaolersage"))
        titleLabel.contentMode = .scaleAspectFit
        titleLabel.frame = CGRect(x: 0, y: 0, width: 130, height: 26)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)

        let notificationButton = UIButton(type: .custom)
        notificationButton.setImage(UIImage(named: "leadsertio"), for: .normal)
        notificationButton.imageView?.contentMode = .scaleAspectFit
        notificationButton.frame = CGRect(x: 0, y: 0, width: 118, height: 29)
        notificationButton.addTarget(self, action: #selector(openNotification), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: notificationButton)
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

    private func constructHierarchy() {
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MessageThreadCell.self, forCellReuseIdentifier: MessageThreadCell.reuseID)
        tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 18, right: 0)
        tableView.refreshControl = refreshControl
        refreshControl.tintColor = .white
        refreshControl.addTarget(self, action: #selector(loadMessagePage), for: .valueChanged)

        view.addSubview(tableView)
        view.addSubview(emptyStateView)

        userHeaderView.addSubview(userStrip)
        userStrip.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userStrip.topAnchor.constraint(equalTo: userHeaderView.topAnchor),
            userStrip.leadingAnchor.constraint(equalTo: userHeaderView.leadingAnchor),
            userStrip.trailingAnchor.constraint(equalTo: userHeaderView.trailingAnchor),
            userStrip.heightAnchor.constraint(equalToConstant: 116)
        ])
        tableView.tableHeaderView = userHeaderView
    }

    private func layoutArenaElements() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        emptyStateView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            emptyStateView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptyStateView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 270),
            emptyStateView.widthAnchor.constraint(equalToConstant: 150),
            emptyStateView.heightAnchor.constraint(equalToConstant: 130)
        ])
    }

    private func bindInteractions() {
        userStrip.onMemberTap = { [weak self] user in
            self?.openChat(userId: user.userId)
        }
    }

    private func refreshHeaderFrame() {
        let width = tableView.bounds.width
        guard width > 0 else { return }
        let targetFrame = CGRect(x: 0, y: 0, width: width + 30, height: 136)
        if userHeaderView.frame != targetFrame {
            userHeaderView.frame = targetFrame
            tableView.tableHeaderView = userHeaderView
        }
    }

    @objc private func loadMessagePage() {
        let group = DispatchGroup()
        var latestUsers: [PulseRosterUser]?
        var latestThreads: [PaulaMessageThread]?

        group.enter()
        PaulaHomeAPI.loadHomeUsers { users in
            latestUsers = users
            group.leave()
        }

        group.enter()
        PaulaMessageAPI.loadMessageThreads { messages in
            latestThreads = messages
            group.leave()
        }

        group.notify(queue: .main) { [weak self] in
            guard let self else { return }
            self.userStrip.updateMembers(latestUsers ?? PaulaHomeAPI.fallbackUsers())
            self.threads = latestThreads ?? []
            self.emptyStateView.isHidden = !self.threads.isEmpty
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
    
//    @objc private func refreshHomeData() {
//        let group = DispatchGroup()
//        var latestUsers: [PulseRosterUser]?
//        var latestRooms: [SquadChamber]?
//
//        group.enter()
//        PaulaHomeAPI.loadHomeUsers { users in
//            latestUsers = users
//            group.leave()
//        }
//
//        group.enter()
//        PaulaHomeAPI.loadVoiceRooms { rooms in
//            latestRooms = rooms
//            group.leave()
//        }
//
//        group.notify(queue: .main) { [weak self] in
//            guard let self else { return }
//            if let latestUsers {
//                self.striderPulseView.updateMembers(latestUsers)
//            }
//            if let latestRooms, !latestRooms.isEmpty {
//                self.chambers = latestRooms
//                self.chamberHeightConstraint?.constant = self.gridHeight(for: latestRooms.count)
//                self.chamberMatrix.reloadData()
//            }
//            self.refreshControl.endRefreshing()
//        }
//    }

    @objc private func openNotification() {
        pushPaulaH5(.NWEUSignalBloom)
    }

    private func openChat(userId: String) {
        guard !userId.isEmpty else { return }
        pushPaulaH5(.clipRhythmTrail, param: userId)
    }
}

final class MessageThreadCell: UITableViewCell {
    static let reuseID = "MessageThreadCell"

    private let avatarImageView = UIImageView()
    private let avatarRibbon = UILabel()
    private let cardView = UIView()
    private let cardGradientLayer = CAGradientLayer()
    private let nameLabel = UILabel()
    private let contentLabel = UILabel()
    private let vipBadge = UILabel()
    private let unreadDot = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCellLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        cardGradientLayer.frame = cardView.bounds
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        avatarImageView.image = nil
        nameLabel.text = nil
        contentLabel.text = nil
    }

    func sync(with thread: PaulaMessageThread) {
        nameLabel.text = thread.name
        contentLabel.text = thread.content
        avatarImageView.setPaulaImage(
            remoteURL: thread.avatarURL,
            placeholder: PaulaAuthSession.defaultAvatarImage(size: CGSize(width: 96, height: 96))
        )
        vipBadge.isHidden = !thread.showsVIP
        unreadDot.isHidden = !thread.isUnread
    }

    private func setupCellLayout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none

        cardGradientLayer.colors = [
            UIColor(red: 31 / 255, green: 2 / 255, blue: 37 / 255, alpha: 0.72).cgColor,
            UIColor(red: 63 / 255, green: 41 / 255, blue: 69 / 255, alpha: 0.72).cgColor
        ]
        cardGradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        cardGradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        cardView.layer.insertSublayer(cardGradientLayer, at: 0)
        cardView.layer.cornerRadius = 5
        cardView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        cardView.layer.masksToBounds = true
        contentView.addSubview(cardView)

        avatarImageView.backgroundColor = UIColor(red: 187 / 255, green: 91 / 255, blue: 255 / 255, alpha: 1)
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.cornerRadius = 44.5
        avatarImageView.clipsToBounds = true
        contentView.addSubview(avatarImageView)

        avatarRibbon.text = "Live"
        avatarRibbon.textColor = .white
        avatarRibbon.font = .systemFont(ofSize: 13, weight: .medium)
        avatarRibbon.textAlignment = .center
        avatarRibbon.backgroundColor = UIColor(red: 210 / 255, green: 12 / 255, blue: 224 / 255, alpha: 0.82)
        contentView.addSubview(avatarRibbon)

        nameLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        nameLabel.textColor = .white
        nameLabel.lineBreakMode = .byTruncatingTail
        cardView.addSubview(nameLabel)

        contentLabel.font = .systemFont(ofSize: 15, weight: .regular)
        contentLabel.textColor = UIColor.white.withAlphaComponent(0.71)
        contentLabel.lineBreakMode = .byTruncatingTail
        cardView.addSubview(contentLabel)

        vipBadge.text = "VIP"
        vipBadge.textColor = .white
        vipBadge.font = .italicSystemFont(ofSize: 12)
        vipBadge.textAlignment = .center
        vipBadge.backgroundColor = UIColor(red: 250 / 255, green: 99 / 255, blue: 147 / 255, alpha: 1)
        vipBadge.layer.cornerRadius = 7
        vipBadge.clipsToBounds = true
        cardView.addSubview(vipBadge)

        unreadDot.backgroundColor = UIColor(red: 250 / 255, green: 99 / 255, blue: 147 / 255, alpha: 1)
        unreadDot.layer.cornerRadius = 4
        cardView.addSubview(unreadDot)

        [cardView, avatarImageView, avatarRibbon, nameLabel, contentLabel, vipBadge, unreadDot].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            avatarImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 89),
            avatarImageView.heightAnchor.constraint(equalToConstant: 89),

            avatarRibbon.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor, constant: 16),
            avatarRibbon.trailingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: -7),
            avatarRibbon.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
            avatarRibbon.heightAnchor.constraint(equalToConstant: 26),

            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 71),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cardView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            cardView.heightAnchor.constraint(equalToConstant: 70),

            nameLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 35),
            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: vipBadge.leadingAnchor, constant: -10),
            nameLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 13),

            vipBadge.leadingAnchor.constraint(greaterThanOrEqualTo: nameLabel.trailingAnchor, constant: 10),
            vipBadge.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            vipBadge.widthAnchor.constraint(equalToConstant: 38),
            vipBadge.heightAnchor.constraint(equalToConstant: 16),

            contentLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            contentLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            contentLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),

            unreadDot.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -14),
            unreadDot.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 14),
            unreadDot.widthAnchor.constraint(equalToConstant: 8),
            unreadDot.heightAnchor.constraint(equalToConstant: 8)
        ])
    }
}

final class MessageEmptyStateView: UIView {
    private let iconView = UIImageView()
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
        iconView.image = UIImage(systemName: "envelope.fill")
        iconView.tintColor = UIColor(red: 255 / 255, green: 216 / 255, blue: 64 / 255, alpha: 1)
        iconView.contentMode = .scaleAspectFit
        addSubview(iconView)

        titleLabel.text = "No data"
        titleLabel.textColor = UIColor.white.withAlphaComponent(0.5)
        titleLabel.font = .systemFont(ofSize: 13, weight: .medium)
        titleLabel.textAlignment = .center
        addSubview(titleLabel)

        [iconView, titleLabel].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        NSLayoutConstraint.activate([
            iconView.topAnchor.constraint(equalTo: topAnchor),
            iconView.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconView.widthAnchor.constraint(equalToConstant: 85),
            iconView.heightAnchor.constraint(equalToConstant: 85),

            titleLabel.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: 14),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

extension EchoFusionRise: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        threads.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MessageThreadCell.reuseID, for: indexPath) as! MessageThreadCell
        cell.sync(with: threads[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        104
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let thread = threads[indexPath.row]
        PaulaMessageAPI.markRead(messageId: thread.messageId)
        openChat(userId: thread.userId)
    }
}
