//
//  ViewController.swift
//  You Are Awesome
//
//  Created by Arya Murthi on 8/28/17.
//  Copyright © 2017 Arya Murthi. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //MARK: - My Properties
    
    @IBOutlet weak var playSoundSwitch: UISwitch!
    @IBOutlet weak var alrightImage: UIImageView!
    @IBOutlet weak var reallyCoolLabel: UILabel!
    var alrightPlayer = AVAudioPlayer()
    
    var index = -1
    var imageNumber = -1
    var soundNumber = -1
    var soundName = "sound0"
    let numberOfImages = 7
    let numberofSounds = 5
    
    let messages = ["You aiight.",
                    "I suppose you have a few redeeming qualities.",
                    "You not completely bad.",
                    "When the genius bar needs help, they go to a professional instead of trusting their resources with an untrained, inexperienced person like yourself.",
                    "You're only human."]
    
    
    @IBAction func soundSwitchPressed(_ sender: UISwitch) {
        if !playSoundSwitch.isOn && soundNumber != -1 {
            //stop playing the sound
            alrightPlayer.stop()
        }
    }
    
    //Change label to message output
    @IBAction func showMessageButton(_ sender: UIButton) {
        
        //Show Message
        index = randomNumberGenerator(lastNumber: index, maximumConstraint: messages.count)
        reallyCoolLabel.text = messages[index]
    
        //Show Image
        imageNumber = randomNumberGenerator(lastNumber: imageNumber, maximumConstraint: numberOfImages)
        alrightImage.image = UIImage(named: "image\(imageNumber)")
        
        //Input Sound
        soundNumber = randomNumberGenerator(lastNumber: soundNumber, maximumConstraint: numberofSounds)
        
        //Play the sound
        soundName = "sound\(soundNumber)"
        
        if playSoundSwitch.isOn {
        playSound(soundName: soundName, audioPlayer: &alrightPlayer)
        }
    }
    
    
    
    func randomNumberGenerator(lastNumber: Int, maximumConstraint: Int)-> Int {
        var newIndex = -1
        repeat {
        newIndex = Int(arc4random_uniform(UInt32(maximumConstraint)))
        } while lastNumber == newIndex
        return newIndex
    }
    
    
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
        
        // Is it possible to load in the sound file?
        if let sound = NSDataAsset(name: soundName) {
            
            // check if sound.data is a usable file
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                
                // if sound.data is not a valid audio file
                print("ERROR: file \(soundName) didn't load.")
            }
        } else {
            // if reading the assets folder didn't work
            print("ERROR: file \(soundName) didn't load.")
        }
        
    }
    
    
    
    //This code executes when the view controller loads
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

