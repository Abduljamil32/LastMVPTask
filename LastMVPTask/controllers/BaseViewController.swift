//
//  BaseViewController.swift
//  LastMVPTask
//
//  Created by Avaz Mukhitdinov on 25/08/22.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func appDelegate()-> AppDelegate {
        return UIApplication.shared.delete as! AppDelegate
    }

    func sceneDelegate()-> SceneDelegate {
        return ((UIApplication.shared.connectedScenes.first!.delete as? SceneDelegate)!)
    }


}
