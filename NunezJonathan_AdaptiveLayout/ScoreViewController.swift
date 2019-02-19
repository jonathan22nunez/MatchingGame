//
//  ScoreViewController.swift
//  NunezJonathan_AdaptiveLayout
//
//  Created by Jonathan Nunez on 1/19/19.
//  Copyright © 2019 Jonathan Nunez. All rights reserved.
//

import UIKit
import CoreData

class ScoreViewController: UIViewController {
    
    //MARK: Preparations
    @IBOutlet weak var totalMovesLabel: UILabel!
    @IBOutlet weak var totalTimeLabel: UILabel!
    @IBOutlet weak var bestTimeLabel: UILabel!
    @IBOutlet weak var newHighscoreLabel: UILabel!
    
    // Global Variables
    var scoreHolders = [ScoreHolder]()
    var currentPlayer: ScoreHolder!
    var totalMoves: Int?
    var totalTime: Int?
    let defaults = UserDefaults.standard
    
    // Core Data variables
    private var managedContext: NSManagedObjectContext!
    private var entityDescription: NSEntityDescription!
    private var leaderboardObj: NSManagedObject!

    /* In viewDidLoad() */
//    Set CoreData variables
//    Hide navigation BackButton
//    Create leftBarButtonItem as "Save Highscore"
//    Set navBar title to "Score"
//    Create rightBarButtonItem as "Leaderboard"
//    Assign results from game to scoreboard labels
//    loadCoreData()
//    if-else to decide if game results are better than CoreData saved highscore results
//      assign the bestTimeLabel accordingly
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedContext = appDelegate.persistentContainer.viewContext
        entityDescription = NSEntityDescription.entity(forEntityName: "Leaderboard", in: managedContext)
        
        navigationItem.hidesBackButton = true
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Save Highscore", style: .plain, target: self, action: #selector(ScoreViewController.saveHighscore(_:)))
        
        navigationItem.title = "Score"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Leaderboard", style: .plain, target: self, action: #selector(ScoreViewController.toLeaderboard(_:)))
        
        totalMovesLabel.text = totalMoves?.description
        totalTimeLabel.text = timeString(time: TimeInterval(totalTime!))

        loadFromCoreData()
        
        if scoreHolders.isEmpty != true {
            if totalTime! < (scoreHolders.first?.totalTime)! {
                newHighscoreLabel.isHidden = false
                bestTimeLabel.text = timeString(time: TimeInterval(totalTime!))
            }
            else {
                bestTimeLabel.text = scoreHolders.first?.totalTimeFormatted
            }
        }
        else {
            newHighscoreLabel.isHidden = false
            bestTimeLabel.text = timeString(time: TimeInterval(totalTime!))
        }
    }
    
    /* Method to convert seconds to "00:00" */
    func timeString(time: TimeInterval) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
    
    /* Method to save highscore */
//    if there are saved highscore holders, determine where to place new highscore by index
//    else assign new highscore to top of list
    @objc func saveHighscore(_ sender: UIBarButtonItem) {
        if scoreHolders.isEmpty != true, let hasIndex = compareCurrentPlayerToLeaderboard() {
            addCurrentPlayerToLeaderboard(index: hasIndex)
        }
        else if scoreHolders.isEmpty == true {
            addCurrentPlayerToLeaderboard(index: 0)
        }
    }
    
    /* Leaderboard button tapped */
//    if currentPlayer is 'nil' (not saved yet) then show an alert encouraging player to save their highscore
//      Player is able to assign their intials to the score for tracking
//      Proceed to LeaderBoardViewController on 'Continue'
//    else if the the player's score has been saved then allow to proceed to LeaderBoardViewController
    @objc func toLeaderboard(_ sender: UIBarButtonItem) {
        if currentPlayer == nil {
            let unsavedHighscoreAlert = UIAlertController(title: "Attention", message: "Look's like you haven't saved your highscore!", preferredStyle: .alert)
            unsavedHighscoreAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            unsavedHighscoreAlert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { (alert) in
                self.performSegue(withIdentifier: "toLeaderboard", sender: self)
            }))
            self.present(unsavedHighscoreAlert, animated: true, completion: nil)
        }
        else {
            performSegue(withIdentifier: "toLeaderboard", sender: self)
        }
    }
    
    /* Segue to LeaderBoardViewController */
//    Pass currentPlayer and list of all highscores
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? LeaderBoardViewController {
            destination.currentPlayer = self.currentPlayer
            destination.scoreHolders = self.scoreHolders
        }
    }
    
    /* Method to save CoreData */
//    Gather ScoreHolder object values and place into corresponding CoreData keys
//    try .save()
    func saveToCoreData() {
        leaderboardObj.setValue(currentPlayer.initials, forKey: "initials")
        leaderboardObj.setValue(currentPlayer.totalMoves, forKey: "totalMoves")
        leaderboardObj.setValue(currentPlayer.totalTime, forKey: "totalTime")
        leaderboardObj.setValue(currentPlayer.timeStamp, forKey: "timeStamp")
        do {
            try managedContext.save()
        }
        catch {
            assertionFailure()
        }
    }
    
    /* Method to load CoreData */
//    Assign request an entityName
//    let-try fetch request
//      Create ScoreHolder objects from retrieved NSManagedObjects
//      Assign new ScoreHolder objects to scoreHolders[]
//      sortScoreHoldersByTotalTime()
//    Create a new NSManagedObject for currentPlayer use
    func loadFromCoreData() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Leaderboard")
        
        do {
            let result = try managedContext.fetch(request) as! [NSManagedObject]
            
            for data in result {
                let newScoreHolder = ScoreHolder(initials: data.value(forKey: "initials") as! String, totalMoves: data.value(forKey: "totalMoves") as! Int, totalTime: data.value(forKey: "totalTime") as! Int, timeStamp: data.value(forKey: "timeStamp") as! Double)
                scoreHolders.append(newScoreHolder)
            }
            
            sortScoreHoldersByTotalTime()
        }
        catch {
            assertionFailure()
        }
        
        leaderboardObj = NSManagedObject(entity: entityDescription, insertInto: managedContext)
    }
    
    /* Method for sorting retrieved ScoreHolders by totalTime */
//    Begin sort by totalTime
//    if totalTime is ever '==' then sort by totalMoves
    func sortScoreHoldersByTotalTime() {
        scoreHolders.sort { (ScoreHolder1, ScoreHolder2) -> Bool in
            if ScoreHolder1.totalTime < ScoreHolder2.totalTime {
                return ScoreHolder1.totalTime < ScoreHolder2.totalTime
            }
            else if ScoreHolder1.totalTime == ScoreHolder2.totalTime {
                return ScoreHolder1.totalMoves < ScoreHolder2.totalMoves
            }
            return ScoreHolder1.totalTime < ScoreHolder2.totalTime
        }
    }
    
    /* Method to compare currentPlayer to leaderboard highscores */
//    Identify if currentPlayer.totalTime is '<' a highscore
//      return index
//    if totalTime is '==' then identify if currentPlayer.totalMoves is '<' or '>' a highscore
//      return corresponding index
    func compareCurrentPlayerToLeaderboard() -> Int? {
        for index in (0...scoreHolders.count - 1) {
            if totalTime! < scoreHolders[index].totalTime {
                return index
            }
            else if totalTime! == scoreHolders[index].totalTime {
                if totalMoves! < scoreHolders[index].totalMoves {
                    return index
                }
                else {
                    return index + 1
                }
            }
        }
        return nil
    }
    
    /* Method to save currentPlayer highscore to leaderboard */
//    Create a UIAlert to have player's enter their intials
//      On 'Save'
//          Create a ScoreHolder object and assign to currentPlayer
//          Insert currentPlayer into the scoreHolders[] (Leaderboard)
//          Save currentPlayer to CoreData
//          Disable the 'Save Highscore' button
//          Notify player their highscore was saved
    func addCurrentPlayerToLeaderboard(index i: Int) {
        var playerInitials = ""
        let newHighscoreAlert = UIAlertController(title: "Save Highscore", message: "Nice work, you got a new highscore! Please enter your intials to save your score.", preferredStyle: .alert)
        newHighscoreAlert.addTextField { (textField) in
            textField.placeholder = "Enter Initials"
        }
        newHighscoreAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        newHighscoreAlert.addAction(UIAlertAction(title: "Save", style: .default, handler: { (alert) in
            playerInitials = newHighscoreAlert.textFields![0].text!
            self.currentPlayer = ScoreHolder(initials: playerInitials, totalMoves: self.totalMoves!, totalTime: self.totalTime!, timeStamp: NSDate().timeIntervalSince1970)
            
            self.scoreHolders.insert(self.currentPlayer, at: i)
            
            self.saveToCoreData()
            
            self.navigationItem.leftBarButtonItem?.isEnabled = false
            
            self.newHighscoreLabel.text = "Highscore Saved"
        }))
        self.present(newHighscoreAlert, animated: true, completion: nil)
    }
    
    /* Method to handle playAgain button tap*/
//    Determine if currentPlayer is 'nil' (not saved)
//      Show an UIAlert encouraging player to save their highscore before playing again
//    else segue to ViewController
    @IBAction func playAgain(_ sender: UIButton) {
        if currentPlayer == nil {
            let unsavedHighscoreAlert = UIAlertController(title: "Attention", message: "Look's like you haven't saved your highscore!", preferredStyle: .alert)
            unsavedHighscoreAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            unsavedHighscoreAlert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { (alert) in
                self.performSegue(withIdentifier: "returnToGame", sender: self)
            }))
            self.present(unsavedHighscoreAlert, animated: true, completion: nil)
        }
        else {
            performSegue(withIdentifier: "returnToGame", sender: self)
        }
    }
    
    
    
}
