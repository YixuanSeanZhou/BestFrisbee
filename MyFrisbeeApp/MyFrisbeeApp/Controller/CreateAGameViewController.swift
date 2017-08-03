//
//  CreateAGameViewController.swift
//  MyFrisbeeApp
//
//  Created by gaoqingli on 02/08/2017.
//  Copyright © 2017 Thomas. All rights reserved.
//

import UIKit
import FirebaseStorage
import FirebaseDatabase

class CreateAGameViewController: UIViewController {

    // MARK: - Properties
    
    let photoHelper = MGPhotoHelper()
    
    static var userid = [String]()
    
    func navigation_apper()
    {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        print ("apper")
    }
    func navigation_disapper()
    {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        print ("apper")
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    var url : String = " "
    
    @IBOutlet weak var titleTextField: UITextField!


    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var gameImageImageView: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var viewPlayersButton: UIButton!
    @IBAction func cancelBarButtonTapped(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(type: .main)
        if let initialViewController = storyboard.instantiateInitialViewController() {
            self.view.window?.rootViewController = initialViewController
            self.view.window?.makeKeyAndVisible()
        }
    }

    @IBAction func doneBarButtonTapped(_ sender: Any) {
        titleTextField.isUserInteractionEnabled=false
        locationTextField.isUserInteractionEnabled=false
        timeTextField.isUserInteractionEnabled=false
        descriptionTextView.isUserInteractionEnabled=false
        
        print(self.url)
        CreateAGameViewController.userid.append(User.current.uid)
        FirebaseHelper.createGame(gameTitle: titleTextField.text!, gameTime: timeTextField.text!, gameLocation: locationTextField.text! , gameURL: self.url, gameHeight: Float(PickupTableViewController.aspectHeight), gameDescription: descriptionTextView.text!, gamePlayer: CreateAGameViewController.userid)
        
        let storyboard = UIStoryboard(type: .main)
        if let initialViewController = storyboard.instantiateInitialViewController() {
            self.view.window?.rootViewController = initialViewController
            self.view.window?.makeKeyAndVisible()
        }
    }
    
    @IBOutlet weak var uploadImageButton: UIButton!
    @IBAction func uploadImageButtonTapped(_ sender: UIButton) {
        print("I Love JJLin")
        
        //navigation_disapper()
        photoHelper.completionHandler = { image in
            print("handle image")
            let storageRef = StorageReference.newPostImageReference()
            self.navigation_disapper()
            StorageService.uploadImage(image, at: storageRef, completion: { (downloadURL) in
                
                print("MTFKER")
                print(downloadURL ?? "MTFKER")
//                self.navigation_apper()
                self.navigation_apper()
                guard let downloadURL = downloadURL
                    
                else {
                    return
                }
                //self.gameImageImageView.image = image
                print(downloadURL.absoluteString)
                self.url = downloadURL.absoluteString
                //self.navigation_apper()
                print(self.url)
            })
            
            self.gameImageImageView.image = image
//            self.url = downloadURL
        }
        photoHelper.presentActionSheet(from: self)
        navigation_apper()
    }
    
    
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
