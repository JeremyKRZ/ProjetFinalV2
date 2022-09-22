//
//  ViewController.swift
//  FinalProject
//
//  Created by Nicolas Davenne on 21/09/2022.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var stepperLbl: UILabel!
    
    @IBOutlet weak var segmented: UISegmentedControl!
    
    @IBOutlet weak var recapLabel: UILabel!
    
    @IBOutlet weak var stepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        update()
    }

    func update() {
        self.recapLabel.text = "Vous avez choisi une reqûete de \(Int(stepper.value)) personnes et de genre \(getGender().gender)"
    }
    
    func getGender() -> (name:String, gender:GenderEnum)
    {
        switch segmented.selectedSegmentIndex {
            case 0:
                return("Homme", .male)
            case 1 :
                return("Femme", .female)
            default:
                return("On sait pas trop trop", .noGender)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToList" {
            if let list = segue.destination as? ListController {
                list.dict = sender as? [String: Any]
            }
        }
    }

    @IBAction func onSegmentedChange(_ sender: Any) {
        update()
    }
    
    
    @IBAction func onStepperChange(_ sender: Any) {
        update()
    }
    
    
    @IBAction func onClickButton(_ sender: Any) {
        let dict: [String: Any] = ["results": Int(stepper.value),
                                  "gender": getGender().gender]
        self.performSegue(withIdentifier: "ToList", sender: dict)
    }
}

