// ----------------------------------------------------------------------------
//
//  StaticValidator.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

public protocol StaticValidator
{
// MARK: - Methods

    static func isValid(value: AnyObject?) -> Bool
}

// ----------------------------------------------------------------------------
