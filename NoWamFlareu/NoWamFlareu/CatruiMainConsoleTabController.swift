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
        updateNavigationBarVisibility(for: topViewController, animated: false)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateNavigationBarVisibility(for: topViewController, animated: false)
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if !viewControllers.isEmpty {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }

    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        updateNavigationBarVisibility(for: viewController, animated: animated)
    }

    private func updateNavigationBarVisibility(for viewController: UIViewController?, animated: Bool) {
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
        setupTabAtmosphere()
        assembleModuleUnits()
    }

    private func setupTabAtmosphere() {
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

    private func assembleModuleUnits() {
    
        let homeUnit = PaulaMainNavigationController(rootViewController: BionaNovaRise())
        homeUnit.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "protocolStackPoagma0")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "protocolStackPoagmasel0")?.withRenderingMode(.alwaysOriginal))

        let trendUnit = PaulaMainNavigationController(rootViewController: PulseCatruiRhythmFieler())
        trendUnit.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "protocolStackPoagma1")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "protocolStackPoagmasel1")?.withRenderingMode(.alwaysOriginal))

        let chatUnit = PaulaMainNavigationController(rootViewController: EchoFusionRise())
        chatUnit.view.backgroundColor = .black
        chatUnit.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "protocolStackPoagma2")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "protocolStackPoagmasel2")?.withRenderingMode(.alwaysOriginal))

        // 4. 个人中心 (Me Profile)
        let meUnit = PaulaMainNavigationController(rootViewController: PulseMePartyQueueFlux())
        meUnit.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "protocolStackPoagma3")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "protocolStackPoagmasel3")?.withRenderingMode(.alwaysOriginal))

        viewControllers = [homeUnit, trendUnit, chatUnit, meUnit]
    }
}
