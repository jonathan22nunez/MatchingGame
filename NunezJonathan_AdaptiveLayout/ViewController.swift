//
//  ViewController.swift
//  NunezJonathan_AdaptiveLayout
//
//  Created by Jonathan Nunez on 1/15/19.
//  Copyright © 2019 Jonathan Nunez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Preparations
    // Column 1
    //@IBOutlet weak var r1c1: UIView!
    @IBOutlet weak var r1c1: UIImageView!
    @IBOutlet weak var r2c1: UIImageView!
    @IBOutlet weak var r3c1: UIImageView!
    @IBOutlet weak var r4c1: UIImageView!
    @IBOutlet weak var r5c1: UIImageView!
    @IBOutlet weak var r6c1: UIImageView!
    // Column 2
    @IBOutlet weak var r1c2: UIImageView!
    @IBOutlet weak var r2c2: UIImageView!
    @IBOutlet weak var r3c2: UIImageView!
    @IBOutlet weak var r4c2: UIImageView!
    @IBOutlet weak var r5c2: UIImageView!
    @IBOutlet weak var r6c2: UIImageView!
    // Column 3
    @IBOutlet weak var r1c3: UIImageView!
    @IBOutlet weak var r2c3: UIImageView!
    @IBOutlet weak var r3c3: UIImageView!
    @IBOutlet weak var r4c3: UIImageView!
    @IBOutlet weak var r5c3: UIImageView!
    @IBOutlet weak var r6c3: UIImageView!
    // Column 4
    @IBOutlet weak var r1c4: UIImageView!
    @IBOutlet weak var r2c4: UIImageView!
    @IBOutlet weak var r3c4: UIImageView!
    @IBOutlet weak var r4c4: UIImageView!
    @IBOutlet weak var r5c4: UIImageView!
    @IBOutlet weak var r6c4: UIImageView!
    // Column 5
    @IBOutlet weak var r1c5: UIImageView!
    @IBOutlet weak var r2c5: UIImageView!
    @IBOutlet weak var r3c5: UIImageView!
    @IBOutlet weak var r4c5: UIImageView!
    @IBOutlet weak var r5c5: UIImageView!
    @IBOutlet weak var r6c5: UIImageView!
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var movesCounterLabel: UILabel!
    @IBOutlet weak var pauseGameButton: UIBarButtonItem!
    
    // Global Variables
    var seconds = 0
    var timer: Timer?
    var matchCounter = 0
    var movesCounter = 0
    var imageToMatch1: (UIImageView, UIImage, UITapGestureRecognizer)?
    var imageToMatch2: (UIImageView, UIImage, UITapGestureRecognizer)?
    var imageViewImage = [UIImageView: UIImage]()
    var isPaused = false
    
    // Constraints
    @IBOutlet weak var imageViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var gameView: UIView!
    
    /* In viewDidLoad method */
//    Set playButton title to "Play"
//    Disable 'Pause" button interaction
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playButton.setTitle("Play", for: .normal)
        pauseGameButton.isEnabled = false
    }
    
    /* Method to handle playButton tap */
//    Assign gestures to ImageViews
//    Disable playButton and set title to timer "00:00"
//    Create an empty images array and imageView array
//    Detect the type of device
//      Set image array containing pairs of 10 images - for iPhone
//      Set image array containing pairs of 15 images - for iPad
//      Set the correct imageViews per device type
//    Set matchCounter to number of unique images
//    Assign all images to random imageViews
//    Show player the full board before hiding images
//      Begin timer
//      Enable the 'Pause' button
    @IBAction func playButton(_ sender: UIButton) {
        assignGestures()
        
        playButton.isEnabled = false
        playButton.setTitle("00:00", for: .normal)

        var imageArray = [UIImage]()
        var imageViewArray = [UIImageView]()
        
        switch UIDevice.current.localizedModel {
        case "iPhone":
            imageArray = [#imageLiteral(resourceName: "CasinoPartyOn"), #imageLiteral(resourceName: "ChessWhiteHorse"), #imageLiteral(resourceName: "CasinoDice"), #imageLiteral(resourceName: "CancelButton"), #imageLiteral(resourceName: "FacebookButton"), #imageLiteral(resourceName: "CasinoToken"), #imageLiteral(resourceName: "DoButton"), #imageLiteral(resourceName: "FeedButton"), #imageLiteral(resourceName: "SkipButton"), #imageLiteral(resourceName: "ShareButton"), #imageLiteral(resourceName: "CasinoPartyOn"), #imageLiteral(resourceName: "ChessWhiteHorse"), #imageLiteral(resourceName: "CasinoDice"), #imageLiteral(resourceName: "CancelButton"), #imageLiteral(resourceName: "FacebookButton"), #imageLiteral(resourceName: "CasinoToken"), #imageLiteral(resourceName: "DoButton"), #imageLiteral(resourceName: "FeedButton"), #imageLiteral(resourceName: "SkipButton"), #imageLiteral(resourceName: "ShareButton")]
            imageViewArray = [self.r1c1, self.r2c1, self.r3c1, self.r4c1, self.r5c1, self.r1c2, self.r2c2, self.r3c2, self.r4c2, self.r5c2, self.r1c3, self.r2c3, self.r3c3, self.r4c3, self.r5c3, self.r1c4, self.r2c4, self.r3c4, self.r4c4, self.r5c4]
        case "iPad":
            imageArray = [#imageLiteral(resourceName: "CasinoPartyOn"), #imageLiteral(resourceName: "ChessWhiteHorse"), #imageLiteral(resourceName: "CasinoDice"), #imageLiteral(resourceName: "CancelButton"), #imageLiteral(resourceName: "FacebookButton"), #imageLiteral(resourceName: "CasinoToken"), #imageLiteral(resourceName: "DoButton"), #imageLiteral(resourceName: "FeedButton"), #imageLiteral(resourceName: "SkipButton"), #imageLiteral(resourceName: "ShareButton"), #imageLiteral(resourceName: "UpgradeButton"), #imageLiteral(resourceName: "ChessBlackPawn"), #imageLiteral(resourceName: "RemoveButton"), #imageLiteral(resourceName: "AddButton"), #imageLiteral(resourceName: "CasinoHorseShoe"), #imageLiteral(resourceName: "CasinoPartyOn"), #imageLiteral(resourceName: "ChessWhiteHorse"), #imageLiteral(resourceName: "CasinoDice"), #imageLiteral(resourceName: "CancelButton"), #imageLiteral(resourceName: "FacebookButton"), #imageLiteral(resourceName: "CasinoToken"), #imageLiteral(resourceName: "DoButton"), #imageLiteral(resourceName: "FeedButton"), #imageLiteral(resourceName: "SkipButton"), #imageLiteral(resourceName: "ShareButton"), #imageLiteral(resourceName: "UpgradeButton"), #imageLiteral(resourceName: "ChessBlackPawn"), #imageLiteral(resourceName: "RemoveButton"), #imageLiteral(resourceName: "AddButton"), #imageLiteral(resourceName: "CasinoHorseShoe")]
            imageViewArray = [self.r1c1, self.r2c1, self.r3c1, self.r4c1, self.r5c1, self.r6c1, self.r1c2, self.r2c2, self.r3c2, self.r4c2, self.r5c2, self.r6c2, self.r1c3, self.r2c3, self.r3c3, self.r4c3, self.r5c3, self.r6c3, self.r1c4, self.r2c4, self.r3c4, self.r4c4, self.r5c4, self.r6c4, self.r1c5, self.r2c5, self.r3c5, self.r4c5, self.r5c5, self.r6c5]
        default:
            return
        }

        matchCounter = imageArray.count / 2
        
        self.assignImages(imageViewsArray: imageViewArray, imagesArray: imageArray)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            for imageView in imageViewArray {
                imageView.image = nil
            }
            self.runTimer()

            self.pauseGameButton.isEnabled = true
        }
    }
    
    /* Method to run the timer */
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    /* Method to update the timerLabel based on the seconds passed */
    @objc func updateTimer() {
        seconds += 1
        playButton.setTitle(timeString(time: TimeInterval(seconds)), for: .normal)
    }
    
    /* Method to convert seconds to "00:00" time format */
    func timeString(time: TimeInterval) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
    
    /* Method to randomly assign images to imageViews */
//    Pass array of images to var
//    For-in loop to assign images to imageViews
//      Create random number based on images available
//      Assign image to random imageView
//      Add image and imageView pair to dictionary array
//      Remove image as to not repeat assignments
    func assignImages(imageViewsArray ivArray: [UIImageView], imagesArray images: [UIImage]) {
        var imagesToUse = images
        
        for imageView in ivArray {
            let randomNumber = Int.random(in: 0...imagesToUse.count-1)
            
            imageView.image = imagesToUse[randomNumber]
            
            imageViewImage[imageView] = imagesToUse[randomNumber]
            
            imagesToUse.remove(at: randomNumber)
        }
    }
    
    /* Method to being matching process of images */
//    Increment number of moves made
//    if first image slot is free to use, then assigne the imageView/image/gesture
//      Assign imageView to the image - "reveal" the image
//      Disable the gesture to prevent repeat touches
//    else assign the second image slot the imageView/image/gesture
//      Assign imageView to the image - "reveal" the image
//      Disable the gesture to prevent repeat touches
//      Disable all other imageViews from being touched
//      Brief pause to show player both images being compared
//      Call compareImages() method
    func addToCompare(imageView: UIImageView, image: UIImage, tapGesture: UITapGestureRecognizer) {
        movesCounter += 1
        movesCounterLabel.text = movesCounter.description
        
        if imageToMatch1 == nil {
            imageView.image = image
            
            tapGesture.isEnabled = false
            imageToMatch1 = (imageView, image, tapGesture)
        }
        else {
            imageView.image = image
            
            tapGesture.isEnabled = false
            imageToMatch2 = (imageView, image, tapGesture)
            
            disableImageViews()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.compareImages()
            }
        }
    }
    
    /* Method to match and compare images selected */
//    if there is a match
//      Remove the images from the imageViews
//      Hide the imageViews
//      Reset the first and second image slots for comparing
//      Decrement the matchCounter
//      if matchCounter reaches '0', game won!
//          Stop timer and set to 'nil'
//          Perform segue to ScoreViewController
//    else no match
//      Remove the images from the imageViews
//      Enabled the gestures
//      Reset the first and second image slots for comparing
//    Enable all imageViews
    func compareImages() {
        if imageToMatch1!.1 == imageToMatch2!.1 {
            imageToMatch1!.0.image = nil
            imageToMatch1!.0.isHidden = true
            imageToMatch2!.0.image = nil
            imageToMatch2!.0.isHidden = true
            
            imageToMatch1 = nil
            imageToMatch2 = nil
            
            matchCounter -= 1
            
            if matchCounter == 0 {
                timer!.invalidate()
                timer = nil
                
                performSegue(withIdentifier: "toScore", sender: self)
            }
        }
        else {
            imageToMatch1!.0.image = nil
            imageToMatch2!.0.image = nil
            imageToMatch1!.2.isEnabled = true
            imageToMatch2!.2.isEnabled = true
            
            imageToMatch1 = nil
            imageToMatch2 = nil
        }
        
        enableImageViews()
    }
    
    /* Segue to ScoreViewController */
//    Pass totalMoves and totalTime
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ScoreViewController {
            destination.totalMoves = movesCounter
            destination.totalTime = seconds
        }
    }
    
    /* Unwind method */
//    Reset seconds, matchCounter, movesCounter, and movesCounterLabel
//    Reset playButton title to "Play" and enable for touch
//    Reset all imageViews
//    Disable 'Pause' button
    @IBAction func unwindToRoot(_ segue: UIStoryboardSegue) {
        if segue.source is ScoreViewController {
            seconds = 0
            matchCounter = 0
            movesCounter = 0
            movesCounterLabel.text = "00"
            
            playButton.setTitle("Play", for: .normal)
            playButton.isEnabled = true
            
            resetImageViews()
            
            pauseGameButton.isEnabled = false
        }
    }
    
    /* pauseGameButton tap*/
//    if game is not paused
//      Set pauseGameButton title to "Resume"
//      pauseGame()
//    else if game is paused
//      Set pauseGameButton title to "Pause"
//      resumeGame()
    @IBAction func pauseGameTapped(_ sender: UIBarButtonItem) {
        if isPaused == false {
            pauseGameButton.title = "Resume"
            
            pauseGame()
        }
        else if isPaused == true {
            pauseGameButton.title = "Pause"
            
            resumeGame()
        }
    }
    
    /* Method to pause game */
//    Set pause value to 'true', disable timer, and disableImageViews()
    func pauseGame() {
        isPaused = true
        timer?.invalidate()
        disableImageViews()
    }
    
    /* Method to resume game */
//    Set pause value to 'false', recreate timer, and enableImageViews()
    func resumeGame() {
        isPaused = false
        self.runTimer()
        enableImageViews()
    }
    
}

