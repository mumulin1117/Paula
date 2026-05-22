//
//  BionaNovaRise.swift
//  NoWamFlareu
//
//  Created by  on 2026/5/6.
//

import UIKit

class BionaNovaRise: UIViewController {

    private var voiceRoomCompositionNori: [SquadChamber] = PaulaHomeAPI.fallbackRoomFactoryDeni()
    private let pullRefreshCompletionMavoControl = UIRefreshControl()
    private var roomHeightConstraintTavi: NSLayoutConstraint?

    private let scrollFrameBudgetingLiro = UIScrollView()
    private let verticalStackSpacingDina = UIStackView()
    private let gameMindBannerBindingKeni = UIButton()
    private let memberStripHydrationQaro = StriderPulsePulseBelt.init(withpage: 0)
    private weak var passwordPromptPanelTuni: RoomPasswordPromptView?
    
    private lazy var recommendGridReloadingVoni: UICollectionView = {
        let streamLayoutGridVima = UICollectionViewFlowLayout()
        streamLayoutGridVima.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: streamLayoutGridVima)
        view.backgroundColor = .clear
        view.isScrollEnabled = false
        return view
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameMindBannerBindingKeni.setBackgroundImage(UIImage.init(named: PaulaVocalCipherRune.echo("ySYuD1IogbDHG8N6eA7TxVkBho5rpN5R08APF0kpiMgHPPYk")), for: .normal)
        darkModeContrastLuma()
        navigationBarRecoverySilo()
        viewHierarchyInsertionMilo()
        arenaTileCompositionSavo()
        uiRefreshCoordinationKano()
        pullRefreshCompletionMavo()
    }

    private func darkModeContrastLuma() {
        view.backgroundColor = UIColor(red: 0.05, green: 0.05, blue: 0.1, alpha: 1.0)
        pullRefreshCompletionMavoControl.tintColor = .white
        pullRefreshCompletionMavoControl.addTarget(self, action: #selector(pullRefreshCompletionMavo), for: .valueChanged)
        scrollFrameBudgetingLiro.refreshControl = pullRefreshCompletionMavoControl
    }

    private func navigationBarRecoverySilo() {
   
        let titleLabel = UIImageView.init(image: UIImage.init(named: PaulaVocalCipherRune.echo("iKHuzpYbtdpP58i8kA0FcZiiWrABK5D2KCOKisHE5cFsAFzg0II=")))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)

        let createBtn = UIButton()
        createBtn.setImage(UIImage.init(named: PaulaVocalCipherRune.echo("PN3BJIuD8OlF8wFXNnk4/0R/TodhdHcrjAzGCMPdoBBdOZcG9EQfnIo=")), for: .normal)
        createBtn.addTarget(self, action: #selector(createRoomEntryZavi), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: createBtn)
    }

    private func viewHierarchyInsertionMilo() {
        view.addSubview(scrollFrameBudgetingLiro)
        scrollFrameBudgetingLiro.addSubview(verticalStackSpacingDina)
       
        verticalStackSpacingDina.axis = .vertical
        verticalStackSpacingDina.spacing = 20
        
     
        verticalStackSpacingDina.addArrangedSubview(gameMindBannerBindingKeni)
        verticalStackSpacingDina.addArrangedSubview(memberStripHydrationQaro)
        
        let sectionTitle = UIImageView.init(image: UIImage.init(named: PaulaVocalCipherRune.echo("UfwY4fq6eSz+JjTU7HvXCHD77/QDRXGf3rILmItfSl6vhBeNZg==")))
        sectionTitle.contentMode = .scaleAspectFit
        verticalStackSpacingDina.addArrangedSubview(sectionTitle)
        
        verticalStackSpacingDina.addArrangedSubview(recommendGridReloadingVoni)
    }

    private func arenaTileCompositionSavo() {
        scrollFrameBudgetingLiro.translatesAutoresizingMaskIntoConstraints = false
        verticalStackSpacingDina.translatesAutoresizingMaskIntoConstraints = false
        gameMindBannerBindingKeni.translatesAutoresizingMaskIntoConstraints = false
        recommendGridReloadingVoni.translatesAutoresizingMaskIntoConstraints = false

        
       
        gameMindBannerBindingKeni.addTarget(self, action: #selector(neuralPromptEntryFalo), for: .touchUpInside)

        NSLayoutConstraint.activate([
            scrollFrameBudgetingLiro.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollFrameBudgetingLiro.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollFrameBudgetingLiro.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollFrameBudgetingLiro.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            verticalStackSpacingDina.topAnchor.constraint(equalTo: scrollFrameBudgetingLiro.topAnchor, constant: 10),
            verticalStackSpacingDina.leadingAnchor.constraint(equalTo: scrollFrameBudgetingLiro.leadingAnchor, constant: 16),
            verticalStackSpacingDina.trailingAnchor.constraint(equalTo: scrollFrameBudgetingLiro.trailingAnchor, constant: -16),
            verticalStackSpacingDina.bottomAnchor.constraint(equalTo: scrollFrameBudgetingLiro.bottomAnchor),
            verticalStackSpacingDina.widthAnchor.constraint(equalTo: scrollFrameBudgetingLiro.widthAnchor, constant: -32),

            gameMindBannerBindingKeni.heightAnchor.constraint(equalToConstant: 120)
        ])
        roomHeightConstraintTavi = recommendGridReloadingVoni.heightAnchor.constraint(equalToConstant: twoColumnRoomLayoutVilo(for: voiceRoomCompositionNori.count))
        roomHeightConstraintTavi?.isActive = true
    }


    @objc private func neuralPromptEntryFalo() {
        pushPaulaFashion(.echoFusionMist)
    }

    @objc private func createRoomEntryZavi() {
        pushPaulaFashion(.arenaWaveDrift)
    }

    private func uiRefreshCoordinationKano() {
        memberStripHydrationQaro.rosterTapRelayKumo = { [weak self] user in
            self?.profileParamBridgeRafi(user.playerIdentitySignalMoro)
        }
        recommendGridReloadingVoni.dataSource = self
        recommendGridReloadingVoni.delegate = self
        recommendGridReloadingVoni.register(SquadChamberCell.self, forCellWithReuseIdentifier: PaulaVocalCipherRune.echo("LwSCTW3SCY9bZP6ub5z10FMLgkbs4eIHSEPmkmlTFlFrWlOXKIPSTNM7wK8="))
    }

    private func profileParamBridgeRafi(_ playerIdentitySignalMoro: String) {
        guard !playerIdentitySignalMoro.isEmpty else { return }
        pushPaulaFashion(.arenaSignalRise, param: playerIdentitySignalMoro)
    }

    private func voiceRoomParamBridgeTeno(_ watchTogetherCueLiva: SquadChamber) {
        pushPaulaFashion(.NWEUCascadeRise, param: watchTogetherCueLiva.roomStreamIdentityPavo)
    }

    private func voiceRoomPasswordGatePeli(for watchTogetherCueLiva: SquadChamber) {
        passwordPromptPanelTuni?.removeFromSuperview()
        let promptView = RoomPasswordPromptView()
        promptView.entryFlowContinuationKuno = { [weak self] in
            self?.voiceRoomParamBridgeTeno(watchTogetherCueLiva)
        }
        passwordPromptPanelTuni = promptView
        promptView.present(in: tabBarController?.view ?? navigationController?.view ?? view)
    }

    @objc private func pullRefreshCompletionMavo() {
        let group = DispatchGroup()
        var latestUsers: [PulseRosterUser]?
        var latestRooms: [SquadChamber]?

        group.enter()
        PaulaHomeAPI.userRosterHydrationMavo { playerRosterDeckVani in
            latestUsers = playerRosterDeckVani
            group.leave()
        }

        group.enter()
        PaulaHomeAPI.voiceRoomRoutingNima { roomDeckVectorQemi in
            latestRooms = roomDeckVectorQemi
            group.leave()
        }

        group.notify(queue: .main) { [weak self] in
            guard let self else { return }
            if let latestUsers {
                self.memberStripHydrationQaro.rosterPulseRefreshVami(latestUsers)
            }
            if let latestRooms, !latestRooms.isEmpty {
                self.voiceRoomCompositionNori = latestRooms
                self.roomHeightConstraintTavi?.constant = self.twoColumnRoomLayoutVilo(for: latestRooms.count)
                self.recommendGridReloadingVoni.reloadData()
            }
            self.pullRefreshCompletionMavoControl.endRefreshing()
        }
    }

    private func twoColumnRoomLayoutVilo(for count: Int) -> CGFloat {
        let rows = max(1, Int(ceil(Double(count) / 2.0)))
        return CGFloat(rows) * 220 + CGFloat(max(0, rows - 1)) * 18
    }
}

extension BionaNovaRise: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return voiceRoomCompositionNori.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let renderCellNodeKavi = collectionView.dequeueReusableCell(withReuseIdentifier: PaulaVocalCipherRune.echo("fTq2tcJCK5e/m+jtLv6aqUUmIFqaQzDt8JYjVm1E9hI+aAUdD+VR0E13b7Q="), for: indexPath) as! SquadChamberCell
        renderCellNodeKavi.synchronize(with: voiceRoomCompositionNori[indexPath.item])
        return renderCellNodeKavi
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 16) / 2
        return CGSize(width: width, height: 220)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let CapsuleVexa = voiceRoomCompositionNori[indexPath.item]
        voiceRoomPasswordGatePeli(for: CapsuleVexa)
    }
}

private final class RoomPasswordPromptView: UIView, UITextFieldDelegate {
    var entryFlowContinuationKuno: (() -> Void)?

    private let dimmedBackdropLayeringViro = UIView()
    private let assetBackedPanelMena = UIImageView(image: UIImage(named: PaulaVocalCipherRune.echo("E7S1jgdvN8DZByhweqqEDyrra3Qfhq6Kpx/G3d2qQsJz20kao5uSSPEaiMkH")))
    private let numericInputFilteringJora = UITextField()
    private let incorrectPromptCopyMavi = UILabel()
    private let confirmButtonStylingKori = UIButton(type: .system)
    private let closeButtonOverlayMavi = UIButton(type: .custom)

    override init(frame: CGRect) {
        super.init(frame: frame)
        passwordGatePromptingZali()
    }

    required init?(coder: NSCoder) {
        fatalError(PaulaVocalCipherRune.echo("1350VdqWpVSCdBUapGKFc8W1A7EtEHHOfHF5KYxDm+GBjYfEtr6J6jXkqsuLdZYlmmaMmAkvTDYhdTqIVaGXTJo="))
    }

    func present(in parentView: UIView) {
        frame = parentView.bounds
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
        alpha = 0
        parentView.addSubview(self)
        setNeedsLayout()
        layoutIfNeeded()

        UIView.animate(withDuration: 0.2) {
            self.alpha = 1
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        dimmedBackdropLayeringViro.frame = bounds

        let panelWidth = min(bounds.width - 64, 320)
        let panelHeight = panelWidth * (1233.0 / 1137.0)
        let safeTop = safeAreaInsets.top
        let panelY = max(safeTop + 120, (bounds.height - panelHeight) * 0.5 - 44)
        let panelFrame = CGRect(
            x: (bounds.width - panelWidth) * 0.5,
            y: panelY,
            width: panelWidth,
            height: panelHeight
        )

        assetBackedPanelMena.frame = panelFrame

        let horizontalInset = panelWidth * 0.075
        numericInputFilteringJora.frame = CGRect(
            x: panelFrame.minX + horizontalInset,
            y: panelFrame.minY + panelHeight * 0.52,
            width: panelWidth - horizontalInset * 2,
            height: 40
        )
        numericInputFilteringJora.layer.cornerRadius = numericInputFilteringJora.bounds.height * 0.5

        incorrectPromptCopyMavi.frame = CGRect(
            x: panelFrame.minX + horizontalInset,
            y: numericInputFilteringJora.frame.maxY + 12,
            width: panelWidth - horizontalInset * 2,
            height: 22
        )

        confirmButtonStylingKori.frame = CGRect(
            x: panelFrame.minX + horizontalInset,
            y: panelFrame.minY + panelHeight * 0.74,
            width: panelWidth - horizontalInset * 2,
            height: 45
        )
        confirmButtonStylingKori.layer.cornerRadius = confirmButtonStylingKori.bounds.height * 0.5

        closeButtonOverlayMavi.frame = CGRect(
            x: (bounds.width - 48) * 0.5,
            y: panelFrame.maxY + 20,
            width: 48,
            height: 48
        )
    }

    private func passwordGatePromptingZali() {
        backgroundColor = .clear

        dimmedBackdropLayeringViro.backgroundColor = UIColor.black.withAlphaComponent(0.48)
        addSubview(dimmedBackdropLayeringViro)

        assetBackedPanelMena.contentMode = .scaleAspectFit
        assetBackedPanelMena.isUserInteractionEnabled = false
        addSubview(assetBackedPanelMena)

        numericInputFilteringJora.backgroundColor = UIColor.white.withAlphaComponent(0.28)
        numericInputFilteringJora.textColor = .white
        numericInputFilteringJora.tintColor = .white
        numericInputFilteringJora.font = .systemFont(ofSize: 19, weight: .bold)
        numericInputFilteringJora.textAlignment = .center
        numericInputFilteringJora.keyboardType = .numberPad
        numericInputFilteringJora.delegate = self
        numericInputFilteringJora.addTarget(self, action: #selector(inputFieldGuardingReni), for: .editingChanged)
        numericInputFilteringJora.attributedPlaceholder = NSAttributedString(
            string: PaulaVocalCipherRune.echo("ZZvyjciCi3c8f2BhL4+fhv4iDEpu4043MNsJuyAP+Lml3aQtK4Xq8mzfQ0mPGq0="),
            attributes: [
                .foregroundColor: UIColor.white.withAlphaComponent(0.75),
                .font: UIFont.systemFont(ofSize: 19, weight: .bold)
            ]
        )
        addSubview(numericInputFilteringJora)

        incorrectPromptCopyMavi.text = PaulaVocalCipherRune.echo("m0qIpvKQQnz16UT37Gr0JZFwwPUr2/KQzOy3naQsXkonkYoqlCw/Y8nVz9FSyUdAyIisLjld9/4Gu5DwMyzls5Lii/sbvw==")
        incorrectPromptCopyMavi.textColor = UIColor(red: 0.93, green: 0.04, blue: 0.52, alpha: 1)
        incorrectPromptCopyMavi.font = .systemFont(ofSize: 13, weight: .regular)
        incorrectPromptCopyMavi.textAlignment = .center
        incorrectPromptCopyMavi.isHidden = true
        addSubview(incorrectPromptCopyMavi)

        confirmButtonStylingKori.backgroundColor = .black
        confirmButtonStylingKori.setTitle(PaulaVocalCipherRune.echo("nj1IEP74nvD/e5+jGQSf2gJ4egULG9T/HWY3raj4bC0="), for: .normal)
        confirmButtonStylingKori.setTitleColor(.white, for: .normal)
        confirmButtonStylingKori.titleLabel?.font = .systemFont(ofSize: 27, weight: .black)
        confirmButtonStylingKori.addTarget(self, action: #selector(roomPasswordValidationZaro), for: .touchUpInside)
        addSubview(confirmButtonStylingKori)

        closeButtonOverlayMavi.setImage(UIImage(named: PaulaVocalCipherRune.echo("e4+Z2QohPrx3d3PhARvgprKD2l4Rrr6hRwoB5DedwI03tPFeRjusTCSML7hb")), for: .normal)
        closeButtonOverlayMavi.addTarget(self, action: #selector(promptCloseInteractionSilo), for: .touchUpInside)
        addSubview(closeButtonOverlayMavi)
    }

    @objc private func roomPasswordValidationZaro() {
        guard numericInputFilteringJora.text == PaulaVocalCipherRune.echo("/LPnMHMiBjWzXe5Kunl6z1hY8SkyB/l+LzZbyzaq3Ho=") else {
            incorrectPromptCopyMavi.isHidden = false
            promptShakeAnimationZori()
            return
        }

        dismiss { [entryFlowContinuationKuno] in
            entryFlowContinuationKuno?()
        }
    }

    @objc private func promptCloseInteractionSilo() {
        dismiss(completion: nil)
    }

    private func dismiss(completion: (() -> Void)?) {
        endEditing(true)
        UIView.animate(withDuration: 0.18, animations: {
            self.alpha = 0
        }, completion: { _ in
            self.removeFromSuperview()
            completion?()
        })
    }

    private func promptShakeAnimationZori() {
        let animation = CAKeyframeAnimation(keyPath: PaulaVocalCipherRune.echo("BbD+HckUGUxTWW1qzhtjDtPfXWvx4y6KpKawIqek8ZwxzLTsxPp+RvooUwQcTJmMEJSG"))
        animation.values = [-8, 8, -6, 6, 0]
        animation.duration = 0.24
        assetBackedPanelMena.layer.add(animation, forKey: PaulaVocalCipherRune.echo("7+f8sR8QqJ5xlWS2th9rgREDfeGBBMiHSlVrohxREjllrhMEsgxxYBM="))
        numericInputFilteringJora.layer.add(animation, forKey: PaulaVocalCipherRune.echo("KsuwMAG47S6XEIjA/bIshCPGeyDoE/FaTD3VHdY935hIWnJgIB4="))
        confirmButtonStylingKori.layer.add(animation, forKey: PaulaVocalCipherRune.echo("gOYapBnqKxob9ktN5sIKDPKFqFvmawnnNbMp18It4KcDbCRRKcf+"))
    }

    @objc private func inputFieldGuardingReni() {
        incorrectPromptCopyMavi.isHidden = true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: string)) else {
            return false
        }
        let currentText = textField.text ?? PaulaVocalCipherRune.echo("UODH0oC/LxgOQw6+XTvInln7i7fQ/ow9rj+QQg==")
        guard let textRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: textRange, with: string)
        return updatedText.count <= 4
    }
}
