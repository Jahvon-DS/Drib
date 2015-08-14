//
//  ViewController.swift
//  Template Project
//
//  Created by Benjamin Encz on 5/15/15.
//  Copyright (c) 2015 Make School. All rights reserved.
//

import UIKit
import Parse
import ParseUI
import AVFoundationCameraController


class SettingsController: UIViewController {
   
    
      override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
        let captureSession = AVCaptureSession()
        captureSession.sessionPreset = AVCaptureSessionPresetLow
        let devices = AVCaptureDevice.devices()
        println(devices)
  }


    
    
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        
        
        
        
        
        
    }
    
    
    }
