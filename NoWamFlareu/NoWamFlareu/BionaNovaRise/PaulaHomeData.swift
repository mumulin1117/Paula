//
//  PaulaHomeData.swift
//  NoWamFlareu
//
//  Created by Codex on 2026/5/8.
//

import UIKit

struct PulseRosterUser {
    let userId: String
    let name: String
    let avatarURL: String?
    let brief: String?
}

struct SquadChamber {
    let liveId: String
    let hostUserId: String
    let title: String
    let hostName: String
    let spectatorCount: Int
    let category: String
    let coverURL: String?
    let hostAvatarURL: String?
    let participantAvatarURLs: [String]
    let password: String?
    let coverAssetName: String?
    let livesataus:Int?
    init(
        title: String,
        hostName: String,
        spectatorCount: Int,
        category: String,
        liveId: String = "",
        hostUserId: String = "",
        coverURL: String? = nil,
        hostAvatarURL: String? = nil,
        participantAvatarURLs: [String] = [],
        password: String? = nil,
        coverAssetName: String? = nil,
        livestatus:Int? = 0
    ) {
        self.liveId = liveId
        self.hostUserId = hostUserId
        self.title = title
        self.hostName = hostName
        self.spectatorCount = spectatorCount
        self.category = category
        self.coverURL = coverURL
        self.hostAvatarURL = hostAvatarURL
        self.participantAvatarURLs = participantAvatarURLs
        self.password = password
        self.coverAssetName = coverAssetName
        self.livesataus = livestatus
    }
}

enum PaulaHomeAPI {
    private static var bundleId: String = "41534325"

    static func loadHomeUsers(completion: @escaping ([PulseRosterUser]) -> Void) {
        let requestBody: [String: Any] = [
            "activeListenerPoagma": bundleId
        ]

        NWFUclipFusionOrbit.arenaPulsePeak(
            WaveTrail: "/jqhpoz/xiwpgyzxqdsnkf",
            echoMotionOrbit: requestBody,
            FusionTrail: { payload in
                let users = parseUsers(from: payload)
                completion(users.isEmpty ? fallbackUsers() : users)
            },
            clipSignalBloom: { _ in
                completion(fallbackUsers())
            }
        )
    }

    static func loadVoiceRooms(completion: @escaping ([SquadChamber]) -> Void) {
        let requestBody: [String: Any] = [
            "matrixTransformationPoagma": 20,
            "mainThreadPoagma": 1,
            "mediaEnginePoagma": "",
            "machineLearningPoagma": "",
            "mediaCapturePoagma": bundleId,
            "mediaFoundationPoagma": "3"
        ]

        NWFUclipFusionOrbit.arenaPulsePeak(
            WaveTrail: "/vygdmpeqyeiiwz/xlvrs",
            echoMotionOrbit: requestBody,
            FusionTrail: { payload in
                let rooms = parseRooms(from: payload)
                print(rooms)
                completion(rooms.isEmpty ? fallbackRooms() : rooms)
            },
            clipSignalBloom: { _ in
                completion(fallbackRooms())
            }
        )
    }

    static func loadLiveRooms(completion: @escaping ([SquadChamber]) -> Void) {
        let requestBody: [String: Any] = [
            "matrixTransformationPoagma": 20,
            "mainThreadPoagma": 1,
            "mediaEnginePoagma": "1",//selectType
            "machineLearningPoagma": "",
            "mediaCapturePoagma": bundleId,
            "mediaFoundationPoagma": "1"
        ]

        NWFUclipFusionOrbit.arenaPulsePeak(
            WaveTrail: "/vygdmpeqyeiiwz/xlvrs",
            echoMotionOrbit: requestBody,
            FusionTrail: { payload in
                let rooms = parseRooms(from: payload)
                completion(rooms.isEmpty ? fallbackLiveRooms() : rooms)
            },
            clipSignalBloom: { _ in
                completion(fallbackLiveRooms())
            }
        )
    }

    private static func parseUsers(from payload: Any?) -> [PulseRosterUser] {
        let dictionaries = dictionaries(containingAny: ["adaptiveBitratePoagma", "acousticEchoCancellationPoagma", "advancedCodecsPoagma"], in: payload)
        return dictionaries.compactMap { item in
            let name = stringValue(item["adaptiveBitratePoagma"]) ?? "Paula Player"
            let userId = stringValue(item["acousticEchoCancellationPoagma"]) ?? UUID().uuidString
            return PulseRosterUser(
                userId: userId,
                name: name,
                avatarURL: stringValue(item["advancedCodecsPoagma"]),
                brief: stringValue(item["asynchronousBufferPoagma"])
            )
        }
    }

    private static func parseRooms(from payload: Any?) -> [SquadChamber] {
        let roomDictionaries = dictionaries(containingAny: ["mediaSessionPoagma", "mediaPlayerPoagma", "mediaRecorderPoagma"], in: payload)
        return roomDictionaries.compactMap { item in
            let liveId = stringValue(item["mediaPlayerPoagma"]) ?? UUID().uuidString
            let hostUserId = stringValue(item["mediaProjectionPoagma"]) ?? stringValue(item["motionBlurPoagma"]) ?? ""
            let title = stringValue(item["mediaSessionPoagma"]) ?? "Gaming Room"
            let hostName = stringValue(item["messageQueuePoagma"]) ?? "Host"
            let count = intValue(item["meshGenerationPoagma"]) ?? 0
            let category = stringValue(item["multiThreadingPoagma"]) ?? "Gaming"
            
            let status = intValue(item["memoryMappingPoagma"]) ?? 0
            
            print(payload)
            let participantAvatarURLs = dictionaries(
                containingAny: ["multicastStreamPoagma", "motionEstimationPoagma", "multiplayerEnginePoagma"],
                in: item["modelTrainingPoagma"] ?? item["userList"]
            )
            .compactMap { stringValue($0["multicastStreamPoagma"]) }
            let hostAvatarURL = stringValue(item["metadataParsingPoagma"]) ?? participantAvatarURLs.first

            return SquadChamber(
                title: title,
                hostName: hostName,
                spectatorCount: count,
                category: category,
                liveId: liveId,
                hostUserId: hostUserId,
                coverURL: stringValue(item["mediaRecorderPoagma"]),
                hostAvatarURL: hostAvatarURL,
                participantAvatarURLs: participantAvatarURLs,
                password: stringValue(item["nativeBridgePoagma"]),
                coverAssetName: fallbackAsset(for: category),
                livestatus: status
            )
        }
    }

    private static func dictionaries(containingAny keys: Set<String>, in payload: Any?) -> [[String: Any]] {
        guard let payload else { return [] }
        if let dictionary = payload as? [String: Any] {
            var result: [[String: Any]] = keys.contains { dictionary[$0] != nil } ? [dictionary] : []
            for value in dictionary.values {
                result.append(contentsOf: dictionaries(containingAny: keys, in: value))
            }
            return result
        }
        if let array = payload as? [Any] {
            return array.flatMap { dictionaries(containingAny: keys, in: $0) }
        }
        return []
    }

    private static func stringValue(_ value: Any?) -> String? {
        if let value = value as? String, !value.isEmpty {
            return value
        }
        if let value = value as? NSNumber {
            return value.stringValue
        }
        return nil
    }

    private static func intValue(_ value: Any?) -> Int? {
        if let value = value as? Int {
            return value
        }
        if let value = value as? NSNumber {
            return value.intValue
        }
        if let value = value as? String {
            return Int(value)
        }
        return nil
    }

    private static func fallbackAsset(for category: String) -> String {
        category.lowercased().contains("hot") ? "feverrhot" : "allopiehhhh"
    }

    static func fallbackUsers() -> [PulseRosterUser] {
        [
//            PulseRosterUser(userId: "local-1", name: "Callie Rice", avatarURL: nil, brief: "Voice strategist"),
//            PulseRosterUser(userId: "local-2", name: "Lela Guerrero", avatarURL: nil, brief: "Esports host"),
//            PulseRosterUser(userId: "local-3", name: "Belle", avatarURL: nil, brief: "Live player"),
//            PulseRosterUser(userId: "local-4", name: "Nova Play", avatarURL: nil, brief: "GameMind AI"),
//            PulseRosterUser(userId: "local-5", name: "User 882", avatarURL: nil, brief: "Ready")
        ]
    }

    static func fallbackRooms() -> [SquadChamber] {
        [
//            SquadChamber(title: "Climb Tonight", hostName: "Callie", spectatorCount: 24, category: "Hot", liveId: "101", hostUserId: "local-1", coverAssetName: "feverrhot"),
//            SquadChamber(title: "Squad Leader", hostName: "Lela", spectatorCount: 18, category: "Esports", liveId: "102", hostUserId: "local-2", coverAssetName: "allopiehhhh"),
//            SquadChamber(title: "Squad Queue", hostName: "Belle", spectatorCount: 77, category: "Gaming", liveId: "103", hostUserId: "local-3", coverAssetName: "allopiehhhh"),
//            SquadChamber(title: "Champion Stage", hostName: "Nova", spectatorCount: 63, category: "Esports", liveId: "104", hostUserId: "local-4", coverAssetName: "allopiehhhh"),
//            SquadChamber(title: "Late Game Lobby", hostName: "Mira", spectatorCount: 41, category: "Hot", liveId: "105", hostUserId: "local-5", coverAssetName: "feverrhot"),
//            SquadChamber(title: "Rank Push", hostName: "Aiden", spectatorCount: 36, category: "Gaming", liveId: "106", hostUserId: "local-6", coverAssetName: "allopiehhhh")
        ]
    }

    static func fallbackLiveRooms() -> [SquadChamber] {
        [
//            SquadChamber(title: "Oh? And what do you hear?", hostName: "Ari Fox", spectatorCount: 214, category: "Live", liveId: "live-201", hostUserId: "live-host-1", coverAssetName: "featuredLargeTile"),
//            SquadChamber(title: "Tactical Training Room", hostName: "Zachary Daniel", spectatorCount: 86, category: "Live", liveId: "live-202", hostUserId: "live-host-2", coverAssetName: "gamehold"),
//            SquadChamber(title: "Gameplay Analysis Room", hostName: "Elnora Nunez", spectatorCount: 73, category: "Live", liveId: "live-203", hostUserId: "live-host-3", coverAssetName: "allopiehhhh"),
//            SquadChamber(title: "Clutch Play Room", hostName: "Elnora Howard", spectatorCount: 52, category: "Live", liveId: "live-204", hostUserId: "live-host-4", coverAssetName: "gamehold"),
//            SquadChamber(title: "Ranked Push Stream", hostName: "Lela Guerrero", spectatorCount: 41, category: "Live", liveId: "live-205", hostUserId: "live-host-5", coverAssetName: "allopiehhhh")
        ]
    }
}

struct PaulaMessageThread {
    let messageId: String
    let userId: String
    let name: String
    let avatarURL: String?
    let title: String
    let content: String
    let createDate: String?
    let isUnread: Bool
    let showsVIP: Bool
}

struct PaulaMeProfile {
    let userId: String
    let name: String
    let avatarURL: String?
    let avatarFrameURL: String?
    let brief: String
    let birthday: String
    let weight: String
    let height: String
    let friendsCount: Int
    let followingCount: Int
    let followersCount: Int
    let coinBalance: String
    let isVIP: Bool
    let isLocalOnly: Bool

    static func fallback() -> PaulaMeProfile {
        let profile = PaulaAuthSession.current
        return PaulaMeProfile(
            userId: profile?.userId ?? "",
            name: profile?.name ?? "Log in",
            avatarURL: profile?.avatarURL,
            avatarFrameURL: nil,
            brief: profile?.brief.isEmpty == false ? profile?.brief ?? "-" : "-",
            birthday: profile?.age.map { "\($0)" } ?? "-",
            weight: profile?.isLocalOnly == true ? "-" : "76kg",
            height: profile?.isLocalOnly == true ? "-" : "160cm",
            friendsCount: profile?.isLocalOnly == true || profile == nil ? 0 : 52,
            followingCount: profile?.isLocalOnly == true || profile == nil ? 0 : 26,
            followersCount: profile?.isLocalOnly == true || profile == nil ? 0 : 87,
            coinBalance: "887",
            isVIP: !(profile?.isLocalOnly ?? true),
            isLocalOnly: profile?.isLocalOnly ?? true
        )
    }
}

enum PaulaMeAPI {
    static func loadCurrentUserInfo(completion: @escaping (PaulaMeProfile) -> Void) {
        let userId = PaulaAuthSession.current?.userId ?? UserDefaults.standard.string(forKey: "wigCreator") ?? ""
        guard !userId.isEmpty else {
            completion(.fallback())
            return
        }

        NWFUclipFusionOrbit.arenaPulsePeak(
            WaveTrail: "/vigtbhxqmmyhz/qohkmvxg",
            echoMotionOrbit: [
                "frameInterpolationPoagma": "1",
                "frameBufferPoagma": userId
            ],
            FusionTrail: { payload in
                if let profile = parseProfile(from: payload) {
                    completion(profile)
                } else {
                    loadCurrentUserInfoFallback(completion: completion)
                }
            },
            clipSignalBloom: { _ in
                loadCurrentUserInfoFallback(completion: completion)
            }
        )
    }

    private static func loadCurrentUserInfoFallback(completion: @escaping (PaulaMeProfile) -> Void) {
        NWFUclipFusionOrbit.arenaPulsePeak(
            WaveTrail: "/yoclzrsacyz/rbvovjym",
            echoMotionOrbit: [:],
            FusionTrail: { payload in
                completion(parseProfile(from: payload) ?? .fallback())
            },
            clipSignalBloom: { _ in
                completion(.fallback())
            }
        )
    }

    private static func parseProfile(from payload: Any?) -> PaulaMeProfile? {
        let dictionaries = dictionaries(
            containingAny: ["frameRatePoagma", "frequencyDomainPoagma", "inputLatencyPoagma", "inferenceEnginePoagma"],
            in: payload
        )
        guard let item = dictionaries.first else { return nil }
        let fallback = PaulaMeProfile.fallback()
        let profile = PaulaAuthSession.current
        let userId = stringValue(item["frameRatePoagma"]) ?? stringValue(item["inferenceEnginePoagma"]) ?? fallback.userId
        let name = stringValue(item["frequencyDomainPoagma"]) ?? stringValue(item["inputLatencyPoagma"]) ?? fallback.name
        let birthday = stringValue(item["gameSessionPoagma"]) ?? stringValue(item["internalStoragePoagma"]) ?? fallback.birthday
        let weight = formattedMetric(stringValue(item["globalIlluminationPoagma"]) ?? stringValue(item["linearFilteringPoagma"]), suffix: "kg", fallback: fallback.weight)
        let height = formattedMetric(stringValue(item["gestureRecognitionPoagma"]) ?? stringValue(item["linearAlgebraPoagma"]), suffix: "cm", fallback: fallback.height)
        let vipExpire = stringValue(item["gameStatePoagma"]) ?? stringValue(item["keyframeIntervalPoagma"])

        return PaulaMeProfile(
            userId: userId,
            name: name,
            avatarURL: stringValue(item["gameControllerPoagma"]) ?? stringValue(item["instanceRenderingPoagma"]) ?? profile?.avatarURL,
            avatarFrameURL: stringValue(item["imageSynthesisPoagma"]),
            brief: stringValue(item["gameLoopPoagma"]) ?? stringValue(item["interfaceBuilderPoagma"]) ?? fallback.brief,
            birthday: birthday,
            weight: weight,
            height: height,
            friendsCount: intValue(item["hardwareAccelerationPoagma"]) ?? fallback.friendsCount,
            followingCount: intValue(item["headTrackingPoagma"]) ?? fallback.followingCount,
            followersCount: intValue(item["hashFunctionPoagma"]) ?? fallback.followersCount,
            coinBalance: fallback.coinBalance,
            isVIP: isFutureTimestamp(vipExpire) || !fallback.isLocalOnly,
            isLocalOnly: profile?.isLocalOnly ?? fallback.isLocalOnly
        )
    }

    private static func formattedMetric(_ value: String?, suffix: String, fallback: String) -> String {
        guard let value, !value.isEmpty, value != "0" else { return fallback }
        return value.lowercased().contains(suffix) ? value : "\(value)\(suffix)"
    }

    private static func isFutureTimestamp(_ value: String?) -> Bool {
        guard let value else { return false }
        if let number = Double(value) {
            let normalized = number > 10_000_000_000 ? number / 1000 : number
            return normalized > Date().timeIntervalSince1970
        }
        let formatter = ISO8601DateFormatter()
        return formatter.date(from: value).map { $0 > Date() } ?? false
    }

    private static func dictionaries(containingAny keys: Set<String>, in payload: Any?) -> [[String: Any]] {
        guard let payload else { return [] }
        if let dictionary = payload as? [String: Any] {
            var result: [[String: Any]] = keys.contains { dictionary[$0] != nil } ? [dictionary] : []
            for value in dictionary.values {
                result.append(contentsOf: dictionaries(containingAny: keys, in: value))
            }
            return result
        }
        if let array = payload as? [Any] {
            return array.flatMap { dictionaries(containingAny: keys, in: $0) }
        }
        return []
    }

    private static func stringValue(_ value: Any?) -> String? {
        if let value = value as? String, !value.isEmpty {
            return value
        }
        if let value = value as? NSNumber {
            return value.stringValue
        }
        return nil
    }

    private static func intValue(_ value: Any?) -> Int? {
        if let value = value as? Int {
            return value
        }
        if let value = value as? NSNumber {
            return value.intValue
        }
        if let value = value as? String {
            return Int(value)
        }
        return nil
    }
}

enum PaulaMessageAPI {
    private static var bundleId: String {
        Bundle.main.bundleIdentifier ?? "com.communityDinner.Dimeet.NoWamFlareu"
    }

    static func loadMessageUsers(completion: @escaping ([PulseRosterUser]) -> Void) {
        let requestBody: [String: Any] = [
            "nativeCodePoagma": "1"
        ]

        NWFUclipFusionOrbit.arenaPulsePeak(
            WaveTrail: "/ggwtqbsxfoucmlxz/znaqtjirhfmu",
            echoMotionOrbit: requestBody,
            FusionTrail: { payload in
                let users = parseRelationUsers(from: payload)
                completion(users.isEmpty ? PaulaHomeAPI.fallbackUsers() : users)
            },
            clipSignalBloom: { _ in
                completion(PaulaHomeAPI.fallbackUsers())
            }
        )
    }

    static func loadMessageThreads(completion: @escaping ([PaulaMessageThread]) -> Void) {
        let currentUserId = PaulaAuthSession.current?.userId ?? UserDefaults.standard.string(forKey: "wigCreator") ?? ""
        let requestBody: [String: Any] = [
            "errorConcealmentPoagma": bundleId,
            "eventDispatcherPoagma": currentUserId
        ]

        NWFUclipFusionOrbit.arenaPulsePeak(
            WaveTrail: "/rqmbgkuz/gyqifokzkmo",
            echoMotionOrbit: requestBody,
            FusionTrail: { payload in
                completion(parseMessageThreads(from: payload))
            },
            clipSignalBloom: { _ in
                completion(fallbackMessageThreads())
            }
        )
    }

    static func markRead(messageId: String) {
        guard !messageId.isEmpty else { return }
        NWFUclipFusionOrbit.arenaPulsePeak(
            WaveTrail: "/wlvraeoz/zjlfmqcto",
            echoMotionOrbit: ["radarChartPoagma": messageId],
            FusionTrail: nil,
            clipSignalBloom: nil
        )
    }

    private static func parseRelationUsers(from payload: Any?) -> [PulseRosterUser] {
        let dictionaries = dictionaries(
            containingAny: ["naturalLanguagePoagma", "nativeInterfacePoagma", "navigationControllerPoagma"],
            in: payload
        )
        return dictionaries.compactMap { item in
            let name = stringValue(item["adaptiveBitratePoagma"]) ?? "Paula Player"
            let userId = stringValue(item["acousticEchoCancellationPoagma"]) ?? UUID().uuidString
            return PulseRosterUser(
                userId: userId,
                name: name,
                avatarURL: stringValue(item["advancedCodecsPoagma"]),
                brief: stringValue(item["asynchronousBufferPoagma"])
            )
        }
    }

    private static func parseMessageThreads(from payload: Any?) -> [PaulaMessageThread] {
        let dictionaries = dictionaries(
            containingAny: ["eventHandlingPoagma", "fieldOfViewPoagma", "fileDescriptorPoagma", "filterChainPoagma"],
            in: payload
        )
        let currentUserId = PaulaAuthSession.current?.userId ?? UserDefaults.standard.string(forKey: "wigCreator") ?? ""

        return dictionaries.compactMap { item in
            let sendUserId = stringValue(item["fileDescriptorPoagma"]) ?? ""
            let receiveUserId = stringValue(item["eventLoopPoagma"]) ?? ""
            let isFromCurrentUser = !currentUserId.isEmpty && sendUserId == currentUserId
            let peerId = isFromCurrentUser ? receiveUserId : sendUserId
            let peerName = isFromCurrentUser
                ? stringValue(item["faceTrackingPoagma"])
                : stringValue(item["filterChainPoagma"])
            let peerAvatar = isFromCurrentUser
                ? stringValue(item["fastFourierTransformPoagma"])
                : stringValue(item["flowControlPoagma"])
            let content = stringValue(item["fieldOfViewPoagma"]) ?? stringValue(item["featureExtractionPoagma"]) ?? "Oh? And what do you hear?"
            let messageId = stringValue(item["eventHandlingPoagma"]) ?? UUID().uuidString
            let readFlag = stringValue(item["fontRenderingPoagma"])?.lowercased()

            return PaulaMessageThread(
                messageId: messageId,
                userId: peerId.isEmpty ? UUID().uuidString : peerId,
                name: peerName ?? "Paula Player",
                avatarURL: peerAvatar,
                title: stringValue(item["featureExtractionPoagma"]) ?? "",
                content: content,
                createDate: stringValue(item["fluidDynamicsPoagma"]),
                isUnread: readFlag == nil || readFlag == "0" || readFlag == "false",
                showsVIP: false
            )
        }
    }

    static func fallbackMessageThreads() -> [PaulaMessageThread] {
        [
            PaulaMessageThread(messageId: "msg-1", userId: "u-1", name: "Walter Love", avatarURL: nil, title: "", content: "Oh? And what do you hear?", createDate: nil, isUnread: true, showsVIP: true),
            PaulaMessageThread(messageId: "msg-2", userId: "u-2", name: "Paul Brooks", avatarURL: nil, title: "", content: "Oh? And what do you hear?", createDate: nil, isUnread: true, showsVIP: true),
            PaulaMessageThread(messageId: "msg-3", userId: "u-3", name: "Jane Terry", avatarURL: nil, title: "", content: "Oh? And what do you hear?", createDate: nil, isUnread: false, showsVIP: false),
            PaulaMessageThread(messageId: "msg-4", userId: "u-4", name: "Hettie Moran", avatarURL: nil, title: "", content: "Oh? And what do you hear?", createDate: nil, isUnread: false, showsVIP: false)
        ]
    }

    private static func dictionaries(containingAny keys: Set<String>, in payload: Any?) -> [[String: Any]] {
        guard let payload else { return [] }
        if let dictionary = payload as? [String: Any] {
            var result: [[String: Any]] = keys.contains { dictionary[$0] != nil } ? [dictionary] : []
            for value in dictionary.values {
                result.append(contentsOf: dictionaries(containingAny: keys, in: value))
            }
            return result
        }
        if let array = payload as? [Any] {
            return array.flatMap { dictionaries(containingAny: keys, in: $0) }
        }
        return []
    }

    private static func stringValue(_ value: Any?) -> String? {
        if let value = value as? String, !value.isEmpty {
            return value
        }
        if let value = value as? NSNumber {
            return value.stringValue
        }
        return nil
    }
}

extension UIImageView {
    func setPaulaImage(remoteURL: String?, placeholder: UIImage?) {
        let resolvedURL = PaulaRemoteImageURLResolver.url(from: remoteURL)
        let cacheKey = resolvedURL?.absoluteString
        layer.name = cacheKey
        image = placeholder

        guard let resolvedURL else { return }
        var request = URLRequest(url: resolvedURL)
        request.timeoutInterval = 15

        URLSession.shared.dataTask(with: request) { [weak self] data, _, _ in
            guard let data, let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                guard self?.layer.name == cacheKey else { return }
                self?.image = image
            }
        }.resume()
    }
}

private enum PaulaRemoteImageURLResolver {
    private static let baseImageHost = "https://b9v7c5x3z1a9s7d5f3g1h.shop"

    static func url(from rawValue: String?) -> URL? {
        guard var value = rawValue?.trimmingCharacters(in: .whitespacesAndNewlines), !value.isEmpty else {
            return nil
        }

        if value.hasPrefix("//") {
            value = "https:" + value
        } else if value.hasPrefix("/") {
            value = baseImageHost + value
        } else if !value.lowercased().hasPrefix("http://") && !value.lowercased().hasPrefix("https://") {
            value = baseImageHost + "/" + value
        }

        if let url = URL(string: value) {
            return url
        }
        guard let encodedValue = value.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return nil
        }
        return URL(string: encodedValue)
    }
}
