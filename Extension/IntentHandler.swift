//
//  IntentHandler.swift
//  Extension
//
//  Created by Parankush Bhardwaj on 3/30/17.
//  Copyright © 2017 Parankush Bhardwaj. All rights reserved.
//

import Intents
import UIKit



class IntentHandler: INExtension, INRidesharingDomainHandling {
    
    //all methods are async so that a slow server response doesn't freeze Siri or Maps
    
    
    //below func shows list of available rides when on Apple Maps
        func handle(listRideOptions intent: INListRideOptionsIntent, completion: @escaping (INListRideOptionsIntentResponse) -> Void) {
        <#code#>
    }
    
    
    //below creates a ride when using Maps or Siri
    func handle(requestRide intent: INRequestRideIntent, completion: @escaping (INRequestRideIntentResponse) -> Void) {
        <#code#>
    }
    
    
    
    //below funcs will be for info on car-waiting (need server for actual functionality)
    func handle(getRideStatus intent: INGetRideStatusIntent, completion: @escaping (INGetRideStatusIntentResponse) -> Void) {
        
        //for now, always return success. When adding a server, below method will change.
        let response = INGetRideStatusIntentResponse(code: .success, userActivity: nil)
        completion(response)
    }
    
    func startSendingUpdates(forGetRideStatus intent: INGetRideStatusIntent, to observer: INGetRideStatusIntentResponseObserver) {
        <#code#>
    }
    
    func stopSendingUpdates(forGetRideStatus intent: INGetRideStatusIntent) {
        <#code#>
    }
    
    
    //below funcs are part of 'Resolve' step (handles actions when asking for addition info through Siri)
    
    func resolvePickupLocation(forRequestRide intent: INRequestRideIntent, with completion: @escaping (INPlacemarkResolutionResult) -> Void) {
        <#code#>
    }
    
    func resolveDropOffLocation(forRequestRide intent: INRequestRideIntent, with completion: @escaping (INPlacemarkResolutionResult) -> Void) {
        <#code#>
    }
    
    
    
    
}
