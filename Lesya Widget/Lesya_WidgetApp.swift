//
//  Lesya_WidgetApp.swift
//  Lesya Widget
//
//  Created by mll on 18.09.2023.
//

import SwiftUI
@main
struct Lesya_WidgetApp: App {
    @StateObject private var store = TipsStore()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            lesyalist()
                .environmentObject(store)
                .environmentObject(ContentModel())
                .dynamicTypeSize(.medium)
        }
    }
}
enum Theme: String {
    case light, dark, system

    // Utility var to pass directly to window.overrideUserInterfaceStyle
    var uiInterfaceStyle: UIUserInterfaceStyle {
        switch self {
        case .light:
            return .light
        case .dark:
            return .dark
        case .system:
            return .unspecified
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    //let appGroup = "group.CY-8B58D0FE-CBF4-11E9-9B23-D3AF4E2A89B3.com.cydia.Extender"
   // var defaults: UserDefaults!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

       /* GADMobileAds.sharedInstance().start(completionHandler:  nil)*/
     Thread.sleep(forTimeInterval: 1.2)
     // Override point for customization after application launch.
        
        if let groupDefaults = UserDefaults(suiteName: "group.CY-8B58D0FE-CBF4-11E9-9B23-D3AF4E2A89B3.com.cydia.Extender") {

            if groupDefaults.object(forKey: "ToggleStateKey") == nil {
                groupDefaults.set(false, forKey: "ToggleStateKey")
                
            }
            if groupDefaults.object(forKey: "ToggleStatePoet") == nil {
                groupDefaults.set(true, forKey: "ToggleStatePoet")
            }
            if groupDefaults.object(forKey: "ToggleStateMuz") == nil {
                groupDefaults.set(true, forKey: "ToggleStateMuz")
            }
           
          }

        
        
     return true
    }
}


