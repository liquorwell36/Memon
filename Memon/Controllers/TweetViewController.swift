//
//  TweetViewController.swift
//  Memon
//
//  Created by kosuke sakai on 2022/02/15.
//

import Foundation
import UIKit

class TweetViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sendChatTextView: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    
    var tweets: Tweets = Tweets(tweet: [])
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TweetTextTableViewCell", bundle: nil), forCellReuseIdentifier: "tweetCell")
    }
    
    private func setupUI() {
        sendChatTextView.layer.borderWidth = 3.0
        sendChatTextView.layer.cornerRadius = 20
        sendButton.layer.cornerRadius = self.sendButton.frame.height / 2
    }
    
    @IBAction func tappedSendButton() {
        if let inputText = self.sendChatTextView.text {
            print(inputText)
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            let strDate = formatter.string(from: date)
            
            tweets.tweet.append(Tweet(time: strDate, text: inputText))
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func tappedBackButton() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension TweetViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.tweet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell", for: indexPath) as! TweetTextTableViewCell
        cell.timeLabel.text = tweets.tweet[indexPath.row].time
        cell.displayChatTextView.text = tweets.tweet[indexPath.row].text
        return cell
    }
}
