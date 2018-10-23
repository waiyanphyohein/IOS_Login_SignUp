//
//  CameraViewController.swift
//  Week4Assignment
//
//  Created by WaiYanPhyo Hein on 10/22/18.
//  Copyright © 2018 WaiYanPhyo Hein. All rights reserved.
//

import UIKit
import AVFoundation
class CameraViewController: UIViewController {

    var captureSession = AVCaptureSession();
    var backCamera : AVCaptureDevice?
    var frontCamera : AVCaptureDevice?
    var currentCamera : AVCaptureDevice?
    
    var photoOut : AVCapturePhotoOutput?
    
    var cameraPreviewLayers : AVCaptureVideoPreviewLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCaptureSession();
        setupDevice();
        setupInputOutput();
        setupPreviewLayout();
        startRunningCaptureSession();

        // Do any additional setup after loading the view.
    }
    func setupCaptureSession(){
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
    }
    
    @IBAction func cameraAction(_ sender: Any) {
        performSegue(withIdentifier: "showPhotoSegue", sender: nil)
    }
    
    func setupDevice(){
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [AVCaptureDevice.DeviceType.builtInWideAngleCamera]
            , mediaType: AVMediaType.video
            , position: AVCaptureDevice.Position.unspecified)
        let devices = deviceDiscoverySession.devices
        for device in devices{
            if device.position == AVCaptureDevice.Position.back{
                backCamera = device;
            }
            else if device.position == AVCaptureDevice.Position.front{
                frontCamera = device;
            }
        }
        currentCamera = backCamera;
    }
    
    func setupInputOutput(){
        do{
            let captureDeviceInput = try AVCaptureDeviceInput(device: currentCamera!);
            captureSession.addInput(captureDeviceInput);
            photoOut?.setPreparedPhotoSettingsArray([AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])], completionHandler:  nil)
                    
            
        }
        catch
        {
            print(error);
        }
    }
    func setupPreviewLayout(){
        cameraPreviewLayers = AVCaptureVideoPreviewLayer(session: captureSession);
        cameraPreviewLayers?.videoGravity = AVLayerVideoGravity.resizeAspectFill;
        cameraPreviewLayers?.connection?.videoOrientation = AVCaptureVideoOrientation.portrait;
        cameraPreviewLayers?.frame = self.view.frame
        self.view.layer.insertSublayer(cameraPreviewLayers!, at: 0)
    }
    func startRunningCaptureSession(){
        captureSession.startRunning();
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
