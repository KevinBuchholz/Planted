//
//  ArViewModel.swift
//  Planted
//
//  Created by Jacquese Whitson  on 3/29/23.
//

import Foundation

import SwiftUI
import AVFoundation


class ViewController : UIViewController{
    private var permissionGranted = false
    
    private let captureSession = AVCaptureSession()
    private let sessionQueue = DispatchQueue(label: "sessionQueue")
    
    private var previewLayer = AVCaptureVideoPreviewLayer()
    var screenRect: CGRect! = nil
    
    
    override func viewDidLoad() {
        checkPermission()
        
            sessionQueue.async {
                [unowned self] in
                guard permissionGranted else {return }
                self.setupCaptureSession()
                // run camera if we have permission
                self.captureSession.startRunning()
                
            }
    }
    
    func checkPermission(){
        switch AVCaptureDevice.authorizationStatus(for: .video){
        case .authorized:
        permissionGranted = true
            
        case .notDetermined:
            requestPermission()
            
        default: permissionGranted = false
        }
        
    }
    
    
    func requestPermission(){
        sessionQueue.suspend()
        AVCaptureDevice.requestAccess(for: .video,completionHandler:
                                        { [unowned self] granted in
            self.permissionGranted = granted
            self.sessionQueue.resume()
        })
    }
    
    
    
    
    func setupCaptureSession(){
        guard let videoDevice = AVCaptureDevice.default(.builtInDualWideCamera, for: .video, position: .back) else { return }
        
        guard let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice) else { return }
        
        
        guard captureSession.canAddInput(videoDeviceInput) else {return}
        captureSession.addInput(videoDeviceInput)
        
        
        screenRect = UIScreen.main.bounds
        previewLayer = AVCaptureVideoPreviewLayer(session:captureSession)
        previewLayer.frame = CGRect(x: 0, y: 0, width: screenRect.size.width, height: screenRect.size.height)
        previewLayer.connection?.videoOrientation = .portrait
        
        DispatchQueue.main.async { [weak self] in
            self!.view.layer.addSublayer(self!.previewLayer)}
        
    }
    
}// class


struct HostedViewController : UIViewControllerRepresentable{
    func makeUIViewController(context: Context) -> some UIViewController {
        return ViewController()
    }
    
    
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
