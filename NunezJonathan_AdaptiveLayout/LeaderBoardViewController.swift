//
//  LeaderBoardViewController.swift
//  NunezJonathan_AdaptiveLayout
//
//  Created by Jonathan Nunez on 1/29/19.
//  Copyright © 2019 Jonathan Nunez. All rights reserved.
//

import UIKit

class LeaderBoardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Preparations
    var scoreHolders = [ScoreHolder]()
    var currentPlayer: ScoreHolder!
    
        
    @IBOutlet weak var leaderboardTableView: UITableView!
    
    /* In viewDidLoad() */
//    Assign tableView delegate to self
//    Assign tableView datasource to self
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationItem.title = "Leaderboard"
        
        leaderboardTableView.delegate = self
        leaderboardTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scoreHolders.count
    }
    
    /* TableViewCell properties */
//    Display ScoreHolder object initials, timeStamp, totalMoves, and totalTime
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = leaderboardTableView?.dequeueReusableCell(withIdentifier: "tvcID", for: indexPath) as? LeaderboardTableViewCell
            else {fatalError("Should not happen")}
        
        cell.initialsLabel.text = scoreHolders[indexPath.row].initials
        cell.timeStampLabel.text = scoreHolders[indexPath.row].timeStampFormatted
        cell.totalMovesLabel.text = scoreHolders[indexPath.row].totalMoves.description
        cell.totalTimeLabel.text = scoreHolders[indexPath.row].totalTimeFormatted
        
        return cell
    }

}
