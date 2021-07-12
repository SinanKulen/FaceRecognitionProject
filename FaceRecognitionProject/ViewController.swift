//
//  ViewController.swift
//  FaceRecognitionProject
//
//  Created by Sinan Kulen on 7.06.2021.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInClicked(_ sender: Any) {
        let authContext = LAContext()
        
        var error : NSError?
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "getAuthentication") { [self] Success, Error in
                if Success == true {
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "toSecondVC", sender: nil)
                    }
                    
                }else{
                    DispatchQueue.main.async {
                        self.myLabel.text = "Errorr !!!!!"
                    }
                   
                }
            }
        }
        
        
        
        
        
    }
    
}

