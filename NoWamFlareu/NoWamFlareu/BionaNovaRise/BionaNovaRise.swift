//
//  BionaNovaRise.swift
//  NoWamFlareu
//
//  Created by  on 2026/5/6.
//

import UIKit
//首页

class BionaNovaRise: UIViewController {

    private var chambers: [SquadChamber] = PaulaHomeAPI.fallbackRooms()
    private let refreshControl = UIRefreshControl()
    private var chamberHeightConstraint: NSLayoutConstraint?

    private let mainScrollView = UIScrollView()
    private let scrollStackView = UIStackView()
    private let neuralLinkBanner = UIButton()
    private let striderPulseView = StriderPulsePulseBelt.init(withpage: 0)
    private weak var passwordPromptView: RoomPasswordPromptView?
    
    private lazy var chamberMatrix: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.isScrollEnabled = false
        return view
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        neuralLinkBanner.setBackgroundImage(UIImage.init(named: "gamehold"), for: .normal)
        setupDeepSpaceVisuals()
        setupNavigationElements()
        constructHierarchy()
        layoutArenaElements()
        bindDataToMatrix()
        refreshHomeData()
    }

    private func setupDeepSpaceVisuals() {
        view.backgroundColor = UIColor(red: 0.05, green: 0.05, blue: 0.1, alpha: 1.0)
        refreshControl.tintColor = .white
        refreshControl.addTarget(self, action: #selector(refreshHomeData), for: .valueChanged)
        mainScrollView.refreshControl = refreshControl
    }

    private func setupNavigationElements() {
   
        let titleLabel = UIImageView.init(image: UIImage.init(named: "Paulatitle"))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)

        let createBtn = UIButton()
        createBtn.setImage(UIImage.init(named: "createrRooomg"), for: .normal)
        createBtn.addTarget(self, action: #selector(triggerRoomCreation), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: createBtn)
    }

    private func constructHierarchy() {
        view.addSubview(mainScrollView)
        mainScrollView.addSubview(scrollStackView)
       
        scrollStackView.axis = .vertical
        scrollStackView.spacing = 20
        
     
        scrollStackView.addArrangedSubview(neuralLinkBanner)
        scrollStackView.addArrangedSubview(striderPulseView)
        
        let sectionTitle = UIImageView.init(image: UIImage.init(named: "Recommend"))
        sectionTitle.contentMode = .scaleAspectFit
        scrollStackView.addArrangedSubview(sectionTitle)
        
        scrollStackView.addArrangedSubview(chamberMatrix)
    }

    private func layoutArenaElements() {
        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollStackView.translatesAutoresizingMaskIntoConstraints = false
        neuralLinkBanner.translatesAutoresizingMaskIntoConstraints = false
        chamberMatrix.translatesAutoresizingMaskIntoConstraints = false

        
       
        neuralLinkBanner.addTarget(self, action: #selector(navigateToNeuralInterface), for: .touchUpInside)

        NSLayoutConstraint.activate([
            mainScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            scrollStackView.topAnchor.constraint(equalTo: mainScrollView.topAnchor, constant: 10),
            scrollStackView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor, constant: 16),
            scrollStackView.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor, constant: -16),
            scrollStackView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
            scrollStackView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor, constant: -32),

            neuralLinkBanner.heightAnchor.constraint(equalToConstant: 120)
        ])
        chamberHeightConstraint = chamberMatrix.heightAnchor.constraint(equalToConstant: gridHeight(for: chambers.count))
        chamberHeightConstraint?.isActive = true
    }


    @objc private func navigateToNeuralInterface() {
        pushPaulaH5(.echoFusionMist)
    }

    @objc private func triggerRoomCreation() {
        pushPaulaH5(.arenaWaveDrift)
    }

    private func bindDataToMatrix() {
        striderPulseView.onMemberTap = { [weak self] user in
            self?.openUserProfile(user.userId)
        }
        chamberMatrix.dataSource = self
        chamberMatrix.delegate = self
        chamberMatrix.register(SquadChamberCell.self, forCellWithReuseIdentifier: "SquadChamberCell")
    }

    private func openUserProfile(_ userId: String) {
        guard !userId.isEmpty else { return }
        pushPaulaH5(.arenaSignalRise, param: userId)
    }

    private func openVoiceRoom(_ room: SquadChamber) {
        pushPaulaH5(.NWEUCascadeRise, param: room.liveId)
    }

    private func presentRoomPasswordGate(for room: SquadChamber) {
        passwordPromptView?.removeFromSuperview()
        let promptView = RoomPasswordPromptView()
        promptView.onPasswordAccepted = { [weak self] in
            self?.openVoiceRoom(room)
        }
        passwordPromptView = promptView
        promptView.present(in: tabBarController?.view ?? navigationController?.view ?? view)
    }

    @objc private func refreshHomeData() {
        let group = DispatchGroup()
        var latestUsers: [PulseRosterUser]?
        var latestRooms: [SquadChamber]?

        group.enter()
        PaulaHomeAPI.loadHomeUsers { users in
            latestUsers = users
            group.leave()
        }

        group.enter()
        PaulaHomeAPI.loadVoiceRooms { rooms in
            latestRooms = rooms
            group.leave()
        }

        group.notify(queue: .main) { [weak self] in
            guard let self else { return }
            if let latestUsers {
                self.striderPulseView.updateMembers(latestUsers)
            }
            if let latestRooms, !latestRooms.isEmpty {
                self.chambers = latestRooms
                self.chamberHeightConstraint?.constant = self.gridHeight(for: latestRooms.count)
                self.chamberMatrix.reloadData()
            }
            self.refreshControl.endRefreshing()
        }
    }

    private func gridHeight(for count: Int) -> CGFloat {
        let rows = max(1, Int(ceil(Double(count) / 2.0)))
        return CGFloat(rows) * 220 + CGFloat(max(0, rows - 1)) * 18
    }
}

extension BionaNovaRise: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chambers.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SquadChamberCell", for: indexPath) as! SquadChamberCell
        cell.synchronize(with: chambers[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 16) / 2
        return CGSize(width: width, height: 220)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let room = chambers[indexPath.item]
        presentRoomPasswordGate(for: room)
    }
}

private final class RoomPasswordPromptView: UIView, UITextFieldDelegate {
    var onPasswordAccepted: (() -> Void)?

    private let dimmingView = UIView()
    private let panelImageView = UIImageView(image: UIImage(named: "roomPasswordPanel"))
    private let passwordTextField = UITextField()
    private let errorLabel = UILabel()
    private let confirmButton = UIButton(type: .system)
    private let closeButton = UIButton(type: .custom)

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildPrompt()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        dimmingView.frame = bounds

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

        panelImageView.frame = panelFrame

        let horizontalInset = panelWidth * 0.075
        passwordTextField.frame = CGRect(
            x: panelFrame.minX + horizontalInset,
            y: panelFrame.minY + panelHeight * 0.52,
            width: panelWidth - horizontalInset * 2,
            height: 40
        )
        passwordTextField.layer.cornerRadius = passwordTextField.bounds.height * 0.5

        errorLabel.frame = CGRect(
            x: panelFrame.minX + horizontalInset,
            y: passwordTextField.frame.maxY + 12,
            width: panelWidth - horizontalInset * 2,
            height: 22
        )

        confirmButton.frame = CGRect(
            x: panelFrame.minX + horizontalInset,
            y: panelFrame.minY + panelHeight * 0.74,
            width: panelWidth - horizontalInset * 2,
            height: 45
        )
        confirmButton.layer.cornerRadius = confirmButton.bounds.height * 0.5

        closeButton.frame = CGRect(
            x: (bounds.width - 48) * 0.5,
            y: panelFrame.maxY + 20,
            width: 48,
            height: 48
        )
    }

    private func buildPrompt() {
        backgroundColor = .clear

        dimmingView.backgroundColor = UIColor.black.withAlphaComponent(0.48)
        addSubview(dimmingView)

        panelImageView.contentMode = .scaleAspectFit
        panelImageView.isUserInteractionEnabled = false
        addSubview(panelImageView)

        passwordTextField.backgroundColor = UIColor.white.withAlphaComponent(0.28)
        passwordTextField.textColor = .white
        passwordTextField.tintColor = .white
        passwordTextField.font = .systemFont(ofSize: 19, weight: .bold)
        passwordTextField.textAlignment = .center
        passwordTextField.keyboardType = .numberPad
        passwordTextField.delegate = self
        passwordTextField.addTarget(self, action: #selector(passwordEditingChanged), for: .editingChanged)
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Enter room password",
            attributes: [
                .foregroundColor: UIColor.white.withAlphaComponent(0.75),
                .font: UIFont.systemFont(ofSize: 19, weight: .bold)
            ]
        )
        addSubview(passwordTextField)

        errorLabel.text = "Incorrect password. Please enter it again."
        errorLabel.textColor = UIColor(red: 0.93, green: 0.04, blue: 0.52, alpha: 1)
        errorLabel.font = .systemFont(ofSize: 13, weight: .regular)
        errorLabel.textAlignment = .center
        errorLabel.isHidden = true
        addSubview(errorLabel)

        confirmButton.backgroundColor = .black
        confirmButton.setTitle("sure", for: .normal)
        confirmButton.setTitleColor(.white, for: .normal)
        confirmButton.titleLabel?.font = .systemFont(ofSize: 27, weight: .black)
        confirmButton.addTarget(self, action: #selector(confirmPassword), for: .touchUpInside)
        addSubview(confirmButton)

        closeButton.setImage(UIImage(named: "roomPasswordClose"), for: .normal)
        closeButton.addTarget(self, action: #selector(closePrompt), for: .touchUpInside)
        addSubview(closeButton)
    }

    @objc private func confirmPassword() {
        guard passwordTextField.text == "4444" else {
            errorLabel.isHidden = false
            shakePanel()
            return
        }

        dismiss { [onPasswordAccepted] in
            onPasswordAccepted?()
        }
    }

    @objc private func closePrompt() {
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

    private func shakePanel() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.values = [-8, 8, -6, 6, 0]
        animation.duration = 0.24
        panelImageView.layer.add(animation, forKey: "passwordShake")
        passwordTextField.layer.add(animation, forKey: "fieldShake")
        confirmButton.layer.add(animation, forKey: "buttonShake")
    }

    @objc private func passwordEditingChanged() {
        errorLabel.isHidden = true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: string)) else {
            return false
        }
        let currentText = textField.text ?? ""
        guard let textRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: textRange, with: string)
        return updatedText.count <= 4
    }
}
