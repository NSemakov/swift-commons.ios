// ----------------------------------------------------------------------------
//
//  SwiftCommonsTests.swift
//
//  @author     Alexander Bragin <alexander.bragin@gmail.com>
//  @copyright  Copyright (c) 2015, MediariuM Ltd. All rights reserved.
//  @link       http://www.mediarium.com/
//
// ----------------------------------------------------------------------------

import SwiftCommons
import UIKit
import XCTest

// ----------------------------------------------------------------------------

class SwiftCommonsTests: XCTestCase
{
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testValidVehicleModel()
    {
        let vehicle = try? VehicleModel(params: [
            JsonKeys.Color : "Red",
            JsonKeys.Model : "ZIL"]
        )
        XCTAssertNotNil(vehicle, "model should be not nil")
    }

    func testModelWithValidVehiclecInRequiredArray()
    {
        if let json = getJSON("test_parking_model_with_valid_vehicles_in_array")
        {
            let parking = try? ParkingModel(params:json)
            XCTAssertNotNil(parking, "model should be not nil")
        }
        else {
            fatalError("no such file")
        }
    }

    func testModelWithNonValidVehicleInRequiredArray()
    {
        if let json = getJSON("test_parking_model_with_one_non_valid_vehicle_in_array")
        {
            let parking = try? ParkingModel(params:json)
            XCTAssertNil(parking, "model should be nil")
        }
        else {
            fatalError("no such file")
        }
    }

    func testModelWithNonValidVehicleInOptionalArray()
    {
        if let json = getJSON("test_parking_model_with_one_non_valid_vehicle_in_array")
        {
            let parking = try? ParkingModelWithOptionalVehicles(params:json)
            XCTAssertNil(parking, "model should be nil")
        }
        else {
            fatalError("no such file")
        }
    }

    func testModelWithEmptyStringInsteadOfRequiredArray()
    {
        if let json = getJSON("test_model_fake_array_string")
        {
            let parking = try? ParkingModel(params:json)
            XCTAssertNil(parking, "model should be nil")
        }
        else {
            fatalError("no such file")
        }
    }

    func testModelWithEmptyModelInsteadOfOfRequiredArray()
    {
        if let json = getJSON("test_model_fake_array_model")
        {
            let parking = try? ParkingModel(params:json)
            XCTAssertNil(parking, "model should be nil")
        }
        else {
            fatalError("no such file")
        }
    }

    func testModelWithEmptyStringInsteadOfOptionalArray()
    {
        if let json = getJSON("test_model_fake_array_string")
        {
            let parking = try? ParkingModelWithOptionalVehicles(params:json)
            XCTAssertNil(parking, "model should be nil")
        }
        else {
            fatalError("no such file")
        }
    }

    func testModelWithEmptyModelInsteadOfOptionalArray()
    {
        if let json = getJSON("test_model_fake_array_model")
        {
            let parking = try? ParkingModelWithOptionalVehicles(params:json)
            XCTAssertNil(parking, "model should be nil")
        }
        else {
            fatalError("no such file")
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

    func getJSON(string: String) -> [String : AnyObject]?
    {
        if let filePath = NSBundle(forClass: self.dynamicType).pathForResource(string, ofType: "json") {
            do {
                let data = NSData(contentsOfFile: filePath)
                if let data = data {
                    let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
                    return json as? [String : AnyObject]
                }
                else {
                    return nil
                }
            }
            catch let error as NSError {
                print("error loading contentsOf url \(filePath)")
                print(error.localizedDescription)
            }
        }

        return nil
    }

}

// ----------------------------------------------------------------------------
