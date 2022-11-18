//
//  AppDelegate.swift
//  WhatsappSenderiOS
//
//  Created by Andreas Alexandru Cretu on 10/11/22.
//

import CoreData
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: Properties

    var window: UIWindow?
    
    var userDefaults: UserDefaults!
    
    var tabbarViewController = UIStoryboard(name: Constants().UIStoryboardName, bundle: nil).instantiateInitialViewController() as? TabBarViewModel

    public static var isRunningTest: Bool {
        return ProcessInfo().arguments.contains("isRunningTest")
    }
    
    // MARK: UIApplication Lifecycle

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.userDefaults = UserDefaults(suiteName: Constants().userDefaultsSuitName)
        self.removeUserDefaults(userDefaults: self.userDefaults)

        self.createItems3DTouch()
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabbarViewController
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem) async -> Bool {
       
        switch shortcutItem.type {
        case Constants().historyViewQuickAccessType:
            tabbarViewController?.showView(index: 1)

        default:
            tabbarViewController?.showView(index: 0)
        }
        
        return true
    }
    
    func createItems3DTouch() {
        // ICONO DEL ACCESO DIRECTO
        let iconContactsView: UIApplicationShortcutIcon! = UIApplicationShortcutIcon(templateImageName: "person.circle.fill")
        // TITULO Y SUBTITULO DE LOS ACCESOS DIRECTOS
        let contactsViewQuickAccess: UIApplicationShortcutItem! = UIMutableApplicationShortcutItem(
            type: Constants().contactsViewQuickAccessType,
            localizedTitle: NSLocalizedString("contacts_view_title_contacts", comment: ""),
            localizedSubtitle: "",
            icon: iconContactsView,
            userInfo: nil)
        
        let iconHistoryView: UIApplicationShortcutIcon! = UIApplicationShortcutIcon(templateImageName: "clock.fill")
        let historyViewQuickAccess: UIApplicationShortcutItem! = UIMutableApplicationShortcutItem(
            type: Constants().historyViewQuickAccessType,
            localizedTitle: NSLocalizedString("history_view_title_history", comment: ""),
            localizedSubtitle: "",
            icon: iconHistoryView,
            userInfo: nil)
        
        // ARRAY CON LOS ELEMENTOS
        let items: [UIApplicationShortcutItem]! = [contactsViewQuickAccess, historyViewQuickAccess]
        UIApplication.shared.shortcutItems = items
    }

    // MARK: UISceneSession Lifecycle

    /*func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }*/

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: Constants().NSPersistentContainerName)
        container.loadPersistentStores(completionHandler: { _, error in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func removeUserDefaults(userDefaults: UserDefaults?) {
        
        guard let dict: [String: Any] = userDefaults?.dictionaryRepresentation(), !dict.isEmpty else { return }
        
        for (key, _) in dict {
            
            // if key != "authenticated" {
                userDefaults?.removeObject(forKey: key)
            // }
        }
        
        userDefaults?.synchronize()
    }
}
