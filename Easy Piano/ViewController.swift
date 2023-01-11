//
//  ViewController.swift
//  Easy Piano
//
//  Created by Arif Demirkoparan on 11.01.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player:AVAudioPlayer!
    var autoTitle:String?
    
    @IBAction func buttonPresssed(_ sender: UIButton) {
        autoTitle = sender.subtitleLabel?.text!
        playSound()
        sender.alpha = 0.5
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { Timer in
            sender.alpha = 1.0
        }
    }
    
    func playSound() {
        
        guard let path = Bundle.main.path(forResource: autoTitle, ofType:"wav") else {
            return }
        
        let url = URL(fileURLWithPath: path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        }catch let error {
            print(error.localizedDescription)
        }
    }
}

