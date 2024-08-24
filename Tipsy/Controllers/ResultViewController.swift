import UIKit

class ResultViewController: UIViewController {
    
    var settingsPassed:String?
    var totalLabelPassed:String?
    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsLabel.text = settingsPassed
        totalLabel.text = totalLabelPassed
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
