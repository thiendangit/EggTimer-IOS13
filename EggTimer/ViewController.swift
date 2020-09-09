

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    var bombSoundEffect = AVAudioPlayer()
    let arrayEggTypes : [String : Int] = [
        "Soft" : 5,
        "Medium" :7 ,
        "Hard" : 10
    ]
    
    var currentTime : Float = 0.0;
    let totalTime  : Float = 10.0
    var timingRemaining : Int = 0;
    var step : Float = 1.0
    
    func playSound(forResource : String) -> Void {
        let path = Bundle.main.path(forResource: forResource, ofType:"mp3")!
        let url = URL(fileURLWithPath: path)
        do {
            bombSoundEffect = try AVAudioPlayer(contentsOf: url)
            bombSoundEffect.play()
        } catch {
            print("can't play file!")
        }
    }
    
    @IBAction func onPressEggs(_ sender: UIButton) {
        currentTime = 0.0;
        let eggType = sender.currentTitle!
        print("\(arrayEggTypes[eggType] ?? 0)")
        timingRemaining = arrayEggTypes[eggType] ?? 60
        if(timingRemaining > 0){
            timer()
        }
    }
    
    func timer() -> Void {
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
    }
    
    @objc func update(timer: Timer) {
        if(timingRemaining > 0 && Int(currentTime) < timingRemaining){
            currentTime += step;
            progressBar.progress = Float(currentTime / totalTime)
            print("currentTime : \(Float(currentTime / totalTime))")
        }else{
            timer.invalidate()
            print("Done")
            playSound(forResource: "alarm_sound")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.layer.cornerRadius = 20
        progressBar.clipsToBounds = true
        progressBar.layer.sublayers![1].cornerRadius = 20
        progressBar.subviews[1].clipsToBounds = true
    }
    
}
