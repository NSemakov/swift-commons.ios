// ----------------------------------------------------------------------------
//
//  OperatorsTests.Mappable.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
// MARK: - Object conforming to Mappable
// ----------------------------------------------------------------------------

extension OperatorsTests
{
// MARK: - Tests

    func testObjectMappableToJSON() {

        var object: ValidMappableObjectModel = ValidMappableObjectModel()
        var map = Map(mappingType: .toJSON, JSON: [:])
        object >>> map[CodingKeys.validObject]
        let someDictionary = map.JSON[CodingKeys.validObject]! as! [String: Bool]
        let bool = someDictionary[CodingKeys.bool]!

        /// Positive results
        XCTAssertEqual(object.bool, bool)

        /// Negative results
        let someDateTime = NotValidMappableObjectModel(map: map)
        guardNegativeException {
            someDateTime >>> map[CodingKeys.date]
        }
    }

    func testObjectMappableFromJSON() {

        let JsonString = JsonKeys.mappableObjects
        let JsonStringNotValid = JsonKeys.mappableObjectsNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        mapValid.JSON[CodingKeys.nilValue] = nil
        let mapNotValid = Map(mappingType: .toJSON, JSON: JsonStringNotValid)
        var object: ValidMappableObjectModel = ValidMappableObjectModel()
        object <~ mapValid[CodingKeys.validObject]
        print(object.bool)

        /// Positive results
        XCTAssertTrue(object.bool)

        /// Negative results
        object <~ mapNotValid[CodingKeys.validObject]
        print(object.bool)
        XCTAssertTrue(object.bool)
        guardNegativeException {
            object <~ mapValid[CodingKeys.noSuchKey]
        }
        guardNegativeException {
            object <~ mapValid[CodingKeys.nilValue]
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional Mappable objects
// ----------------------------------------------------------------------------

extension OperatorsTests
{
// MARK: - Tests

    func testOptionalMappableObjectsToJSON() {

        var object: ValidMappableObjectModel? = ValidMappableObjectModel()
        var map = Map(mappingType: .toJSON, JSON: [:])
        object >>> map[CodingKeys.validObject]
        let someDictionary = map.JSON[CodingKeys.validObject]! as! [String: Bool]
        let bool = someDictionary[CodingKeys.bool]!

        /// Positive results
        XCTAssertEqual(object?.bool, bool)

        /// Negative results
        let someDateTime: NotValidMappableObjectModel? = NotValidMappableObjectModel(map: map)
        guardNegativeException {
            someDateTime >>> map[CodingKeys.date]
        }
    }

    func testOptionalMappableObjectsFromJSON() {

        let JsonString = JsonKeys.mappableObjects
        let JsonStringNotValid = JsonKeys.mappableObjectsNotValid

        let map = Map(mappingType: .fromJSON, JSON: JsonString)
        map.JSON[CodingKeys.nilValue] = nil
        let mapNotValid = Map(mappingType: .toJSON, JSON: JsonStringNotValid)
        var object: ValidMappableObjectModel? = ValidMappableObjectModel()
        object <~ map[CodingKeys.validObject]
        print(object?.bool)
        let bool = object?.bool

        /// Positive results
        XCTAssertTrue(bool!)

        /// Negative results
        object <~ mapNotValid[CodingKeys.validObject]
        XCTAssertTrue((object?.boolOpt)!)
        object <~ map[CodingKeys.noSuchKey]
        XCTAssertNil(object?.boolOpt)
        object <~ map[CodingKeys.nilValue]
        XCTAssertNil(object?.boolOpt)
    }
}

// ----------------------------------------------------------------------------
// MARK: - Implicitly unwrapped optional Mappable objects
// ----------------------------------------------------------------------------

extension OperatorsTests
{
// MARK: - Tests

    func testObjectImplicitlyUnwrappedOptionalMappableToJSON() {

        var object: ValidMappableObjectModel! = ValidMappableObjectModel()
        var map = Map(mappingType: .toJSON, JSON: [:])

        object <~ map[CodingKeys.validObject]


        // Positive
        let someDictionary = map.JSON[CodingKeys.validObject]! as! [String: Bool]
        let bool = someDictionary[CodingKeys.bool]!
        XCTAssertEqual(object.bool, bool)

        // Negative
        let someDateTime = NotValidMappableObjectModel(map: map)
        guardNegativeException {
            someDateTime >>> map[CodingKeys.date]
        }
    }

    func testObjectImplicitlyUnwrappedOptionalMappableFromJSON() {

        let JsonString = JsonKeys.mappableObjects
        let JsonStringNotValid = JsonKeys.mappableObjectsNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .toJSON, JSON: JsonStringNotValid)

        var object: ValidMappableObjectModel! = ValidMappableObjectModel()

        object <~ mapValid[CodingKeys.validObject]

        // Positive
        XCTAssertTrue(object.bool)

        // Negative
        object <~ mapNotValid[CodingKeys.validObject]
        XCTAssertTrue(object.bool)

        guardNegativeException {
            object <~ mapValid[CodingKeys.noSuchKey]
        }

        mapValid.JSON[CodingKeys.nilValue] = nil
        guardNegativeException {
            object <~ mapValid[CodingKeys.nilValue]
        }
    }
}

// ----------------------------------------------------------------------------