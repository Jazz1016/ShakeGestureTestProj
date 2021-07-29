//
//  ViewController.swift
//  ShakeGestureTestProj
//
//  Created by James Lea on 7/29/21.
//

import UIKit
import AVFoundation

// 1. VC needs to be the first responder
// 2. VC needs to be a able to become the 1st responder
// 3. Detect shake

class ViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var smokeView: UIView!
    @IBOutlet weak var crystalBallImageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        colorView.backgroundColor = .systemOrange
        smokeView.backgroundColor = .purple
        becomeFirstResponder()
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            let vc = UIViewController()
            vc.view.backgroundColor = .systemOrange
            present(vc, animated: true)
//            let alert = UIAlertController(title: "Detected Shake", message: "Phone has been shook", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
//            present(alert, animated: true)
        }
    }
    
    func playVideo(){
        guard let path = Bundle.main.path(forResource: "space", ofType: "mp4") else {return}
        
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = view.bounds
        playerLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(playerLayer)
        player.volume = 0
        
        player.play()
    }
    
}//End of class
