//
//  Service.swift
//  flickr
//
//  Created by Daniel Kong on 4/2/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import Foundation

class Service {
    
    struct Constant {
        static let home = "home"
        static let json_error = "home_with_error"
    }
    
    static let shared = Service()
    let urlString = "https://api.letsbuildthatapp.com/twitter/"
    

    func fetchHomeData(completion: @escaping ([User]?, [Tweet]?, _ errorString: String?) -> ()) {
        let urls = urlString + Constant.home
        if let url = URL.init(string: urls) {
            let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
                if error != nil {
                    print("error")
                    completion(nil, nil, error?.localizedDescription)
                }
                
                //
                if let data = data, let response = response as? HTTPURLResponse {
                    if response.statusCode >= 200 && response.statusCode <= 299 {
                        // Swift 4
                        let temp = String(data: data, encoding: .utf8)
                        print(temp)
                        do {
                            let root = try JSONDecoder().decode(WebsiteRoot.self, from: data)
//                            print(root.users[0].name)
                            print(root.users)
                            completion(root.users, root.tweets, nil)
                        } catch let jsonErr {
                            
                            print("Error decoding Json Questons", jsonErr)
                        }
                        
                        // JSON serialization swift 2 & 3
//                        do {
//                            let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: AnyObject]
//
//                            guard let userData = json["users"] as? [[String: AnyObject]] else {
//                                print("do right format user data")
//                                completion(nil, nil, "User JSON is invalid")
//                                return
//                            }
//                            guard let tweets = json["tweets"] as? [[String: AnyObject]] else {
//                                print("do right format tweets data")
//                                completion(nil, nil, "Tweet JSON is invalid")
//                                return
//                            }
//                            var usersModel = [User]()
//                            for userDict in userData {
//                                let userModel = User(id: userDict["id"] as! Int, name:  userDict["name"] as! String, username: userDict["username"] as! String, bioText: userDict["bio"] as! String, imageString: userDict["profileImageUrl"] as! String)
//                                usersModel.append(userModel)
//                            }
//
//                            var tweetsModel = [Tweet]()
//                            for tweetDict in tweets {
//                                if let userDict = tweetDict["user"] as? [String: AnyObject], let imageDict = tweetDict["image"] as? [String: AnyObject], let message = tweetDict["message"] as? String {
//
//                                    let userModel = User(id: userDict["id"] as! Int, name:  userDict["name"] as! String, username: userDict["username"] as! String, bioText: userDict["bio"] as! String, imageString: userDict["profileImageUrl"] as! String)
//                                    let tweetModel = Tweet(user: userModel, message: message, imageString: (imageDict["imageUrl"] as! String))
//                                    tweetsModel.append(tweetModel)
//                                }
//
//
//                            }
//                            completion(usersModel, tweetsModel, nil)
//                        } catch {
//
//                        }
                        
                    } else if response.statusCode == 404 {
                        completion(nil, nil, "This page is not found.")
                    } else {
                        completion(nil, nil, "Something got wrong.")
                    }
                }
            }
            dataTask.resume()
        }
    }
}

