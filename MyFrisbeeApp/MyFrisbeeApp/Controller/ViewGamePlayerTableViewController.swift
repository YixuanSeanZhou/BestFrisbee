//
//  ViewGamePlayerTableViewController.swift
//  MyFrisbeeApp
//
//  Created by Thomas on 2017/8/3.
//  Copyright © 2017年 Thomas. All rights reserved.
//

import UIKit
import AlamofireImage

class ViewGamePlayerTableViewController: UITableViewController {

    
    
    var indexPath = 0
    
    @IBAction func addButtonTapped(_ sender: Any) {
        PickupTableViewController.games[PickupTableViewController.indexPath].gamePlayer.append(User.current.uid)
        print( PickupTableViewController.games[PickupTableViewController.indexPath].gamePlayer)
      ////////////
        
        print(PickupTableViewController.games[PickupTableViewController.indexPath].key ?? "I have nothing to print out")
        FirebaseHelper.createGame(reference: PickupTableViewController.games[PickupTableViewController.indexPath].key!,gameTitle: PickupTableViewController.games[PickupTableViewController.indexPath].gameTitle, gameTime: PickupTableViewController.games[PickupTableViewController.indexPath].gameTime, gameLocation: PickupTableViewController.games[PickupTableViewController.indexPath].gameLocation, gameURL: PickupTableViewController.games[PickupTableViewController.indexPath].imageURL, gameHeight: 0, gameDescription: PickupTableViewController.games[PickupTableViewController.indexPath].gameDescription, gamePlayer: PickupTableViewController.games[PickupTableViewController.indexPath].gamePlayer)
        tableView.reloadData()
       // CreateAGameViewController.userid.append(Usvarcurrenvarid)
    
    
    
    
    }
    @IBAction func returnButtonTapped(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(type: .main)
        if let initialViewController = storyboard.instantiateInitialViewController() {
            self.view.window?.rootViewController = initialViewController
            self.view.window?.makeKeyAndVisible()
        }

        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PickupTableViewController.games[PickupTableViewController.indexPath].gamePlayer.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ViewPlayerTableViewCell", for: indexPath) as! ViewPlayerTableViewCell
        
            FirebaseHelper.getUsersInfos(uid: PickupTableViewController.games[PickupTableViewController.indexPath].gamePlayer[Int(indexPath.row)], completion: { (UserInfos) in
                
                cell.playerNameLabel.text = UserInfos.userName
                if UserInfos.userPosition == 0{
                    cell.playerPositionLabel.text = "Handler"

                }
                else{
                    cell.playerPositionLabel.text = "Cutter"
                }
                
                cell.playerAvatarUIImageView.af_setImage(withURL: URL(string: UserInfos.userAvatarURL)!)

             
                
            })
        

        
        
        
//        FirebaseHelper.getUserInfos { (UserInfos) in
//            
//            let userinfo = UserInfos
//            self.nameTextField.text = userinfo.userName
//            self.teamTextField.text = userinfo.userTeam
//            self.heightTextField.text = userinfo.userHeight
//            self.avaterImage.af_setImage(withURL: URL(string: userinfo.userAvatarURL)!)
//            self.genderSegementedControl.selectedSegmentIndex = userinfo.userGender
//            self.positionSementedControl.selectedSegmentIndex = userinfo.userPosition
//            
//            
//        }
        // Configure the cell...
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
