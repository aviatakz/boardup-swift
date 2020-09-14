//
//  DiagramViewController.swift
//  360
//
//  Created by Adilzhan Akhayev on 7/17/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import UIKit

class DiagramViewController: UIViewController {
    @IBOutlet weak var diagramView: UIView!
    @IBOutlet weak var numberOfEvalutedLabel: UILabel!
    @IBOutlet weak var dateEvalutedLabel: UILabel!
    var viewModel = DiagramViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchData()
        viewModel.radarView.bind { viewChange in
            self.viewModel.updateView(view: self.diagramView)
        }
    }
    func addViewZoom() {
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchedView))
        diagramView.isUserInteractionEnabled = true
        diagramView.addGestureRecognizer(pinchGesture)
    }
    
    @objc func pinchedView(sender: UIPinchGestureRecognizer) {
        if sender.scale > 1 {
            print("Zoom out")
        } else{
            print("Zoom in")
        }
    }
    
    
    @IBAction func allSwitch(_ sender: UISwitch) {
        viewModel.takeSwitch(sender.tag)
    }
}

