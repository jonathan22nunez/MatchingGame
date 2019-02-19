//
//  VC_Extension.swift
//  NunezJonathan_AdaptiveLayout
//
//  Created by Jonathan Nunez on 1/17/19.
//  Copyright © 2019 Jonathan Nunez. All rights reserved.
//

import Foundation
import UIKit

extension ViewController {
    // Create and assign gestures to each image view in the gameview
    func assignGestures() {
        // Column 1 Gestures
        let r1c1Gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapGesture(_:)))
        r1c1.addGestureRecognizer(r1c1Gesture)
        let r2c1Gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapGesture(_:)))
        r2c1.addGestureRecognizer(r2c1Gesture)
        let r3c1Gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapGesture(_:)))
        r3c1.addGestureRecognizer(r3c1Gesture)
        let r4c1Gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapGesture(_:)))
        r4c1.addGestureRecognizer(r4c1Gesture)
        let r5c1Gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapGesture(_:)))
        r5c1.addGestureRecognizer(r5c1Gesture)
        let r6c1Gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapGesture(_:)))
        r6c1.addGestureRecognizer(r6c1Gesture)
        // Column 2 Gestures
        let r1c2Gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapGesture(_:)))
        r1c2.addGestureRecognizer(r1c2Gesture)
        let r2c2Gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapGesture(_:)))
        r2c2.addGestureRecognizer(r2c2Gesture)
        let r3c2Gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapGesture(_:)))
        r3c2.addGestureRecognizer(r3c2Gesture)
        let r4c2Gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapGesture(_:)))
        r4c2.addGestureRecognizer(r4c2Gesture)
        let r5c2Gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapGesture(_:)))
        r5c2.addGestureRecognizer(r5c2Gesture)
        let r6c2Gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapGesture(_:)))
        r6c2.addGestureRecognizer(r6c2Gesture)
        // Column 3 Gestures
        let r1c3Gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapGesture(_:)))
        r1c3.addGestureRecognizer(r1c3Gesture)
        let r2c3Gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapGesture(_:)))
        r2c3.addGestureRecognizer(r2c3Gesture)
        let r3c3Gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapGesture(_:)))
        r3c3.addGestureRecognizer(r3c3Gesture)
        let r4c3Gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapGesture(_:)))
        r4c3.addGestureRecognizer(r4c3Gesture)
        let r5c3Gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapGesture(_:)))
        r5c3.addGestureRecognizer(r5c3Gesture)
        let r6c3Gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapGesture(_:)))
        r6c3.addGestureRecognizer(r6c3Gesture)
        // Column 4 Gestures
        let r1c4Gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapGesture(_:)))
        r1c4.addGestureRecognizer(r1c4Gesture)
        let r2c4Gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapGesture(_:)))
        r2c4.addGestureRecognizer(r2c4Gesture)
        let r3c4Gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapGesture(_:)))
        r3c4.addGestureRecognizer(r3c4Gesture)
        let r4c4Gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapGesture(_:)))
        r4c4.addGestureRecognizer(r4c4Gesture)
        let r5c4Gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapGesture(_:)))
        r5c4.addGestureRecognizer(r5c4Gesture)
        let r6c4Gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapGesture(_:)))
        r6c4.addGestureRecognizer(r6c4Gesture)
        // Column 5 Gestures
        let r1c5Gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapGesture(_:)))
        r1c5.addGestureRecognizer(r1c5Gesture)
        let r2c5Gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapGesture(_:)))
        r2c5.addGestureRecognizer(r2c5Gesture)
        let r3c5Gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapGesture(_:)))
        r3c5.addGestureRecognizer(r3c5Gesture)
        let r4c5Gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapGesture(_:)))
        r4c5.addGestureRecognizer(r4c5Gesture)
        let r5c5Gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapGesture(_:)))
        r5c5.addGestureRecognizer(r5c5Gesture)
        let r6c5Gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapGesture(_:)))
        r6c5.addGestureRecognizer(r6c5Gesture)



    }
    
    // Method to handle tap gesture calling
    @objc func tapGesture(_ sender: UITapGestureRecognizer) {
        
        // Use switch to minimize overhead of method calls
        // Each case will add the image view, it's corresponding image and tap gesture to be compared/matched
        switch sender.view?.tag {
            // Column 1 Cases
        case 0:
            addToCompare(imageView: r1c1, image: imageViewImage[r1c1]!, tapGesture: sender)
        case 1:
            addToCompare(imageView: r2c1, image: imageViewImage[r2c1]!, tapGesture: sender)
        case 2:
            addToCompare(imageView: r3c1, image: imageViewImage[r3c1]!, tapGesture: sender)
        case 3:
            addToCompare(imageView: r4c1, image: imageViewImage[r4c1]!, tapGesture: sender)
        case 4:
            addToCompare(imageView: r5c1, image: imageViewImage[r5c1]!, tapGesture: sender)
        case 5:
            addToCompare(imageView: r6c1, image: imageViewImage[r6c1]!, tapGesture: sender)
            // Column 2 Cases
        case 6:
            addToCompare(imageView: r1c2, image: imageViewImage[r1c2]!, tapGesture: sender)
        case 7:
            addToCompare(imageView: r2c2, image: imageViewImage[r2c2]!, tapGesture: sender)
        case 8:
            addToCompare(imageView: r3c2, image: imageViewImage[r3c2]!, tapGesture: sender)
        case 9:
            addToCompare(imageView: r4c2, image: imageViewImage[r4c2]!, tapGesture: sender)
        case 10:
            addToCompare(imageView: r5c2, image: imageViewImage[r5c2]!, tapGesture: sender)
        case 11:
            addToCompare(imageView: r6c2, image: imageViewImage[r6c2]!, tapGesture: sender)
            // Column 3 Cases
        case 12:
            addToCompare(imageView: r1c3, image: imageViewImage[r1c3]!, tapGesture: sender)
        case 13:
            addToCompare(imageView: r2c3, image: imageViewImage[r2c3]!, tapGesture: sender)
        case 14:
            addToCompare(imageView: r3c3, image: imageViewImage[r3c3]!, tapGesture: sender)
        case 15:
            addToCompare(imageView: r4c3, image: imageViewImage[r4c3]!, tapGesture: sender)
        case 16:
            addToCompare(imageView: r5c3, image: imageViewImage[r5c3]!, tapGesture: sender)
        case 17:
            addToCompare(imageView: r6c3, image: imageViewImage[r6c3]!, tapGesture: sender)
            // Column 4 Cases
        case 18:
            addToCompare(imageView: r1c4, image: imageViewImage[r1c4]!, tapGesture: sender)
        case 19:
            addToCompare(imageView: r2c4, image: imageViewImage[r2c4]!, tapGesture: sender)
        case 20:
            addToCompare(imageView: r3c4, image: imageViewImage[r3c4]!, tapGesture: sender)
        case 21:
            addToCompare(imageView: r4c4, image: imageViewImage[r4c4]!, tapGesture: sender)
        case 22:
            addToCompare(imageView: r5c4, image: imageViewImage[r5c4]!, tapGesture: sender)
        case 23:
            addToCompare(imageView: r6c4, image: imageViewImage[r6c4]!, tapGesture: sender)
            // Column 5 Cases
        case 24:
            addToCompare(imageView: r1c5, image: imageViewImage[r1c5]!, tapGesture: sender)
        case 25:
            addToCompare(imageView: r2c5, image: imageViewImage[r2c5]!, tapGesture: sender)
        case 26:
            addToCompare(imageView: r3c5, image: imageViewImage[r3c5]!, tapGesture: sender)
        case 27:
            addToCompare(imageView: r4c5, image: imageViewImage[r4c5]!, tapGesture: sender)
        case 28:
            addToCompare(imageView: r5c5, image: imageViewImage[r5c5]!, tapGesture: sender)
        case 29:
            addToCompare(imageView: r6c5, image: imageViewImage[r6c5]!, tapGesture: sender)
        default:
            return
        }
    }
    
    // Method to reset image views
    func resetImageViews() {
        // Unhide all image views to become playable again
        // Column 1
        r1c1.isHidden = false
        r2c1.isHidden = false
        r3c1.isHidden = false
        r4c1.isHidden = false
        r5c1.isHidden = false
        r6c1.isHidden = false
        // Column 2
        r1c2.isHidden = false
        r2c2.isHidden = false
        r3c2.isHidden = false
        r4c2.isHidden = false
        r5c2.isHidden = false
        r6c2.isHidden = false
        // Column 3
        r1c3.isHidden = false
        r2c3.isHidden = false
        r3c3.isHidden = false
        r4c3.isHidden = false
        r5c3.isHidden = false
        r6c3.isHidden = false
        // Column 4
        r1c4.isHidden = false
        r2c4.isHidden = false
        r3c4.isHidden = false
        r4c4.isHidden = false
        r5c4.isHidden = false
        r6c4.isHidden = false
        // Column 5
        r1c5.isHidden = false
        r2c5.isHidden = false
        r3c5.isHidden = false
        r4c5.isHidden = false
        r5c5.isHidden = false
        r6c5.isHidden = false
    }
    
    func disableImageViews() {
        // Column 1
        r1c1.isUserInteractionEnabled = false
        r2c1.isUserInteractionEnabled = false
        r3c1.isUserInteractionEnabled = false
        r4c1.isUserInteractionEnabled = false
        r5c1.isUserInteractionEnabled = false
        r6c1.isUserInteractionEnabled = false
        // Column 2
        r1c2.isUserInteractionEnabled = false
        r2c2.isUserInteractionEnabled = false
        r3c2.isUserInteractionEnabled = false
        r4c2.isUserInteractionEnabled = false
        r5c2.isUserInteractionEnabled = false
        r6c2.isUserInteractionEnabled = false
        // Column 3
        r1c3.isUserInteractionEnabled = false
        r2c3.isUserInteractionEnabled = false
        r3c3.isUserInteractionEnabled = false
        r4c3.isUserInteractionEnabled = false
        r5c3.isUserInteractionEnabled = false
        r6c3.isUserInteractionEnabled = false
        // Column 4
        r1c4.isUserInteractionEnabled = false
        r2c4.isUserInteractionEnabled = false
        r3c4.isUserInteractionEnabled = false
        r4c4.isUserInteractionEnabled = false
        r5c4.isUserInteractionEnabled = false
        r6c4.isUserInteractionEnabled = false
        // Column 5
        r1c5.isUserInteractionEnabled = false
        r2c5.isUserInteractionEnabled = false
        r3c5.isUserInteractionEnabled = false
        r4c5.isUserInteractionEnabled = false
        r5c5.isUserInteractionEnabled = false
        r6c5.isUserInteractionEnabled = false
    }
    
    func enableImageViews() {
        // Column 1
        r1c1.isUserInteractionEnabled = true
        r2c1.isUserInteractionEnabled = true
        r3c1.isUserInteractionEnabled = true
        r4c1.isUserInteractionEnabled = true
        r5c1.isUserInteractionEnabled = true
        r6c1.isUserInteractionEnabled = true
        // Column 2
        r1c2.isUserInteractionEnabled = true
        r2c2.isUserInteractionEnabled = true
        r3c2.isUserInteractionEnabled = true
        r4c2.isUserInteractionEnabled = true
        r5c2.isUserInteractionEnabled = true
        r6c2.isUserInteractionEnabled = true
        // Column 3
        r1c3.isUserInteractionEnabled = true
        r2c3.isUserInteractionEnabled = true
        r3c3.isUserInteractionEnabled = true
        r4c3.isUserInteractionEnabled = true
        r5c3.isUserInteractionEnabled = true
        r6c3.isUserInteractionEnabled = true
        // Column 4
        r1c4.isUserInteractionEnabled = true
        r2c4.isUserInteractionEnabled = true
        r3c4.isUserInteractionEnabled = true
        r4c4.isUserInteractionEnabled = true
        r5c4.isUserInteractionEnabled = true
        r6c4.isUserInteractionEnabled = true
        // Column 5
        r1c5.isUserInteractionEnabled = true
        r2c5.isUserInteractionEnabled = true
        r3c5.isUserInteractionEnabled = true
        r4c5.isUserInteractionEnabled = true
        r5c5.isUserInteractionEnabled = true
        r6c5.isUserInteractionEnabled = true
    }
}
