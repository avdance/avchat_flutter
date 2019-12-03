//
//  AppDelegate.swift
//  IOSProject
//
//  Created by 王诛魔 on 2019/12/3.
//  Copyright © 2019 王诛魔. All rights reserved.
//

import UIKit
import Flutter
import FlutterPluginRegistrant


@UIApplicationMain
class AppDelegate: FlutterAppDelegate {
    
    var flutterEngine : FlutterEngine?;
    
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.flutterEngine = FlutterEngine(name: "io.flutter", project: nil)
        self.flutterEngine?.run(withEntrypoint: nil)
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}

