

import UIKit

class ViewController: UIViewController {
    
    let arrayEggTypes : [String : Int] = [
        "Soft" : 3,
        "Medium" : 5,
        "Hard" : 7
    ]
    
    var timingRemaining : Int = 60;
    
    @IBAction func onPressEggs(_ sender: UIButton) {
        let eggType = sender.currentTitle!
        print("\(arrayEggTypes[eggType] ?? 0)")
        timingRemaining = arrayEggTypes[eggType] ?? 60
        if(timingRemaining > 0){
            timer()
        }
    }
    
    func timer() -> Void {
        Timer().invalidate()
        _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
    }
    
    @objc func update() {
        if(timingRemaining > 0){
            timingRemaining -= 1
            print("timingRemaining : \(timingRemaining)")
        }else{
            Timer().invalidate()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
