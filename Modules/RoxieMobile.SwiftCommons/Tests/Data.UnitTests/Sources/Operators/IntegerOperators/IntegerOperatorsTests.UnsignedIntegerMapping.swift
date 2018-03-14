// ----------------------------------------------------------------------------
//
//  IntegerOperatorsTests.UnsignedIntegerMapping.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
// MARK: - UnsignedInteger mapping
// ----------------------------------------------------------------------------

extension IntegerOperatorsTests
{
// MARK: - Tests

    func testUnsignedIntegerMappingFromJSON() {

        let JsonString = JsonKeys.uintValues
        let JsonStringNotValid = JsonKeys.intValuesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        mapValid.JSON[CodingKeys.nilValue] = nil

        // --

        let valueU8: UInt8 = UInt8(JsonString[CodingKeys.uint8]!)
        var uInt8Value: UInt8 = 0

        uInt8Value <~ mapValid[CodingKeys.uint8]

        // Positive
        XCTAssertEqual(uInt8Value, valueU8)

        // Negative
        guardNegativeException {
            uInt8Value <~ mapNotValid[CodingKeys.notValidValue]
        }
        guardNegativeException {
            uInt8Value <~ mapValid[CodingKeys.noSuchKey]
        }
        guardNegativeException {
            uInt8Value <~ mapValid[CodingKeys.nilValue]
        }

        // --

        let valueU16: UInt16 = UInt16(JsonString[CodingKeys.uint16]!)
        var uInt16Value: UInt16 = 0

        uInt16Value <~ mapValid[CodingKeys.uint16]

        // Positive
        XCTAssertEqual(uInt16Value, valueU16)

        // Negative
        guardNegativeException {
            uInt16Value <~ mapNotValid[CodingKeys.notValidValue]
        }
        guardNegativeException {
            uInt16Value <~ mapValid[CodingKeys.noSuchKey]
        }
        guardNegativeException {
            uInt16Value <~ mapValid[CodingKeys.nilValue]
        }

        // --

        let valueU32: UInt32 = UInt32(JsonString[CodingKeys.uint32]!)
        var uInt32Value: UInt32 = 0

        uInt32Value <~ mapValid[CodingKeys.uint32]

        // Positive
        XCTAssertEqual(uInt32Value, valueU32)

        // Negative
        guardNegativeException {
            uInt32Value <~ mapNotValid[CodingKeys.notValidValue]
        }
        guardNegativeException {
            uInt32Value <~ mapValid[CodingKeys.noSuchKey]
        }
        guardNegativeException {
            uInt32Value <~ mapValid[CodingKeys.nilValue]
        }

        // --

        let valueU64: UInt64 = UInt64(JsonString[CodingKeys.uint64]!)
        var uInt64Value: UInt64 = 0

        uInt64Value <~ mapValid[CodingKeys.uint64]

        // Positive
        XCTAssertEqual(uInt64Value, valueU64)

        // Negative
        guardNegativeException {
            uInt64Value <~ mapNotValid[CodingKeys.notValidValue]
        }
        guardNegativeException {
            uInt64Value <~ mapValid[CodingKeys.noSuchKey]
        }
        guardNegativeException {
            uInt64Value <~ mapValid[CodingKeys.nilValue]
        }

        // --

        let uValue: UInt = UInt(JsonString[CodingKeys.uint]!)
        var uIntValue: UInt = 0

        uIntValue <~ mapValid[CodingKeys.uint]

        // Positive
        XCTAssertEqual(uIntValue, uValue)

        // Negative
        guardNegativeException {
            uIntValue <~ mapNotValid[CodingKeys.notValidValue]
        }
        guardNegativeException {
            uIntValue <~ mapValid[CodingKeys.noSuchKey]
        }
        guardNegativeException {
            uIntValue <~ mapValid[CodingKeys.nilValue]
        }
    }

    func testUnsignetIntegerMappingToJSON() {
        let map = Map(mappingType: .toJSON, JSON: [:])

        var uInt8Value: UInt8 = UInt8(Constants.maxUInt)
        var uInt16Value: UInt16 = UInt16(Constants.minUInt)
        var uInt32Value: UInt32 = UInt32(Constants.maxUInt)
        var uInt64Value: UInt64 = UInt64(Constants.minUInt)
        var uIntValue: UInt = UInt(Constants.maxUInt)

        // Positive
        uInt8Value <~ map[CodingKeys.uint8]
        XCTAssertNotNil(map.JSON[CodingKeys.uint8])

        uInt16Value <~ map[CodingKeys.uint16]
        XCTAssertNotNil(map.JSON[CodingKeys.uint16])

        uInt32Value <~ map[CodingKeys.uint32]
        XCTAssertNotNil(map.JSON[CodingKeys.uint32])

        uInt64Value <~ map[CodingKeys.uint64]
        XCTAssertNotNil(map.JSON[CodingKeys.uint64])

        uIntValue <~ map[CodingKeys.uint]
        XCTAssertNotNil(map.JSON[CodingKeys.uint])

        // Negative
        guardNegativeException {
            Constants.dateValue <~ map[CodingKeys.notValidValue]
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional UnsignedInteger mapping
// ----------------------------------------------------------------------------

extension IntegerOperatorsTests
{
    // MARK: - Tests

    func testOptionalUnsignedIntegerMappingFromJSON() {

        let JsonString = JsonKeys.uintValues
        let JsonStringNotValid = JsonKeys.intValuesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        mapValid.JSON[CodingKeys.nilValue] = nil

        // --

        let valueU8: UInt8? = UInt8(JsonString[CodingKeys.uint8]!)
        var uInt8Value: UInt8? = 0

        uInt8Value <~ mapValid[CodingKeys.uint8]

        // Positive
        XCTAssertEqual(uInt8Value, valueU8)

        // Negative
        uInt8Value <~ mapValid[CodingKeys.noSuchKey]
        XCTAssertEqual(uInt8Value, nil)

        uInt8Value <~ mapValid[CodingKeys.nilValue]
        XCTAssertEqual(uInt8Value, nil)

        guardNegativeException {
            uInt8Value <~ mapNotValid[CodingKeys.notValidValue]
        }

        // --

        let valueU16: UInt16? = UInt16(JsonString[CodingKeys.uint16]!)
        var uInt16Value: UInt16? = 0

        uInt16Value <~ mapValid[CodingKeys.uint16]

        // Positive
        XCTAssertEqual(uInt16Value, valueU16)

        // Negative
        uInt16Value <~ mapValid[CodingKeys.noSuchKey]
        XCTAssertEqual(uInt16Value, nil)

        uInt16Value <~ mapValid[CodingKeys.nilValue]
        XCTAssertEqual(uInt16Value, nil)

        guardNegativeException {
            uInt16Value <~ mapNotValid[CodingKeys.notValidValue]
        }

        // --

        let valueU32: UInt32? = UInt32(JsonString[CodingKeys.uint32]!)
        var uInt32Value: UInt32? = 0

        uInt32Value <~ mapValid[CodingKeys.uint32]

        // Positive
        XCTAssertEqual(uInt32Value, valueU32)

        // Negative
        uInt32Value <~ mapValid[CodingKeys.noSuchKey]
        XCTAssertEqual(uInt32Value, nil)

        uInt32Value <~ mapValid[CodingKeys.nilValue]
        XCTAssertEqual(uInt32Value, nil)

        guardNegativeException {
            uInt32Value <~ mapNotValid[CodingKeys.notValidValue]
        }

        // --

        let valueU64: UInt64? = UInt64(JsonString[CodingKeys.uint64]!)
        var uInt64Value: UInt64? = 0

        uInt64Value <~ mapValid[CodingKeys.uint64]

        // Positive
        XCTAssertEqual(uInt64Value, valueU64)

        // Negative
        uInt64Value <~ mapValid[CodingKeys.noSuchKey]
        XCTAssertEqual(uInt64Value, nil)

        uInt64Value <~ mapValid[CodingKeys.nilValue]
        XCTAssertEqual(uInt64Value, nil)

        guardNegativeException {
            uInt64Value <~ mapNotValid[CodingKeys.notValidValue]
        }
        //        guardNegativeException {
        //            uInt64Value <~ map["negUInt"]
        //        } Error in ObjectMapper

        // --

        let uValue: UInt? = UInt(JsonString[CodingKeys.uint]!)
        var uIntValue: UInt? = 0

        uIntValue <~ mapValid[CodingKeys.uint]

        // Positive
        XCTAssertEqual(uIntValue, uValue)

        // Negative
        uIntValue <~ mapValid[CodingKeys.noSuchKey]
        XCTAssertEqual(uIntValue, nil)

        uIntValue <~ mapValid[CodingKeys.nilValue]
        XCTAssertEqual(uIntValue, nil)

        guardNegativeException {
            uIntValue <~ mapNotValid[CodingKeys.notValidValue]
        }
    }

    func testOptionalUnsignetIntegerMappingToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var uInt8Value: UInt8? = UInt8(Constants.maxUInt)
        var uInt16Value: UInt16? = UInt16(Constants.maxUInt)
        var uInt32Value: UInt32? = UInt32(Constants.maxUInt)
        var uInt64Value: UInt64? = UInt64(Constants.maxUInt)
        var uIntValue: UInt? = UInt(Constants.maxUInt)

        // Positive
        uInt8Value <~ map[CodingKeys.uint8]
        XCTAssertNotNil(map.JSON[CodingKeys.uint8])

        uInt16Value <~ map[CodingKeys.uint16]
        XCTAssertNotNil(map.JSON[CodingKeys.uint16])

        uInt32Value <~ map[CodingKeys.uint32]
        XCTAssertNotNil(map.JSON[CodingKeys.uint32])

        uInt64Value <~ map[CodingKeys.uint64]
        XCTAssertNotNil(map.JSON[CodingKeys.uint64])

        uIntValue <~ map[CodingKeys.uint]
        XCTAssertNotNil(map.JSON[CodingKeys.uint])

        // Negative
        guardNegativeException {
            Constants.dateValue <~ map[CodingKeys.notValidValue]
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - ImplicitlyUnwrappedOptional UnsignedInteger mapping
// ----------------------------------------------------------------------------

extension IntegerOperatorsTests
{
    // MARK: - Tests

    func testImplicityUnwrappedOptionalUnsignedIntegerMappingFromJSON() {

        let JsonString = JsonKeys.uintValues
        let JsonStringNotValid = JsonKeys.intValuesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        mapValid.JSON[CodingKeys.nilValue] = nil

        // --

        let valueU8: UInt8! = UInt8(JsonString[CodingKeys.uint8]!)
        var uInt8Value: UInt8! = 0

        uInt8Value <~ mapValid[CodingKeys.uint8]

        // Positive
        XCTAssertEqual(uInt8Value, valueU8)

        // Negative
        guardNegativeException {
            uInt8Value <~ mapNotValid[CodingKeys.notValidValue]
        }
        guardNegativeException {
            uInt8Value <~ mapValid[CodingKeys.noSuchKey]
        }
        guardNegativeException {
            uInt8Value <~ mapValid[CodingKeys.nilValue]
        }

        // --

        let valueU16: UInt16! = UInt16(JsonString[CodingKeys.uint16]!)
        var uInt16Value: UInt16! = 0

        uInt16Value <~ mapValid[CodingKeys.uint16]

        // Positive
        XCTAssertEqual(uInt16Value, valueU16)

        // Negative
        guardNegativeException {
            uInt16Value <~ mapNotValid[CodingKeys.notValidValue]
        }
        guardNegativeException {
            uInt16Value <~ mapValid[CodingKeys.noSuchKey]
        }
        guardNegativeException {
            uInt16Value <~ mapValid[CodingKeys.nilValue]
        }

        // --

        let valueU32: UInt32! = UInt32(JsonString[CodingKeys.uint32]!)
        var uInt32Value: UInt32! = 0

        uInt32Value <~ mapValid[CodingKeys.uint32]

        // Positive
        XCTAssertEqual(uInt32Value, valueU32)

        // Negative
        guardNegativeException {
            uInt32Value <~ mapNotValid[CodingKeys.notValidValue]
        }
        guardNegativeException {
            uInt32Value <~ mapValid[CodingKeys.noSuchKey]
        }
        guardNegativeException {
            uInt32Value <~ mapValid[CodingKeys.nilValue]
        }

        // --

        let valueU64: UInt64! = UInt64(JsonString[CodingKeys.uint64]!)
        var uInt64Value: UInt64! = 0

        uInt64Value <~ mapValid[CodingKeys.uint64]

        // Positive
        XCTAssertEqual(uInt64Value, valueU64)

        // Negative
        guardNegativeException {
            uInt64Value <~ mapNotValid[CodingKeys.notValidValue]
        }
        guardNegativeException {
            uInt64Value <~ mapValid[CodingKeys.noSuchKey]
        }
        guardNegativeException {
            uInt64Value <~ mapValid[CodingKeys.nilValue]
        }

        // --

        let uValue: UInt! = UInt(JsonString[CodingKeys.uint]!)
        var uIntValue: UInt! = 0

        uIntValue <~ mapValid[CodingKeys.uint]

        // Positive
        XCTAssertEqual(uIntValue, uValue)

        // Negative
        guardNegativeException {
            uIntValue <~ mapNotValid[CodingKeys.notValidValue]
        }
        guardNegativeException {
            uIntValue <~ mapValid[CodingKeys.noSuchKey]
        }
        guardNegativeException {
            uIntValue <~ mapValid[CodingKeys.nilValue]
        }
    }

    func testImplicityUnwrappedOptionalUnsignedIntegerMappingToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var uInt8Value: UInt8! = UInt8(Constants.minUInt)
        var uInt16Value: UInt16! = UInt16(Constants.minUInt)
        var uInt32Value: UInt32! = UInt32(Constants.minUInt)
        var uInt64Value: UInt64! = UInt64(Constants.minUInt)
        var uIntValue: UInt! = UInt(Constants.minUInt)

        // Positive
        uInt8Value <~ map[CodingKeys.uint8]
        XCTAssertNotNil(map.JSON[CodingKeys.uint8])

        uInt16Value <~ map[CodingKeys.uint16]
        XCTAssertNotNil(map.JSON[CodingKeys.uint16])

        uInt32Value <~ map[CodingKeys.uint32]
        XCTAssertNotNil(map.JSON[CodingKeys.uint32])

        uInt64Value <~ map[CodingKeys.uint64]
        XCTAssertNotNil(map.JSON[CodingKeys.uint64])

        uIntValue <~ map[CodingKeys.uint]
        XCTAssertNotNil(map.JSON[CodingKeys.uint])

        // Negative
        guardNegativeException {
            Constants.dateValue <~ map[CodingKeys.notValidValue]
        }
    }
}

// ----------------------------------------------------------------------------