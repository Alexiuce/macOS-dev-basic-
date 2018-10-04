//
//  ViewController.swift
//  GifDemo
//
//  Created by Alexcai on 2018/10/4.
//  Copyright © 2018 dongjiu. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var imageView: NSImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let image = NSImage(size: NSSize(width: 110, height: 84))
        image.delegate = self
        let result =  image.setName(NSImage.Name.init("timg.gif"))
        print("\(result)")
        imageView.image = image
        
        
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


    
    override func mouseDown(with event: NSEvent) {
        imageView.animates = !imageView.animates
    }
}



extension ViewController: NSImageDelegate{
    func image(_ image: NSImage, didLoadRepresentationHeader rep: NSImageRep) {
        print("did load represent header")
    }
    
    func image(_ image: NSImage, willLoadRepresentation rep: NSImageRep) {
        print("will load represnet")
    }
}
