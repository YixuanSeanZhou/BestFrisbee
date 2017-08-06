//
//  ViewgameController.swift
//  MyFrisbeeApp
//
//  Created by Thomas on 2017/8/3.
//  Copyright © 2017年 Thomas. All rights reserved.
//

import UIKit

class ViewgameController: UIViewController {

    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var gameImageView: UIImageView!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
   
    func disable(){
        descriptionTextView.isUserInteractionEnabled=false
        timeTextField.isUserInteractionEnabled=false
        locationTextField.isUserInteractionEnabled=false
        locationTextField.isUserInteractionEnabled=false
        titleTextField.isUserInteractionEnabled=false
    }
    
    
    @IBAction func shareButtonTapped(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(type: .contact)
        if let initialViewController = storyboard.instantiateInitialViewController() {
            self.view.window?.rootViewController = initialViewController
            self.view.window?.makeKeyAndVisible()
        }

    
    
    }

    
    @IBAction func returnButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(type: .main)
        if let initialViewController = storyboard.instantiateInitialViewController() {
            self.view.window?.rootViewController = initialViewController
            self.view.window?.makeKeyAndVisible()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Configuring the view
        disable()
        titleTextField.text = PickupTableViewController.games[PickupTableViewController.indexPath].gameTitle
        locationTextField.text = PickupTableViewController.games[PickupTableViewController.indexPath].gameLocation
         timeTextField.text = PickupTableViewController.games[PickupTableViewController.indexPath].gameTime
         descriptionTextView.text = PickupTableViewController.games[PickupTableViewController.indexPath].gameDescription
        gameImageView.af_setImage(withURL: URL(string: PickupTableViewController.games[PickupTableViewController.indexPath].imageURL)!)
        
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
