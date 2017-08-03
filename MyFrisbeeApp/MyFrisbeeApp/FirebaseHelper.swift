//
//  FirebaseHelper.swift
//  MyFrisbeeApp
//
//  Created by Thomas on 2017/8/2.
//  Copyright © 2017年 Thomas. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuthUI


struct FirebaseHelper {
    
    //Writing data to Firebase
    
    static func createGame(gameTitle: String, gameTime: String, gameLocation: String, gameURL : String, gameHeight: Float, gameDescription: String, gamePlayer: [String]){
       //sst dictionary
        
        
        let dict = ["gameTitle": gameTitle,
                    "gameTime": gameTime,
                    "gameLocation": gameLocation,
                    "gameURL": gameURL,
                    "gameHeight": gameHeight,
                    "gamePoster": User.current.username,
                    "gameDescription": gameDescription,
                    "gamePlayer": gamePlayer] as [String : Any]
        
        let ref = Database.database().reference().child("games").childByAutoId()
     //ste reference on database
        
        
        ref.updateChildValues(dict)
    }
    
    static func createGame(reference: String, gameTitle: String, gameTime: String, gameLocation: String, gameURL : String, gameHeight: Float, gameDescription: String, gamePlayer: [String]){
        //sst dictionary
        
        
        let dict = ["gameTitle": gameTitle,
                    "gameTime": gameTime,
                    "gameLocation": gameLocation,
                    "gameURL": gameURL,
                    "gameHeight": gameHeight,
                    "gamePoster": User.current.username,
                    "gameDescription": gameDescription,
                    "gamePlayer": gamePlayer] as [String : Any]
        
        let ref = Database.database().reference().child("games").child(reference)
        //ste reference on database
        
        
        ref.updateChildValues(dict)
    }

    
    
    static func editUserInfo(userName: String, userTeam: String, userGender: Int,  userPosition : Int, userHeight: String, userWeight: String, userAvatarURL: String, userAvatarHeight: Float){
        //sst dictionary
        
        
        let dict = ["userName": userName,
                    "userTeam": userTeam,
                    "userGender": userGender,
                    "userPosition": userPosition,
                    "userHeight": userHeight,
                    "userWeight": userWeight,
//                    "userAvatarHeight": userAvatarHeight,
                    "userAvatarURL": userAvatarURL
                    ] as [String : Any]
        
        let ref = Database.database().reference().child("users").child(User.current.uid)
        //ste reference on database
        
        
        ref.updateChildValues(dict)
    }

    
    
    
    
    
    
    
    
    
    
    // Getting Data From Firebase
    

     static func getGames(completion: @escaping([Game]) -> ()) {
        //where to find our data
        var array = [Game]()
        let ref = Database.database().reference().child("games")
        ref.observeSingleEvent(of: .value, with:{ (snapshot) in
            if let dictionary = snapshot.value as? [String: Any]{
               
                for key in dictionary.keys{
                     print(key)
                    let game = Game(dictionary: dictionary[key] as! [String : Any], key : key)
                    array.append(game!)
                    print(game!.key ?? nil)
                }
            }
          completion(array)
        })
    }
    
    
    //For current user
    
    static func getUserInfos(completion: @escaping(UserInfos) -> ()) {
        //where to find our data
      
        let ref = Database.database().reference().child("users").child(User.current.uid)
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            if let temp = snapshot.value as? [String: Any] {
                if temp.count > 0 {
                    
                    if let userInfo = UserInfos(dictionary: snapshot.value as! [String : Any], key: snapshot.key){
                        
                        completion(userInfo)

                } else {
  
                    
                }
                
            }
            }
            
        })
    }
    
    
    
    
    
    
    
    
    //For Other Users who is in the game
    
    static func getUsersInfos(uid: String, completion: @escaping(UserInfos) -> ()) {
        //where to find our data
        
        let ref = Database.database().reference().child("users").child(uid)
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            if let temp = snapshot.value as? [String: Any] {
                if temp.count > 0 {
                    
                    if let userInfo = UserInfos(dictionary: snapshot.value as! [String : Any], key: snapshot.key){
                        
                        completion(userInfo)
                        
                    } else {
                        
                        
                    }
                    
                }
            }
            
        })
    }

    
    
    
    
    
}

    
    
    


