//
//  SquadChamberCell.swift
//  NoWamFlareu
//
//  Created by  on 2026/5/7.
//

import UIKit


class SquadChamberCell: UICollectionViewCell {
    
    private let portalMasterImageView = UIImageView()
   
    private let infoVesselBlur = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterialDark))
    private let titleVessel = UIView()
    
    
    private let hostAvatarVessel = UIImageView()
    private let hostIndicatorLabel = UILabel()
  
    private let statusTagVessel = UIView()
    private let statusTagLabel = UILabel()
    private let chamberTitleLabel = UILabel()
    private let spectatorsVessel = UILabel()
    private let spectatorsVisualMeter = UIImageView()
    private let passwordBadge = UIView()
    private let passwordIconView = UIImageView()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        constructArenaHierarchy()
        layoutVesselElements()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

   
    private func constructArenaHierarchy() {
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 20
        
        
        portalMasterImageView.backgroundColor = UIColor.darkGray
        portalMasterImageView.contentMode = .scaleAspectFill
        portalMasterImageView.clipsToBounds = true
        contentView.addSubview(portalMasterImageView)
        
        
        statusTagVessel.layer.cornerRadius = 8
        statusTagVessel.clipsToBounds = true
        contentView.addSubview(statusTagVessel)
        
        statusTagLabel.font = .systemFont(ofSize: 11, weight: .black)
        statusTagLabel.textColor = .white
        statusTagVessel.addSubview(statusTagLabel)

        passwordBadge.backgroundColor = UIColor(red: 0.57, green: 0.24, blue: 0.95, alpha: 0.96)
        passwordBadge.layer.cornerRadius = 15
        passwordBadge.layer.borderWidth = 1
        passwordBadge.layer.borderColor = UIColor.white.withAlphaComponent(0.22).cgColor
        passwordBadge.layer.shadowColor = UIColor(red: 0.74, green: 0.39, blue: 1, alpha: 1).cgColor
        passwordBadge.layer.shadowOpacity = 0.45
        passwordBadge.layer.shadowRadius = 8
        passwordBadge.layer.shadowOffset = CGSize(width: 0, height: 3)
        passwordBadge.isUserInteractionEnabled = false
        contentView.addSubview(passwordBadge)

        passwordIconView.image = UIImage(systemName: "lock.fill")
        passwordIconView.tintColor = .white
        passwordIconView.contentMode = .scaleAspectFit
        passwordIconView.isUserInteractionEnabled = false
        passwordBadge.addSubview(passwordIconView)
        
       
        infoVesselBlur.layer.cornerRadius = 16
        infoVesselBlur.layer.masksToBounds = true
        contentView.addSubview(infoVesselBlur)
        
       
        titleVessel.backgroundColor = .clear
        infoVesselBlur.contentView.addSubview(titleVessel)
        
       
        titleVessel.addSubview(spectatorsVisualMeter)
        titleVessel.addSubview(spectatorsVessel)
        titleVessel.addSubview(chamberTitleLabel)
        
        chamberTitleLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        chamberTitleLabel.textColor = .white
        
        spectatorsVessel.font = .systemFont(ofSize: 11, weight: .bold)
        spectatorsVessel.textColor = .white
        
        spectatorsVisualMeter.image = UIImage(systemName: "chart.bar.fill")
        spectatorsVisualMeter.tintColor = .systemYellow
        spectatorsVisualMeter.contentMode = .scaleAspectFit
        
    
        hostAvatarVessel.layer.cornerRadius = 24
        hostAvatarVessel.clipsToBounds = true
        hostAvatarVessel.layer.borderWidth = 1.5
        hostAvatarVessel.layer.borderColor = UIColor.white.withAlphaComponent(0.8).cgColor
        hostAvatarVessel.backgroundColor = .orange
        contentView.addSubview(hostAvatarVessel)
        
        hostIndicatorLabel.font = .systemFont(ofSize: 10, weight: .bold)
        hostIndicatorLabel.textColor = .white
        hostIndicatorLabel.textAlignment = .center
        hostIndicatorLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        hostIndicatorLabel.layer.cornerRadius = 8
        hostIndicatorLabel.layer.masksToBounds = true
        contentView.addSubview(hostIndicatorLabel)
    }

    private func layoutVesselElements() {
        [portalMasterImageView, statusTagVessel, statusTagLabel, passwordBadge, passwordIconView, infoVesselBlur, titleVessel, chamberTitleLabel,
         spectatorsVessel, spectatorsVisualMeter, hostAvatarVessel, hostIndicatorLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            
            portalMasterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            portalMasterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            portalMasterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            portalMasterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

          
            statusTagVessel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            statusTagVessel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            statusTagLabel.topAnchor.constraint(equalTo: statusTagVessel.topAnchor, constant: 4),
            statusTagLabel.bottomAnchor.constraint(equalTo: statusTagVessel.bottomAnchor, constant: -4),
            statusTagLabel.leadingAnchor.constraint(equalTo: statusTagVessel.leadingAnchor, constant: 10),
            statusTagLabel.trailingAnchor.constraint(equalTo: statusTagVessel.trailingAnchor, constant: -10),

            passwordBadge.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            passwordBadge.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            passwordBadge.widthAnchor.constraint(equalToConstant: 30),
            passwordBadge.heightAnchor.constraint(equalToConstant: 30),
            passwordIconView.centerXAnchor.constraint(equalTo: passwordBadge.centerXAnchor),
            passwordIconView.centerYAnchor.constraint(equalTo: passwordBadge.centerYAnchor),
            passwordIconView.widthAnchor.constraint(equalToConstant: 15),
            passwordIconView.heightAnchor.constraint(equalToConstant: 15),

         
            infoVesselBlur.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            infoVesselBlur.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            infoVesselBlur.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            infoVesselBlur.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.35),

           
            titleVessel.topAnchor.constraint(equalTo: infoVesselBlur.topAnchor),
            titleVessel.leadingAnchor.constraint(equalTo: infoVesselBlur.leadingAnchor),
            titleVessel.trailingAnchor.constraint(equalTo: infoVesselBlur.trailingAnchor),
            titleVessel.bottomAnchor.constraint(equalTo: infoVesselBlur.bottomAnchor),

            hostAvatarVessel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            hostAvatarVessel.centerYAnchor.constraint(equalTo: infoVesselBlur.topAnchor),
            hostAvatarVessel.widthAnchor.constraint(equalToConstant: 48),
            hostAvatarVessel.heightAnchor.constraint(equalToConstant: 48),
            
           
            hostIndicatorLabel.bottomAnchor.constraint(equalTo: hostAvatarVessel.bottomAnchor, constant: 4),
            hostIndicatorLabel.centerXAnchor.constraint(equalTo: hostAvatarVessel.centerXAnchor),
            hostIndicatorLabel.widthAnchor.constraint(equalToConstant: 34),
            hostIndicatorLabel.heightAnchor.constraint(equalToConstant: 16),

         
            chamberTitleLabel.leadingAnchor.constraint(equalTo: titleVessel.leadingAnchor, constant: 10),
            chamberTitleLabel.trailingAnchor.constraint(equalTo: titleVessel.trailingAnchor, constant: -10),
            chamberTitleLabel.bottomAnchor.constraint(equalTo: titleVessel.bottomAnchor, constant: -12),
            
            spectatorsVessel.trailingAnchor.constraint(equalTo: titleVessel.trailingAnchor, constant: -12),
            spectatorsVessel.centerYAnchor.constraint(equalTo: spectatorsVisualMeter.centerYAnchor,constant: 10),

            spectatorsVisualMeter.trailingAnchor.constraint(equalTo: spectatorsVessel.leadingAnchor, constant: -4),
            spectatorsVisualMeter.centerYAnchor.constraint(equalTo: hostAvatarVessel.centerYAnchor, constant: 10), 
            spectatorsVisualMeter.widthAnchor.constraint(equalToConstant: 12),
            spectatorsVisualMeter.heightAnchor.constraint(equalToConstant: 12),
        ])
    }

  
    func synchronize(with model: SquadChamber) {
        chamberTitleLabel.text = model.authNavigationWrappingMeso
        statusTagLabel.text = normalizedCategory(model.roomGenreTagMelo)
        spectatorsVessel.text = "\(model.audienceMeterCountSavi)"
        portalMasterImageView.remoteImageRequestVera(
            remoteURL: model.coverStreamEndpointRumi,
            placeholder: UIImage(named: model.coverFallbackAssetQaro ?? "allopiehhhh")
        )
        hostAvatarVessel.remoteImageRequestVera(
            remoteURL: model.hostAvatarEndpointTuni,
            placeholder: PaulaAuthSession.defaultAvatarImage(size: CGSize(width: 60, height: 60))
        )
        hostIndicatorLabel.text = model.hostAliasCueVero
        switch model.roomGenreTagMelo.lowercased() {
        case let signalValueShardPelo where signalValueShardPelo.contains("hot") || signalValueShardPelo == "1":
            statusTagVessel.backgroundColor = UIColor(red: 0.62, green: 0.24, blue: 0.96, alpha: 0.92)
        case let signalValueShardPelo where signalValueShardPelo.contains("esport") || signalValueShardPelo == "2":
            statusTagVessel.backgroundColor = UIColor(red: 0.47, green: 0.24, blue: 0.94, alpha: 0.92)
        default:
            statusTagVessel.backgroundColor = UIColor(red: 0.52, green: 0.31, blue: 0.95, alpha: 0.92)
        }
    }

    private func normalizedCategory(_ roomGenreTagMelo: String) -> String {
        let lower = roomGenreTagMelo.lowercased()
        if lower == "1" || lower.contains("hot") { return "Hot" }
        if lower == "2" || lower.contains("esport") { return "Esports" }
        if lower == "3" || lower.contains("game") { return "Gaming" }
        return roomGenreTagMelo.isEmpty ? "Gaming" : roomGenreTagMelo
    }
}
