import UIKit

class ViewController: UIViewController {

    var stringVal:String = "10%"
    var floatVal:Float = 0.1
    var totalBill:Float = 0.0
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitLabelOutlet: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        stringVal = (sender.titleLabel?.text)!
        if stringVal == "0%" {
            floatVal = 0.0
        }else if stringVal == "20%" {
            floatVal = 0.2
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitLabelOutlet.text = "\(Int(sender.value))"
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let billVal:String = billTextField.text ?? "0.0"
        let intBillVal:Float = Float(billVal) ?? 0.0
         
        totalBill = intBillVal + intBillVal * floatVal
        
        print(totalBill / Float(Int(splitLabelOutlet.text!)!))
        
        performSegue(withIdentifier: "goToSecondScreen", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "goToSecondScreen" {
            let destination = segue.destination as! ResultViewController
            let stringSplitNum:String = splitLabelOutlet.text ?? "2"
            let floatSplitNum:Float = Float(stringSplitNum) ?? 2.0
            destination.totalLabelPassed = "\(totalBill / floatSplitNum)"
            destination.settingsPassed = "Split between " + splitLabelOutlet.text!  + ", with " + stringVal + " tip"
        }
    }
}

