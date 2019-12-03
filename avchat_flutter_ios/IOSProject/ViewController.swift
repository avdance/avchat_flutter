//
//  ViewController.swift
//  IOSProject
//
//  Created by 王诛魔 on 2019/12/3.
//  Copyright © 2019 王诛魔. All rights reserved.
//

import UIKit
import Flutter

class ViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        //let vc = FlutterViewController()
        let flutterEngine = (UIApplication.shared.delegate as? AppDelegate)?.flutterEngine as! FlutterEngine
        let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle:nil);
        
        self.present(flutterViewController, animated: false, completion: nil)
        flutterViewController.setInitialRoute("Init")
    }
}
