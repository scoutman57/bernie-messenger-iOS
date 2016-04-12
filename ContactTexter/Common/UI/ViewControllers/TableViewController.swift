//
//  TableViewController.swift
//  ContactTexter
//
//  Created by Justin Baumgartner on 4/10/16.
//  Copyright © 2016 Bernie Sanders 2016. All rights reserved.
//

import UIKit

class TableViewController : UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 9, *) {
            self.tableView.cellLayoutMarginsFollowReadableWidth = false
        }
    }
    
}