//
//  StriderPulsePulseBelt.swift
//  NoWamFlareu
//
//  Created by  on 2026/5/7.
//

import UIKit

class StriderPulsePulseBelt: UIView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private let withpage: Int
    private var members: [PulseRosterUser] = PaulaHomeAPI.fallbackUsers()
    var onMemberTap: ((PulseRosterUser) -> Void)?

    init(withpage: Int) {
        self.withpage = withpage
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: withpage == 2 ? 116 : 40))
        setupHierarchy()
    }

    override init(frame: CGRect) {
        self.withpage = 0
        super.init(frame: frame)
        setupHierarchy()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 12
        layout.minimumLineSpacing = 12
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        cv.contentInset = UIEdgeInsets(top: 0, left: withpage == 0 ? 16 : 0, bottom: 0, right: withpage == 0 ? 16 : 0)
        return cv
    }()

    private func setupHierarchy() {
        if withpage == 0 {
            let background = UIImageView(image: UIImage(named: "userlisrtbacgk"))
            background.contentMode = .scaleToFill
            addSubview(background)
            background.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                background.topAnchor.constraint(equalTo: topAnchor),
                background.leadingAnchor.constraint(equalTo: leadingAnchor),
                background.trailingAnchor.constraint(equalTo: trailingAnchor),
                background.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        }

        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PulseMemberNode.self, forCellWithReuseIdentifier: "PulseMemberNode")
    }

    func updateMembers(_ members: [PulseRosterUser]) {
        self.members = members
        collectionView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        members.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PulseMemberNode", for: indexPath) as! PulseMemberNode
        cell.hydrate(with: members[indexPath.item], mode: withpage)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onMemberTap?(members[indexPath.item])
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let name = members[indexPath.item].name
        let width = name.size(withAttributes: [.font: UIFont.systemFont(ofSize: 13, weight: .medium)]).width + 64
        return CGSize(width: withpage == 0 ? max(92, width) : 90, height: withpage == 0 ? 36 : 116)
    }
}

class PulseMemberNode: UICollectionViewCell {
    private let avatarImageView = UIImageView()
    private let nameScrimView = UIView()
    private let nameLabel = UILabel()
    private var compactConstraints: [NSLayoutConstraint] = []
    private var tileConstraints: [NSLayoutConstraint] = []

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupNodeHierarchy()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    override func prepareForReuse() {
        super.prepareForReuse()
        avatarImageView.image = nil
        nameLabel.text = nil
    }

    private func setupNodeHierarchy() {
        avatarImageView.backgroundColor = UIColor.white.withAlphaComponent(0.25)
        avatarImageView.clipsToBounds = true
        avatarImageView.contentMode = .scaleAspectFill
        contentView.addSubview(avatarImageView)

        nameScrimView.backgroundColor = UIColor.black.withAlphaComponent(0.45)
        contentView.addSubview(nameScrimView)

        nameLabel.font = .systemFont(ofSize: 13, weight: .medium)
        nameLabel.textColor = .white
        nameLabel.lineBreakMode = .byTruncatingTail
        contentView.addSubview(nameLabel)

        [avatarImageView, nameScrimView, nameLabel].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        compactConstraints = [
            nameScrimView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameScrimView.topAnchor.constraint(equalTo: contentView.topAnchor),
            nameScrimView.widthAnchor.constraint(equalToConstant: 0),
            nameScrimView.heightAnchor.constraint(equalToConstant: 0),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            avatarImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 28),
            avatarImageView.heightAnchor.constraint(equalToConstant: 28),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]

        tileConstraints = [
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            avatarImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            nameScrimView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameScrimView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nameScrimView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            nameScrimView.heightAnchor.constraint(equalToConstant: 34),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ]
    }

    func hydrate(with user: PulseRosterUser, mode: Int) {
        nameLabel.text = user.name
        let isCompact = mode == 0
        NSLayoutConstraint.deactivate(isCompact ? tileConstraints : compactConstraints)
        NSLayoutConstraint.activate(isCompact ? compactConstraints : tileConstraints)
        contentView.backgroundColor = isCompact ? .clear : UIColor.black.withAlphaComponent(0.25)
        contentView.layer.cornerRadius = isCompact ? 18 : 14
        contentView.layer.masksToBounds = true
        avatarImageView.layer.cornerRadius = isCompact ? 14 : 14
        nameScrimView.isHidden = isCompact
        nameLabel.textAlignment = isCompact ? .left : .center
        avatarImageView.setPaulaImage(remoteURL: user.avatarURL, placeholder: PaulaAuthSession.defaultAvatarImage(size: CGSize(width: 64, height: 64)))
    }
}
