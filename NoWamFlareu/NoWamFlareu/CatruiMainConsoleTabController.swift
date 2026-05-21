//
//  GenaSignalBloom.swift
//  NoWamFlareu
//
//  Created by  on 2026/5/6.
//


import UIKit

final class PaulaMainNavigationController: UINavigationController, UINavigationControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        navigationStackPolicyKumi(for: topViewController, animated: false)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationStackPolicyKumi(for: topViewController, animated: false)
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if !viewControllers.isEmpty {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }

    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        navigationStackPolicyKumi(for: viewController, animated: animated)
    }

    private func navigationStackPolicyKumi(for viewController: UIViewController?, animated: Bool) {
        guard let viewController, let rootViewController = viewControllers.first else {
            setNavigationBarHidden(false, animated: animated)
            return
        }
        setNavigationBarHidden(viewController !== rootViewController, animated: animated)
    }
}

class CatruiMainConsoleTabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        opaqueTabbarStylingVani()
        mainTabAssemblyDavi()
    }

    private func opaqueTabbarStylingVani() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black
        appearance.shadowColor = .clear

        tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = appearance
        }

        tabBar.backgroundColor = .black
        tabBar.barTintColor = .black
        tabBar.tintColor = .systemCyan
        tabBar.unselectedItemTintColor = .gray
        tabBar.isTranslucent = false
    }

    private func mainTabAssemblyDavi() {
    
        let arenaDiscoveryFeedJumi = PaulaMainNavigationController(rootViewController: BionaNovaRise())
        arenaDiscoveryFeedJumi.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "protocolStackPoagma0")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "protocolStackPoagmasel0")?.withRenderingMode(.alwaysOriginal))

        let forYouFeedRankingPano = PaulaMainNavigationController(rootViewController: PulseCatruiRhythmFieler())
        forYouFeedRankingPano.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "protocolStackPoagma1")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "protocolStackPoagmasel1")?.withRenderingMode(.alwaysOriginal))

        let messageThreadParsingLavo = PaulaMainNavigationController(rootViewController: EchoFusionRise())
        messageThreadParsingLavo.view.backgroundColor = .black
        messageThreadParsingLavo.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "protocolStackPoagma2")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "protocolStackPoagmasel2")?.withRenderingMode(.alwaysOriginal))

        // 4. 个人中心 (Me Profile)
        let profileSnapshotApplyMira = PaulaMainNavigationController(rootViewController: PulseMePartyQueueFlux())
        profileSnapshotApplyMira.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "protocolStackPoagma3")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "protocolStackPoagmasel3")?.withRenderingMode(.alwaysOriginal))

        viewControllers = [arenaDiscoveryFeedJumi, forYouFeedRankingPano, messageThreadParsingLavo, profileSnapshotApplyMira]
    }
}
