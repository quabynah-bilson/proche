import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      // get secrets and provide google maps api key
      if let path = Bundle.main.path(forResource: "secrets", ofType: "plist") {
          let plist = NSDictionary(contentsOfFile: path)
          let apiKey = plist?.value(forKey: "googleMapsApiKey") as? String
          // Use the apiKey value as needed
          GMSServices.provideAPIKey(apiKey ?? "provide_google_auth_key")
      }

        // register for push notifications when user enters geofence
        if #available(iOS 10.0, *) {
           UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
        }

       GeneratedPluginRegistrant.register(with: self)
       return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
