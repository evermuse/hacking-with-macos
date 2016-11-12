//
//  SourceViewController.swift
//  Storm Viewer
//
//  Created by Bryan Alexander on 11/11/16.
//  Copyright © 2016 sarva. All rights reserved.
//

import Cocoa

class SourceViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {

    @IBOutlet var tableView: NSTableView!
    
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        // get a list of all files in our bundle's resource path
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        // loop over each file we found
        for item in items {
            
            // if this item starts with "nssl" add it to our array
            if item.hasPrefix("nssl") {
                
                pictures.append(item)
                
            }
        }
        
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        
        return pictures.count
        
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        guard let vw = tableView.make(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else {return nil}
        vw.textField?.stringValue = pictures[row]
        return vw
        
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        
        guard tableView.selectedRow != -1 else {return}
        guard let splitVC = parent as? NSSplitViewController else {return}
        if let detail = splitVC.childViewControllers[1] as? DetailViewController {
            
            detail.imageSelected(name: pictures[tableView.selectedRow])
            
        }
    }
    
}
