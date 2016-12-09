// ----------------------------------------------------------------------------
//
//  ParkingModel.swift
//
//  @author     Nikita Semakov <SemakovNV@ekassir.com>
//  @copyright  Copyright (c) 2016, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

import SwiftCommons

// ----------------------------------------------------------------------------

public class ParkingModel: ParcelableModel
{
// MARK: - Properties

    public private(set) var watcher: String?

    public private(set) var vehicles: [VehicleModel]!

// MARK: - Functions

    public override func mapping(map: Map) {
        super.mapping(map)

        // (De)serialize to/from json
        self.watcher  <~  map[JsonKeys.Watcher]
        self.vehicles <~  map[JsonKeys.Vehicles]
    }

    public override func validate() -> Bool {
        var result = super.validate()

        //Validate instance
        result &&= plm_isValid(self.vehicles)

        //Done
        return result
    }

}

// ----------------------------------------------------------------------------
