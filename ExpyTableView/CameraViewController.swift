//
//  CameraViewController.swift
//  CaptureCard
//
//  Created by Fekri on 12/12/16.
//  Copyright © 2016 MaryamFekri. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController {
    
    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var CapturarFoto: UIButton!
    
    var cameraManager = CameraManager()
  
    let maskLayer = CALayer()
    let rectLayer = CAShapeLayer()
    var rectPath = UIBezierPath()
    let useFrontTextLayer = CATextLayer()
    let tapHereToCaptureTextLayer = CATextLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        cameraManager.startRunning()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        cameraManager.stopRunning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        cameraManager.transitionCamera()
    }
    
    override func viewDidLayoutSubviews() {
        self.cameraManager.updatePreviewFrame()
        drawOverRectView()
    }
    
    /**
     this func will draw a rect mask over the camera view
     */
    func drawOverRectView() {
        
        cameraView.layer.mask = nil
        
        let cameraSize = self.cameraView!.frame.size
        
        /// to calculate the height of frame based on screen size
        var frameHeight: CGFloat = 0.0
        /// to calculate the width of frame based on screen size
        var frameWidth: CGFloat =  0.0
        /// to calculate position Y of recFrame to be in center of cameraView
        var originY: CGFloat = 0.0
        /// to calculate position X of recFrame to be in center of cameraView
        var originX: CGFloat = 0.0
        
        let currentDevice: UIDevice = UIDevice.current
        let orientation: UIDeviceOrientation = currentDevice.orientation
        
        // calculatin position and frame of rectFrame based on screen size
        switch (orientation) {
        case .landscapeRight, .landscapeLeft:
            frameHeight = (cameraSize.height)/1.4
            frameWidth = cameraSize.width/1.5
            originY = ((cameraSize.height - frameHeight)/2)
            originX = (cameraSize.width - frameWidth)/2
            break
        default:
            //if it is faceUp or portrait or any other orientation
            frameHeight = (cameraSize.height)/1.5
            frameWidth = cameraSize.width/1.15
            originY = ((cameraSize.height - frameHeight)/2)
            originX = (cameraSize.width - frameWidth)/2
            break
        }
        
        //create a rect shape layer
        rectLayer.frame = CGRect(x: originX, y: originY, width: frameWidth, height: frameHeight)
        
        //create a beizier path for a rounded rectangle
        rectPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight), cornerRadius: 10)
        
        //add beizier to rect shapelayer
        rectLayer.path = rectPath.cgPath
        rectLayer.fillColor = UIColor.black.cgColor
        rectLayer.strokeColor = UIColor.white.cgColor
        
        //add shapelayer to layer
        maskLayer.frame = cameraView.bounds
        maskLayer.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5).cgColor
        maskLayer.addSublayer(rectLayer)
        
        //add layer mask to camera view
        cameraView.layer.mask = maskLayer
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let identifier = segue.identifier, identifier == "CameraView2ImageView" {
//            (segue.destination as? ImageViewController)?.image = sender as? UIImage
//        }
//    }
    
    @IBAction func TomarFoto(_ sender: Any) {
        captureAndCropp()
    }
    //MARK: - Actions
    @IBAction func useFlashButtonTouchedUpInside(_ sender: UIButton) {
        captureAndCropp()
    }
    
    @IBAction func tapGestureAction(_ sender: Any) {
        captureAndCropp()
    }
    
    func captureAndCropp() {
        self.cameraManager.getImage(croppWith: self.rectLayer.frame) {
            (croppedImage, error) -> Void in
            OperationQueue.main.addOperation({
                if croppedImage != nil {
//                    self.performSegue(withIdentifier: "CameraView2ImageView", sender: croppedImage)
                    
                    let storyboard: UIStoryboard = UIStoryboard (name: "Main", bundle: nil)
                    let vc: ImageViewController = storyboard.instantiateViewController(withIdentifier: "showImage") as! ImageViewController
                    vc.image = croppedImage as? UIImage
                    let currentController = getCurrentViewController()
                    currentController?.present(vc, animated: false, completion: nil)
                }
            })
        }
    }
    
    @IBAction func VistaAtras(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}

// MARK: - InitView
extension CameraViewController {
    func initView() {
        
        cameraManager.captureSetup(in: self.cameraView, withPosition: .back)
        
        
    }
}


