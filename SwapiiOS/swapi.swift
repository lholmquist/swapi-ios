//
//  swapi.swift
//  SWAPIiOS
//
//  Created by Lucas Holmquist on 1/6/15.
//  Copyright (c) 2015 Lucas Holmquist. All rights reserved.
//

import Foundation
import SwiftyJSON

public class Swapi {
    var baseURL = "http://swapi.co/api/"
    var session: NSURLSession
    
    public init() {
        self.session = NSURLSession.sharedSession()
    }
    
    deinit {
        self.session.finishTasksAndInvalidate()
    }
    
    public func getPerson(id: String, callback: (AnyObject!, NSError?) -> Void) {
        makeRequest("people/" + id, callback)
    }
    
    public func getStarship(id: String, callback: (AnyObject!, NSError?) -> Void) {
        makeRequest("starship/" + id, callback)
    }
    
    public func getVehicle(id: String, callback: (AnyObject!, NSError?) -> Void) {
        makeRequest("vehicle/" + id, callback)
    }
    
    public func getFilm(id: String, callback: (AnyObject!, NSError?) -> Void) {
        makeRequest("films/" + id, callback)
    }
    
    public func getSpecies(id: String, callback: (AnyObject!, NSError?) -> Void) {
        makeRequest("species/" + id, callback)
    }
    
    private func makeRequest(url: String, callback: (AnyObject!, NSError?) -> Void) {
        let request = NSMutableURLRequest(URL: NSURL(string: baseURL + url + "/")!)
        
        let task = session.dataTaskWithRequest(request, completionHandler: {(data, response, error) -> Void in
            if (error != nil) {
                callback("Error", error)
            } else {
                let jsonObject: AnyObject! = JSON(data: data).dictionaryObject!
                callback(jsonObject, nil)
            }
        })
        
        
        task.resume()
    }
}