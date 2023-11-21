//
//  ScanningView.swift
//  Smartify
//
//  Created by Margarita Mayer on 16/11/23.
//

import SwiftUI
import AVFoundation

struct ScanningView: UIViewControllerRepresentable {
    var didScanCode: (String) -> Void

    class Coordinator: NSObject, AVCaptureMetadataOutputObjectsDelegate, ScannerViewControllerDelegate {
        
        var parent: ScanningView

        init(parent: ScanningView) {
            self.parent = parent
        }

        func didCaptureImage(_ image: UIImage) {
            // You can perform any additional processing with the captured image if needed
        }

        func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
            // Handle barcode or QR code scanning here
            // Extract the scanned value and pass it to the parent
        }
    }

    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = ScannerViewController(delegate: context.coordinator)
        let coordinator = context.coordinator
        viewController.delegate = coordinator
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
}
