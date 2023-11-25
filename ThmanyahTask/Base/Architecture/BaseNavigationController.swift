//
//  BaseNavigationController.swift
//  ThmanyahTask
//
//  Created by Moamen on 24/11/2023.
//

import UIKit

class BaseNavigationController: UINavigationController {

    // MARK: - Properties
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
    
    // MARK: - inits
    convenience init(_ rootViewController: UIViewController) {
        self.init(rootViewController: rootViewController)
    }
    
    // MARK: - lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setPresentationStyle(with: .fullScreen)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override public func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.visibleViewController?.navigationItem.backBarButtonItem = UIBarButtonItem(
            title: " ",
            style: .plain,
            target: nil,
            action: nil)
        super.pushViewController(viewController, animated: animated)
    }
    
    public func setPresentationStyle(with style: UIModalPresentationStyle) {
        modalPresentationStyle = style
    }
}
