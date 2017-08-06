//
//  MyselfViewController.swift
//  MyFrisbeeApp
//
//  Created by gaoqingli on 02/08/2017.
//  Copyright © 2017 Thomas. All rights reserved.
//

import UIKit
import FirebaseStorage
import FirebaseDatabase

class MyselfViewController: UIViewController, UITextViewDelegate {
    
    //Access of MGPhotoHelper
    let photoHelper = MGPhotoHelper()
    
    var userGender: Int = 0
    var userPosition: Int = 0
    var url: String = " "
    @IBOutlet weak var avaterImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var teamLabel: UILabel!
    
    
    @IBOutlet weak var teamTextField: UITextField!
    
    @IBOutlet weak var genderLabel: UILabel!
    
    @IBOutlet weak var genderSegementedControl: UISegmentedControl!
    
    @IBOutlet weak var positionLabel: UILabel!
    
    @IBOutlet weak var positionSementedControl: UISegmentedControl!
    
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var heightTextField: UITextField!
    
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var weightTextField: UITextField!
    
    
    @IBOutlet weak var changeInfoButton: UIButton!
    
    //some functions
    func enable()
    {
        nameTextField.isUserInteractionEnabled=true
        teamTextField.isUserInteractionEnabled=true
        positionSementedControl.isUserInteractionEnabled=true
        genderSegementedControl.isUserInteractionEnabled=true
        weightTextField.isUserInteractionEnabled=true
        heightTextField.isUserInteractionEnabled=true
    }
    func disable()
    {
        nameTextField.isUserInteractionEnabled=false
        teamTextField.isUserInteractionEnabled=false
        positionSementedControl.isUserInteractionEnabled=false
        genderSegementedControl.isUserInteractionEnabled=false
        weightTextField.isUserInteractionEnabled=false
        heightTextField.isUserInteractionEnabled=false
    }
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
    
    override func viewWillAppear(_ animated : Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        print ("disapper")
        super.viewWillAppear(true)

    }
//    var userInfo = UserInfos()
//
//    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        disable()
        
        FirebaseHelper.getUserInfos { (UserInfos) in
            
             let userinfo = UserInfos
            self.nameTextField.text = userinfo.userName
            self.teamTextField.text = userinfo.userTeam
            self.heightTextField.text = userinfo.userHeight
            self.weightTextField.text = userinfo.userweight
            self.avaterImage.af_setImage(withURL: URL(string: userinfo.userAvatarURL)!)
            self.genderSegementedControl.selectedSegmentIndex = userinfo.userGender
            self.positionSementedControl.selectedSegmentIndex = userinfo.userPosition
            self.url = userinfo.userAvatarURL
           
        }
 
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    @IBAction func changeInfoButtonTapped(_ sender: UIButton)
    {
        navigation_apper()
        enable()
    }
    @IBAction func cancelBarButtonTapped(_ sender: UIBarButtonItem)
    {
        navigation_disapper()
        disable()
    }
    
    
    
    
    @IBAction func changeAvatarButtonTapped(_ sender: UIButton) {
        
        print("I Love JJLin")
        photoHelper.completionHandler = { image in
            print("handle image")
            let storageRef = StorageReference.newPostImageReference()
            StorageService.uploadImage(image, at: storageRef, completion: { (downloadURL) in
                guard let downloadURL = downloadURL
                    else {
                    return
                }
                //self.gameImageImageView.image = image
                print(downloadURL.absoluteString)
                self.url = downloadURL.absoluteString
                FirebaseHelper.editUserInfo(userName: self.nameTextField.text!, userTeam: self.teamTextField.text!, userGender: self.userGender,  userPosition : self.userPosition, userHeight: self.heightTextField.text!, userWeight: self.weightTextField.text!, userAvatarURL: self.url, userAvatarHeight: 2.33)
                 self.navigation_apper()
            })
            
            self.avaterImage.image = image
        }
        print(self.url)
        photoHelper.presentActionSheet(from: self)
       
        FirebaseHelper.editUserInfo(userName: nameTextField.text!, userTeam: teamTextField.text!, userGender: userGender,  userPosition : userPosition, userHeight: heightTextField.text!, userWeight: weightTextField.text!, userAvatarURL: self.url, userAvatarHeight: 2.33)
        
    }
    
    
    
    
    @IBAction func doneBarButtonTapped(_ sender: UIBarButtonItem)
    {
        navigation_disapper()
        disable()
        FirebaseHelper.editUserInfo(userName: nameTextField.text!, userTeam: teamTextField.text!, userGender: userGender,  userPosition : userPosition, userHeight: heightTextField.text!, userWeight: weightTextField.text!, userAvatarURL: self.url, userAvatarHeight: 2.33)
    }
    
    
    
    
    
    
    
    
    @IBAction func genderSegementedControlTapped(_ sender: UISegmentedControl) {
        self.userGender = genderSegementedControl.selectedSegmentIndex
    
    
    }
    
    @IBAction func positionSegementedControlTapped(_ sender: UISegmentedControl) {
        self.userPosition = positionSementedControl.selectedSegmentIndex
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
