//
//  SceneDelegate.swift
//  PomodoroToDO
//
//  Created by Александр Тимофеев on 29.06.2021.
//

import UIKit
import SwiftUI
import RealmSwift

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

      if let windowScene = scene as? UIWindowScene {
        do {
          // 1
          let realm = try Realm()
          let window = UIWindow(windowScene: windowScene)
          // 2
          let contentView = ContentView()
            .environmentObject(TaskStore(realm: realm))
          window.rootViewController = UIHostingController(rootView: contentView)
          self.window = window
          window.makeKeyAndVisible()
        } catch let error {
          // Handle error
          fatalError("Failed to open Realm. Error: \(error.localizedDescription)")
        }
      }
    }


}

