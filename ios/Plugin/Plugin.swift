import Foundation
import Capacitor

struct APIResult: Codable {
    struct App: Codable {
        let trackId: Int

        enum CodingKeys : String, CodingKey {
            case trackId
        }
    }

    let resultCount: Int
    let apps: [App]

    enum CodingKeys : String, CodingKey {
        case resultCount
        case apps = "results"
    }
}

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitor.ionicframework.com/docs/plugins/ios
 */
@objc(NativeMarket)
public class NativeMarket: CAPPlugin {
    
    @objc func openStoreListing(_ call: CAPPluginCall) {
        guard let appId = call.getString("appId") else {
            call.reject("appId is missing")
            return
        }
        do {
            let url = URL(string: "http://itunes.apple.com/lookup?bundleId=\(appId)")
            let data = try Data(contentsOf: url!)
            let decoder = JSONDecoder()
            let apps = try! decoder.decode(APIResult.self, from: data).apps
            let urlStore = "itms-apps://itunes.apple.com/app/id\(apps[0].trackId)"
            let appUrl = URL(string: urlStore)
            
            DispatchQueue.main.async {
                if UIApplication.shared.canOpenURL(appUrl!) {
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(appUrl!, options: [:]) { (success) in
                            call.resolve()
                        }
                    } else {
                        UIApplication.shared.openURL(appUrl!)
                        call.resolve()
                    }
                }
            }
        } catch {
            print("trackId cannot be found from appId")
            call.reject("trackId cannot be found from appId")
        }
    }
    
    @objc func openDevPage(_ call: CAPPluginCall) {
        call.resolve() // TODO: Implement
    }
    
    @objc func openCollection(_ call: CAPPluginCall) {
        call.resolve() // TODO: Implement
    }
    
    @objc func openEditorChoicePage(_ call: CAPPluginCall) {
        call.resolve() // TODO: Implement
    }
    
    @objc func search(_ call: CAPPluginCall) {
        if call.hasOption("terms") {
            let terms = call.getString("terms")
            
            let url = "itms-apps://itunes.apple.com/search?term=" + terms!
            let appUrl = URL(string: url)
            
            if UIApplication.shared.canOpenURL(appUrl!) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(appUrl!, options: [:]) { (success) in
                        call.resolve()
                    }
                } else {
                    UIApplication.shared.openURL(appUrl!)
                    call.resolve()
                }
            }
        } else {
            call.reject("terms is missing")
        }
    }
}
