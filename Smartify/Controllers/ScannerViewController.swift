//
//  CameraView.swift
//  Smartify
//
//  Created by Margarita Mayer on 15/11/23.
//

import SwiftUI
import AVFoundation
import Vision

struct ScannerViewController: UIViewControllerRepresentable {
    
    @Binding var prediction: String
    @Binding var isRecognised: Bool
    
    
    class Coordinator: NSObject, AVCaptureVideoDataOutputSampleBufferDelegate {
        var parent: ScannerViewController
        
        init(parent: ScannerViewController) {
            self.parent = parent
        }
        
        func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
            guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
            parent.analyzeFrame(pixelBuffer: pixelBuffer)
        }
    }
    
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        let captureSession = AVCaptureSession()
        
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return viewController }
        let videoInput: AVCaptureDeviceInput
        
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return viewController
        }
        
        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            return viewController
        }
        
        let videoOutput = AVCaptureVideoDataOutput()
        videoOutput.setSampleBufferDelegate(context.coordinator, queue: DispatchQueue(label: "videoQueue"))
        captureSession.addOutput(videoOutput)
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = viewController.view.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        viewController.view.layer.addSublayer(previewLayer)
        
      
        DispatchQueue.global(qos: .userInitiated).async {
            captureSession.startRunning()
        }
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
    
    mutating func analyzeFrame(pixelBuffer: CVPixelBuffer) {
        // Throttle the classification
        let currentTime = CFAbsoluteTimeGetCurrent()
        if currentTime - lastClassificationTime < classificationInterval {
            return
        }
        lastClassificationTime = currentTime
        
        // Use Vision framework to make predictions using your Core ML model
        guard let model = try? VNCoreMLModel(for: ArtworksClassifier().model) else {
            return
        }
        
        let request = VNCoreMLRequest(model: model) { [self] (finishedReq, err) in
            guard let results = finishedReq.results as? [VNClassificationObservation], let topResult = results.first else {
                return
            }
            
           
            if topResult.confidence >= 0.80 {
                self.prediction = topResult.identifier
            }
            
            if self.prediction != "Others" {
                isRecognised = true
            }
//            if self.prediction == "Others" {
//                isRecognised = false
//            }
        }
        
        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
    }
    
    
    var lastClassificationTime: CFAbsoluteTime = 0
    let classificationInterval: CFAbsoluteTime = 1.0  // Time in seconds
}

