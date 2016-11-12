//
//  DetailViewController.swift
//  Storm Viewer
//
//  Created by Bryan Alexander on 11/11/16.
//  Copyright © 2016 sarva. All rights reserved.
//

import Cocoa

class DetailViewController: NSViewController {

    @IBOutlet var imageView: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    func imageSelected(name: String) {
        
        imageView.image = NSImage(named: name)
        
    }
    
}
