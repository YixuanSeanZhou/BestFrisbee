//
//  Contact.swift
//  MyFrisbeeApp
//
//  Created by Thomas on 2017/8/1.
//  Copyright © 2017年 Thomas. All rights reserved.
//

import Foundation
import UIKit

class ContactViewController: UIViewController, UITextViewDelegate{
    
    @IBAction func returnButtonTapped(_ sender: UIButton) {
        
        FirebaseHelper.uploadReport(report: reportTextView.text)
        
        let initialViewController = UIStoryboard.initialViewController(for: .main)
        self.view.window?.rootViewController = initialViewController
        self.view.window?.makeKeyAndVisible()
    
    
    
    
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    @IBOutlet weak var reportTextView: UITextView!
}
