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
        func handle(listRideOptions intent: INListRideOptionsIntent, completion: @escaping
            (INListRideOptionsIntentResponse) -> Void) {
            
            let response = INListRideOptionsIntentResponse(code: .success, userActivity: nil)
            
            //create fake cars as a tester to see if response is working
            //only put electric fake cars (preventing global warming in the digital world)
            
            let Tesla = INRideOption(name: "Tesla Model S", estimatedPickupDate: Date(timeIntervalSinceNow: 1000))
            
            let BMW = INRideOption(name: "BMW i3", estimatedPickupDate: Date(timeIntervalSinceNow: 800))
            
            let Nissan = INRideOption(name: "Nissan LEAF", estimatedPickupDate: Date(timeIntervalSinceNow: 400))
            
            
            response.expirationDate = Date(timeIntervalSinceNow: 3600)
            response.rideOptions = [Tesla, BMW, Nissan]

            
    }
    
    
    //below creates a ride when using Maps or Siri
    func handle(requestRide intent: INRequestRideIntent, completion: @escaping (INRequestRideIntentResponse) -> Void) {
        
        let result = INRequestRideIntentResponse(code: .success, userActivity: nil)
        
        let status = INRideStatus()
        
        //identifier for specific car
        status.rideIdentifier = "example"
        
        //give it pickup and drop-off locations
        status.pickupLocation = intent.pickupLocation
        status.dropOffLocation = intent.dropOffLocation
        
        //confirm ride
        status.phase = INRidePhase.confirmed
        
        //say you'll be there in 10
        status.estimatedPickupDate = Date(timeIntervalSinceNow: 600)
        
        //configure car
        let car = INRideVehicle()
        
        //make image for car
        let image = UIImage(named: "car")!
        let data = UIImagePNGRepresentation(image)!
        car.mapAnnotationImage = INImage(imageData: data)
        
        //set user's location to destination
        car.location = intent.dropOffLocation!.location
        
        //configure status
        result.rideStatus = status
        
        completion(result)
        
    }
    
    
    
    //below funcs will be for info on car-waiting (need server for actual functionality)
    func handle(getRideStatus intent: INGetRideStatusIntent, completion: @escaping (INGetRideStatusIntentResponse) -> Void) {
        
        //for now, always return success. When adding a server, below method will change.
        let response = INGetRideStatusIntentResponse(code: .success, userActivity: nil)
        completion(response)
    }
    
    
    
    func startSendingUpdates(forGetRideStatus intent: INGetRideStatusIntent, to observer: INGetRideStatusIntentResponseObserver) {
        
    }
    
    func stopSendingUpdates(forGetRideStatus intent: INGetRideStatusIntent) {
        
    }
    
    
    //below funcs are part of 'Resolve' step (handles actions when asking for addition info through Siri)
    
    func resolvePickupLocation(forRequestRide intent: INRequestRideIntent, with completion: @escaping (INPlacemarkResolutionResult) -> Void) {
        
        
        let response: INPlacemarkResolutionResult
        
        
        if let requestedLocation = intent.pickupLocation {
            response = INPlacemarkResolutionResult.success(with: requestedLocation)
        } else  {
            response = INPlacemarkResolutionResult.needsValue()
        }
        completion(response)
        
    }
    
    func resolveDropOffLocation(forRequestRide intent: INRequestRideIntent, with completion: @escaping (INPlacemarkResolutionResult) -> Void) {
        
        let response: INPlacemarkResolutionResult
        
        
        if let requestedLocation = intent.dropOffLocation {
            response = INPlacemarkResolutionResult.success(with: requestedLocation)
        } else  {
            response = INPlacemarkResolutionResult.needsValue()
        }
        completion(response)

        
        
    }
    
    
    
    
}
