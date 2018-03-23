//
//  BaseClientAPI.swift
//  flickr
//
//  Created by Daniel Kong on 3/20/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import Foundation

enum APIMethod: String {
    case GET, PUT, POST, DELETE
}
// FlickrClientAPI
class BaseClientAPI: NSObject {

    let apiURL = "https://api.flickr.com/services/rest/"
    
    struct FlickrParamsKey {
        static let Method = "method"
        static let Api_Key = "api_key"
        static let Bbox = "bbox"
        static let Safe_Search = "safe_search"
        static let Extras = "extras"
        static let Format = "format"
        static let NoJSONCallback = "nojsoncallback"
        static let Per_Page = "per_page"
        static let Page = "page"
    }
    
    struct FlickrParamsValue {
        static let URL_M = "url_m"
        static let JSON = "json"
        static let MethodValue = "flickr.photos.search"
        static let ApiValue = "8c478e5a68b4cd1b92f53f31d039d831"
    }
    
    struct ErrorCaseString {
        static let UsernamePasswordError = "Username or password is incorrect"
        static let HttpError = "HTTP Error"
        static let TimeOutError = "Connection timed out"
        static let SOCKError = "SOCK Errors"
        static let NoDataError = "No data was returned by the request!"
    }
    
    /**
     {
         "id": "40242713784",
         "owner": "10881108@N06",
         "secret": "2ac9f47c1e",
         "server": "813",
         "farm": 1,
         "title": "CAMILLE ALAPHILIPPE TOURS",
         "ispublic": 1,
         "isfriend": 0,
         "isfamily": 0,
         "url_m": "https:\/\/farm1.staticflickr.com\/813\/40242713784_2ac9f47c1e.jpg",
         "height_m": "500",
         "width_m": "282"
     let id: String
     let owner: String
     let secret: String
     let url_m: String
     let height_m: String
     let width_m: String
     },
     */
    struct JSONResponseKeys {
        static let id = "id"
        static let owner = "owner"
        static let secret = "secret"
        static let url_m = "url_m"
        static let height_m = "height_m"
        static let width_m = "width_m"
        static let title = "title"
    }
    
    // Singleton
//    static let shared = BaseClientAPI()
    
     class func shared() -> BaseClientAPI {
        struct Singleton {
            static var sharedInstance = BaseClientAPI()
        }
        return Singleton.sharedInstance
     }
    
    // private parameters
    var headers: [String: String] = [String: String]()
    var session: URLSession {
        return URLSession.shared
    }
    
    func generateUrlRequest(path: String, method: APIMethod? = .GET, params: [String: String], body: AnyObject? = nil) -> NSMutableURLRequest {
        
        /* 1. Set the parameters */
        var components = URLComponents()
        components.queryItems = params.map { URLQueryItem(name: $0, value: $1) }
        let paramsString = components.percentEncodedQuery ?? ""
        
        let urlString = path + "?" + paramsString
        if let url = URL(string: urlString) {
            /* 2/3. Build the URL, Configure the request */
            let req = NSMutableURLRequest(url: url)
            req.httpMethod = (method?.rawValue)!
            for (header, value) in headers {
                req.addValue(value, forHTTPHeaderField: header)
            }
            if body != nil {
                do {
                    req.httpBody = try! JSONSerialization.data(withJSONObject: body!, options: [])
                }
            }
            return req
        } else {
            fatalError("no url found!")
        }
    }
    
    func sendURLRequest(_ request: NSURLRequest, _ handler: @escaping(_ result: AnyObject?, _ error: String?) -> Void) {
        
        /* 4. Make the request */
        let task = session.dataTask(with: request as URLRequest) {(data, response, error) in
            
            /* GUARD: Was there an error? */
            guard error == nil else {
                var errorString = "There was an error with your request: \(error)"
                
                if error!._code < 400 && error!._code > 299 {
                    errorString = ErrorCaseString.HttpError
                } else if error!._code == -1001 {
                    errorString = ErrorCaseString.TimeOutError
                } else if error!._code < 200 && error!._code >= 120 {
                    errorString = ErrorCaseString.SOCKError
                }
                handler(nil, errorString)
                return
            }
            
            /* GUARD: Did we get a successful 2XX response? */
            guard let status = (response as? HTTPURLResponse)?.statusCode, status != 403 else {
                handler(nil, ErrorCaseString.UsernamePasswordError)
                return
            }
            
            if let data = data {
                let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: AnyObject]
                handler(json as AnyObject?, nil)
            } else {
                handler(nil, ErrorCaseString.NoDataError)
                return
            }
            /* 5/6. Parse the data and use the data (happens in completion handler) */
            // self.convertDataWithCompletionHandler(data, completionHandlerForConvertData: completionHandlerForGET)

        }
        /* 7. Start the request */
        task.resume()
        
        /**
        // prepare json data
        let mapDict = [ "1":"First", "2":"Second"]
        
        let json = [ "title":"ABC" , "dict": mapDict ] as [String : Any]
        let jsonData : NSData = NSKeyedArchiver.archivedData(withRootObject: json) as NSData
        
        // create post request
        let url = NSURL(string: "http://httpbin.org/post")!
        let request = NSMutableURLRequest(url: url as URL)
        request.httpMethod = "POST"
        
        // insert json data to the request
        request.httpBody = jsonData as Data
        
        
        let task = URLSession.shared.dataTask(with: request as URLRequest){ data,response,error in
            if error != nil{
                return
            }
            do {
                let result = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:AnyObject]
                
                print("Result",result!)
                
            } catch {
                print("Error -> \(error)")
            }
        }
        
        task.resume()
        */
    }
    
    
    /**
    // MARK: GET
    
    func taskForGETMethod(_ method: String, parameters: [String:AnyObject], completionHandlerForGET: @escaping (_ result: AnyObject?, _ error: NSError?) -> Void) -> URLSessionDataTask {
        
        /* 1. Set the parameters */
        var parametersWithApiKey = parameters
        parametersWithApiKey[ParameterKeys.ApiKey] = Constants.ApiKey as AnyObject?
        
        /* 2/3. Build the URL, Configure the request */
        let request = NSMutableURLRequest(url: TMDBClient.tmdbURLFromParameters(parametersWithApiKey, withPathExtension: method))
        
        /* 4. Make the request */
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
            
            func sendError(_ error: String) {
                print(error)
                let userInfo = [NSLocalizedDescriptionKey : error]
                completionHandlerForGET(nil, NSError(domain: "taskForGETMethod", code: 1, userInfo: userInfo))
            }
            
            /* GUARD: Was there an error? */
            guard (error == nil) else {
                sendError("There was an error with your request: \(error)")
                return
            }
            
            /* GUARD: Did we get a successful 2XX response? */
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
                sendError("Your request returned a status code other than 2xx!")
                return
            }
            
            /* GUARD: Was there any data returned? */
            guard let data = data else {
                sendError("No data was returned by the request!")
                return
            }
            
            /* 5/6. Parse the data and use the data (happens in completion handler) */
            self.convertDataWithCompletionHandler(data, completionHandlerForConvertData: completionHandlerForGET)
        }
        
        /* 7. Start the request */
        task.resume()
        
        return task
    }
    */
}
