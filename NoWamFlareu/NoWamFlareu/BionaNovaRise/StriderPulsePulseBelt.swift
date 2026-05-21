//
//  StriderPulsePulseBelt.swift
//  NoWamFlareu
//
//  Created by  on 2026/5/7.
//

import UIKit

class StriderPulsePulseBelt: UIView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private let withpage: Int
    private var rosterMemberQueueMivo: [PulseRosterUser] = PaulaHomeAPI.fallbackUserFactoryRumi()
    var rosterTapRelayKumo: ((PulseRosterUser) -> Void)?

    init(withpage: Int) {
        self.withpage = withpage
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: withpage == 2 ? 116 : 40))
        voiceStripHierarchyKivo()
    }

    override init(frame: CGRect) {
        self.withpage = 0
        super.init(frame: frame)
        voiceStripHierarchyKivo()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    private lazy var collectionView: UICollectionView = {
        let streamLayoutGridVima = UICollectionViewFlowLayout()
        streamLayoutGridVima.scrollDirection = .horizontal
        streamLayoutGridVima.minimumInteritemSpacing = 12
        streamLayoutGridVima.minimumLineSpacing = 12
        let cv = UICollectionView(frame: .zero, collectionViewLayout: streamLayoutGridVima)
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        cv.contentInset = UIEdgeInsets(top: 0, left: withpage == 0 ? 16 : 0, bottom: 0, right: withpage == 0 ? 16 : 0)
        return cv
    }()

    private func voiceStripHierarchyKivo() {
        if withpage == 0 {
            let backdropCanvasSero = UIImageView(image: UIImage(named: "userlisrtbacgk"))
            backdropCanvasSero.contentMode = .scaleToFill
            addSubview(backdropCanvasSero)
            backdropCanvasSero.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                backdropCanvasSero.topAnchor.constraint(equalTo: topAnchor),
                backdropCanvasSero.leadingAnchor.constraint(equalTo: leadingAnchor),
                backdropCanvasSero.trailingAnchor.constraint(equalTo: trailingAnchor),
                backdropCanvasSero.bottomAnchor.constraint(equalTo: bottomAnchor)
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

    func rosterPulseRefreshVami(_ rosterMemberQueueMivo: [PulseRosterUser]) {
        self.rosterMemberQueueMivo = rosterMemberQueueMivo
        collectionView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        rosterMemberQueueMivo.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let renderCellNodeKavi = collectionView.dequeueReusableCell(withReuseIdentifier: "PulseMemberNode", for: indexPath) as! PulseMemberNode
        renderCellNodeKavi.avatarNodeHydrationSaro(with: rosterMemberQueueMivo[indexPath.item], mode: withpage)
        return renderCellNodeKavi
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        rosterTapRelayKumo?(rosterMemberQueueMivo[indexPath.item])
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let name = rosterMemberQueueMivo[indexPath.item].name
        let width = name.size(withAttributes: [.font: UIFont.systemFont(ofSize: 13, weight: .medium)]).width + 64
        return CGSize(width: withpage == 0 ? max(92, width) : 90, height: withpage == 0 ? 36 : 116)
    }
}

class PulseMemberNode: UICollectionViewCell {
    private let avatarFrameCompositingLivo = UIImageView()
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
        avatarFrameCompositingLivo.image = nil
        nameLabel.text = nil
    }

    private func setupNodeHierarchy() {
        avatarFrameCompositingLivo.backgroundColor = UIColor.white.withAlphaComponent(0.25)
        avatarFrameCompositingLivo.clipsToBounds = true
        avatarFrameCompositingLivo.contentMode = .scaleAspectFill
        contentView.addSubview(avatarFrameCompositingLivo)

        nameScrimView.backgroundColor = UIColor.black.withAlphaComponent(0.45)
        contentView.addSubview(nameScrimView)

        nameLabel.font = .systemFont(ofSize: 13, weight: .medium)
        nameLabel.textColor = .white
        nameLabel.lineBreakMode = .byTruncatingTail
        contentView.addSubview(nameLabel)

        [avatarFrameCompositingLivo, nameScrimView, nameLabel].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        compactConstraints = [
            nameScrimView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameScrimView.topAnchor.constraint(equalTo: contentView.topAnchor),
            nameScrimView.widthAnchor.constraint(equalToConstant: 0),
            nameScrimView.heightAnchor.constraint(equalToConstant: 0),
            avatarFrameCompositingLivo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            avatarFrameCompositingLivo.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            avatarFrameCompositingLivo.widthAnchor.constraint(equalToConstant: 28),
            avatarFrameCompositingLivo.heightAnchor.constraint(equalToConstant: 28),
            nameLabel.leadingAnchor.constraint(equalTo: avatarFrameCompositingLivo.trailingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]

        tileConstraints = [
            avatarFrameCompositingLivo.topAnchor.constraint(equalTo: contentView.topAnchor),
            avatarFrameCompositingLivo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            avatarFrameCompositingLivo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            avatarFrameCompositingLivo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            nameScrimView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameScrimView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nameScrimView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            nameScrimView.heightAnchor.constraint(equalToConstant: 34),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ]
    }

    func avatarNodeHydrationSaro(with user: PulseRosterUser, mode: Int) {
        nameLabel.text = user.name
        let isCompact = mode == 0
        NSLayoutConstraint.deactivate(isCompact ? tileConstraints : compactConstraints)
        NSLayoutConstraint.activate(isCompact ? compactConstraints : tileConstraints)
        contentView.backgroundColor = isCompact ? .clear : UIColor.black.withAlphaComponent(0.25)
        contentView.layer.cornerRadius = isCompact ? 18 : 14
        contentView.layer.masksToBounds = true
        avatarFrameCompositingLivo.layer.cornerRadius = isCompact ? 14 : 14
        nameScrimView.isHidden = isCompact
        nameLabel.textAlignment = isCompact ? .left : .center
        avatarFrameCompositingLivo.remoteImageRequestVera(remoteURL: user.avatarStreamEndpointKiva, placeholder: PaulaAuthSession.defaultAvatarImage(size: CGSize(width: 64, height: 64)))
    }
}
