//
//  CameraView.swift
//  Smartify
//
//  Created by Margarita Mayer on 15/11/23.
//

import UIKit
import AVFoundation
import Vision

protocol ScannerViewControllerDelegate: AnyObject {
    func didCaptureImage(_ image: UIImage)
}

class ScannerViewController: UIViewController, AVCapturePhotoCaptureDelegate, AVCaptureMetadataOutputObjectsDelegate {
   
    weak var delegate: ScannerViewControllerDelegate?
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    lazy var classificationRequest: VNCoreMLRequest = {
        do {
            let model = try VNCoreMLModel(for: ArtworksClassifier().model)
            
            let request = VNCoreMLRequest(model: model) { [weak self] request, error in
                self?.processClassifications(for: request, error: error)
            }
            
            request.imageCropAndScaleOption = .centerCrop
            
            return request
        } catch {
            fatalError("Failed to load Core ML model: \(error)")
        }
    }()
    
    init(delegate: ScannerViewControllerDelegate) {
        super.init(nibName: nil, bundle: nil)
        self.delegate = delegate
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCamera()
    }
    
    func setupCamera() {
        captureSession = AVCaptureSession()
        
        guard let backCamera = AVCaptureDevice.default(for: .video) else {
            print("Unable to access the camera.")
            return
        }
        
        do {
            let input = try AVCaptureDeviceInput(device: backCamera)
            if (captureSession.canAddInput(input)) {
                captureSession.addInput(input)
            }
        } catch let error {
            print("Error setting up camera input: \(error.localizedDescription)")
        }
        
        let photoOutput = AVCapturePhotoOutput()
        if (captureSession.canAddOutput(photoOutput)) {
            captureSession.addOutput(photoOutput)
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.frame = view.layer.bounds
        view.layer.addSublayer(previewLayer)
        
        Task {
            captureSession.startRunning()
        }
        
        // Add metadata output for scanning codes
        let metadataOutput = AVCaptureMetadataOutput()
        if (captureSession.canAddOutput(metadataOutput)) {
            captureSession.addOutput(metadataOutput)
            
            // Set the metadata types you want to scan (e.g., QR codes)
            metadataOutput.metadataObjectTypes = [.qr]
            
            metadataOutput.setMetadataObjectsDelegate((delegate as! AVCaptureMetadataOutputObjectsDelegate), queue: DispatchQueue.main)
        }
    }
    
    @IBAction func captureButtonTapped(_ sender: UIButton) {
        guard let photoOutput = captureSession.outputs.first as? AVCapturePhotoOutput else {
            return
        }
        
        let photoSettings = AVCapturePhotoSettings()
        photoOutput.capturePhoto(with: photoSettings, delegate: self)
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let error = error {
            print("Error capturing photo: \(error.localizedDescription)")
            return
        }
        
        guard let imageData = photo.fileDataRepresentation() else {
            print("No image data captured.")
            return
        }
        
        // Handle the captured image data here
        let capturedImage = UIImage(data: imageData)
        
        // You can now pass this image for further processing or display it in your result view
        delegate?.didCaptureImage(capturedImage ?? UIImage())
        
        // Perform image recognition using Vision and Core ML
        recognizeArtwork(image: capturedImage)
    }
    
    func recognizeArtwork(image: UIImage?) {
        guard let image = image, let cgImage = image.cgImage else {
            print("Error: Unable to get CGImage from captured image.")
            return
        }
        
        // Create a Vision image request handler
        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        
        do {
            // Perform the image recognition request
            try handler.perform([classificationRequest])
        } catch {
            print("Error performing image recognition: \(error)")
        }
    }
    
    func processClassifications(for request: VNRequest, error: Error?) {
        if let error = error {
            print("Error during classification: \(error.localizedDescription)")
            return
        }
        
        guard let results = request.results else {
            print("Unable to classify image.")
            return
        }
        
        // Process the classification results (results is an array of VNClassificationObservation)
        if let topResult = results.first as? VNClassificationObservation {
            print("Predicted Identifier: \(topResult.identifier), Confidence: \(topResult.confidence)")
            
            // Here you can handle the recognition results and take appropriate actions
            // For example, update the UI, show a message, etc.
        }
    }
}


//#Preview {
//    CameraView()
//}
