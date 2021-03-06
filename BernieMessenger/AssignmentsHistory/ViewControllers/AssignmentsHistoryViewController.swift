//
//  AssignmentsHistoryViewController.swift
//  BernieMessenger
//
//  Created by Justin Baumgartner on 4/18/16.
//  Copyright © 2016 Bernie Sanders 2016. All rights reserved.
//

import UIKit

class AssignmentsHistoryViewController : TableViewController {
    
    private let assignmentRecords: [AssignmentRecord]
    
    private lazy var dummyAssignmentCell = TitledTableViewCell.loadFromNib()
    
    // MARK: Initializers
    
    init(assignmentRecords: [AssignmentRecord]) {
        self.assignmentRecords = assignmentRecords
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life cycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.estimatedRowHeight = 75.0
        self.tableView.registerReusableCell(TitledTableViewCell.self)
    }
    
    // MARK: ViewControllerType
    
    override var rightBarButtonItemType: RightBarButtonItemType {
        return .Close
    }
    
    // MARK: UITableViewDataSource
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.assignmentRecords.count
    }
    
    // MARK: UITableViewDelegate
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: TitledTableViewCell = tableView.dequeueReusableCell(indexPath)
        cell.configureCell(assignmentRecord: self.assignmentRecords[indexPath.row])
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        self.dummyAssignmentCell.configureCell(assignmentRecord: self.assignmentRecords[indexPath.row])
        return self.dummyAssignmentCell.calculatedHeight(tableView: tableView)
    }
    
}
