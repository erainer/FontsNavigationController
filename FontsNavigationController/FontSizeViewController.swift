//
//  FontSizeViewController.swift
//  FontsNavigationController
//
//  Created by Emily on 3/9/18.
//  Copyright © 2018 Emily. All rights reserved.
//

import UIKit

class FontSizeViewController: UITableViewController {

    var font: UIFont!
    private static let pointSizes: [CGFloat] = [9,10,11,12,13,14,18,24,36,48,64,72,96,144]
    
    private static let cellIdentifier = "FontNameAndSize"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = FontSizeViewController.pointSizes[0]
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    func fontForDisplay(atIndexPath indexPath: NSIndexPath) -> UIFont{
        let pointSize = FontSizeViewController.pointSizes[indexPath.row]
        return font.withSize(pointSize)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FontSizeViewController.pointSizes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FontSizeViewController.cellIdentifier, for: indexPath)
        cell.textLabel?.font = fontForDisplay(atIndexPath: indexPath as NSIndexPath)
        cell.textLabel?.text = font.fontName
        cell.detailTextLabel?.text = "\(FontSizeViewController.pointSizes[indexPath.row]) point"
        
        return cell
    }



}
