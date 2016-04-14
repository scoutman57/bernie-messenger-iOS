//
//  RightBarButtonItemConfigurable.swift
//  ContactTexter
//
//  Created by Justin Baumgartner on 4/13/16.
//  Copyright © 2016 Bernie Sanders 2016. All rights reserved.
//

import UIKit

enum RightBarButtonItemType {
    
    case None
    case History
    case Cancel
    
}

// MARK: RightBarButtonItemConfigurable

protocol RightBarButtonItemConfigurable : class {
    
    var rightBarButtonItemType: RightBarButtonItemType { get }
    
}

// MARK: Default implementation for controllers

extension RightBarButtonItemConfigurable where Self : UIViewController {
    
    func setUpRightBarButtonItem() {
        clearCurrentRightBarButtonItem()
        
        var rightBarButtonItems: [UIBarButtonItem] = []
        
        switch self.rightBarButtonItemType {
        case .None:
            break
        case .History:
            rightBarButtonItems.append(historyBarButtonItem())
        case .Cancel:
            rightBarButtonItems.append(cancelBarButtonItem())
        }
        
        self.navigationItem.rightBarButtonItems = rightBarButtonItems
    }
    
    private func historyBarButtonItem() -> UIBarButtonItem {
        let backButton = UIBarButtonItem(title: nil, style: .Plain, target: self.navigationController, action: #selector(UINavigationController.cancelButtonAction))
        backButton.setFAIcon(.FAHistory, iconSize: 20.0)
        return backButton
    }
    
    private func cancelBarButtonItem() -> UIBarButtonItem {
        return UIBarButtonItem(title: "Cancel", style: .Plain, target: self.navigationController, action: #selector(UINavigationController.cancelButtonAction))
    }
    
    private func clearCurrentRightBarButtonItem() {
        self.navigationItem.rightBarButtonItem = nil
        self.navigationItem.rightBarButtonItems = []
    }
    
}

// MARK: Button action handling

extension UINavigationController {
    
    func cancelButtonAction() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
