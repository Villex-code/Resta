import UIKit
import Flutter
//import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    //GMSServices.provideAPIKey("AIzaSyBnMGsSbz4uYa0Y-PGoX7tb-xtUBj9Jrwc")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
