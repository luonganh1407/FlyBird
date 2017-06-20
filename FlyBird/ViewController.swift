//
//  ViewController.swift
//  FlyBird
//
//  Created by techmaster on 6/20/17.
//  Copyright © 2017 techmaster. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var bird = UIImageView()
    var audioPlayer = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        drawJungle()
        addBird()
        flyUpAndDown()
        playSong()
    }
    func drawJungle(){
        let background = UIImageView(image: UIImage(named: "jungle.jpg"))
        background.frame = self.view.bounds
        background.contentMode = .scaleAspectFill
        self.view.addSubview(background) //ep doi tuong vao view
    }
    func addBird() {
        bird = UIImageView(frame:CGRect(x: 0, y: 0, width: 110, height: 68))
        bird.animationImages = [UIImage(named:"bird0.png")!,
                                UIImage(named:"bird1.png")!,
                                UIImage(named:"bird2.png")!,
                                UIImage(named:"bird3.png")!,
                                UIImage(named:"bird4.png")!,
                                UIImage(named:"bird5.png")!]
        bird.animationRepeatCount = 0 //lap vo tan
        bird.animationDuration = 1
        bird.startAnimating()
        self.view.addSubview(bird)
    }
    func flyUpAndDown(){
        UIView.animate(withDuration: 10, animations: {
            self.bird.center = CGPoint(x: self.view.bounds.size.width, y: self.view.bounds.size.height)
        }) { _ in
            self.bird.transform = self.bird.transform.scaledBy(x: -1, y: 1).concatenating(CGAffineTransform(rotationAngle: 0))
            UIView.animate(withDuration: 4, animations: {
                self.bird.center = CGPoint(x: 0, y: self.view.bounds.size.height)
            }) { _ in
                self.bird.transform = self.bird.transform.scaledBy(x: -1, y: 1).concatenating(CGAffineTransform(rotationAngle: 0))
            UIView.animate(withDuration: 4, animations: {
                    self.bird.center = CGPoint(x: self.view.bounds.size.width, y: 0)
                }) { _ in
                     self.bird.transform = self.bird.transform.scaledBy(x: -1, y: 1).concatenating(CGAffineTransform(rotationAngle: 0))
            UIView.animate(withDuration: 4, animations: {
                        self.bird.center = CGPoint(x: 0, y: 0)
                    }){ _ in
                        self.bird.transform = CGAffineTransform.identity
                        self.flyUpAndDown()
                    
    }

    }
    }
    }
    }
    func playSong() {
        let filePath = Bundle.main.path(forResource: "A+ – Chào Mào Mái Hót", ofType: "mp3")
        let url = URL(fileURLWithPath: filePath!)
        audioPlayer = try!AVAudioPlayer(contentsOf: url)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    }
}
