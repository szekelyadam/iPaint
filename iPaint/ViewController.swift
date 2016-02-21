//
//  ViewController.swift
//  iPaint
//
//  Created by Ádibádi on 21/02/16.
//  Copyright © 2016 Székely Ádám. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var canvas: UIView!

    @IBAction func handleCanvasTap(sender: UITapGestureRecognizer) {
        let tapPoint = sender.locationInView(canvas)
        
        let ellipse = EllipseView()
        ellipse.bounds = CGRect(x: 0, y: 0, width: 60, height: 60)
        ellipse.center = tapPoint
        ellipse.opaque = false
        canvas.addSubview(ellipse)
    }
}

