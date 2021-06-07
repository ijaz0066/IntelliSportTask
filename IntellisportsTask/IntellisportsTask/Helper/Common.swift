//
//  Common.swift
//  IntellisportsTask
//
//  Created by ijaz ahmad on 2021-06-07.
//

import Foundation
import UIKit

class Common {
    
    class func registerTableViewCell(nibName: String, identifier: String, tableView: UITableView ) {
        let tableViewCellNib = UINib(nibName: nibName, bundle: nil)
        tableView.register(tableViewCellNib, forCellReuseIdentifier: identifier)
    }
}
