// ----------------------------------------------------------------------------
//
//  StringUtils.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommonsLang

// ----------------------------------------------------------------------------

@available(*, deprecated)
public final class StringUtils: NonCreatable
{
// MARK: - Methods

    /// Checks if all of the Strings are empty ("") or {@code nil}.
    ///
    /// <pre>
    /// StringUtils.isAllEmpty(nil)              = true
    /// StringUtils.isAllEmpty(nil, "")          = true
    /// StringUtils.isAllEmpty(new String[] {})  = true
    /// StringUtils.isAllEmpty(nil, "foo")       = false
    /// StringUtils.isAllEmpty("", "bar")        = false
    /// StringUtils.isAllEmpty("bob", "")        = false
    /// StringUtils.isAllEmpty("  bob  ", nil)   = false
    /// StringUtils.isAllEmpty(" ", "bar")       = false
    /// StringUtils.isAllEmpty("foo", "bar")     = false
    /// </pre>
    ///
    /// @param values The Strings to check, may be nil or empty
    /// @return {@code true} if all of the Strings are empty or nil
    ///
    @available(*, deprecated)
    public static func isAllEmpty(_ values: [String]?) -> Bool {
        return CollectionUtils.isEmpty(values) || values!.all { $0.isEmpty }
    }

    @available(*, deprecated)
    public static func isAllEmpty(_ values: [String?]?) -> Bool {
        return CollectionUtils.isEmpty(values) || values!.all { $0.isEmpty }
    }

    /// Checks if none of the Strings are not empty ("") and not {@code nil}.
    ///
    /// <pre>
    /// StringUtils.isAllNotEmpty(nil)              = false
    /// StringUtils.isAllNotEmpty(nil, "foo")       = false
    /// StringUtils.isAllNotEmpty("", "bar")        = false
    /// StringUtils.isAllNotEmpty("bob", "")        = false
    /// StringUtils.isAllNotEmpty("  bob  ", nil)   = false
    /// StringUtils.isAllNotEmpty(new String[] {})  = false
    /// StringUtils.isAllNotEmpty(" ", "bar")       = true
    /// StringUtils.isAllNotEmpty("foo", "bar")     = true
    /// </pre>
    ///
    /// @param values The Strings to check, may be nil or empty
    /// @return {@code true} if none of the Strings are empty or nil
    ///
    @available(*, deprecated)
    public static func isAllNotEmpty(_ values: [String]?) -> Bool {
        return CollectionUtils.isNotEmpty(values) && values!.all { $0.isNotEmpty }
    }

    @available(*, deprecated)
    public static func isAllNotEmpty(_ values: [String?]?) -> Bool {
        return CollectionUtils.isNotEmpty(values) && values!.all { $0.isNotEmpty }
    }

// MARK: -

    /// Checks if a String is empty (""), {@code nil} or whitespace only.
    ///
    /// <pre>
    /// StringUtils.isBlank(nil)       = true
    /// StringUtils.isBlank("")        = true
    /// StringUtils.isBlank(" ")       = true
    /// StringUtils.isBlank("bob")     = false
    /// StringUtils.isBlank("  bob  ") = false
    /// </pre>
    ///
    /// @param value The String to check, may be nil
    /// @return {@code true} if the String is nil, empty or whitespace only
    ///
    @available(*, deprecated)
    public static func isBlank(_ value: String?) -> Bool {
        return (value == nil) || value!.trim().isEmpty
    }

    /// Checks if all of the Strings are empty (""), {@code nil} or whitespace only.
    ///
    /// <pre>
    /// StringUtils.isAllBlank(nil)              = true
    /// StringUtils.isAllBlank(nil, "foo")       = false
    /// StringUtils.isAllBlank(nil, nil)         = true
    /// StringUtils.isAllBlank("", "bar")        = false
    /// StringUtils.isAllBlank("bob", "")        = false
    /// StringUtils.isAllBlank("  bob  ", nil)   = false
    /// StringUtils.isAllBlank(" ", "bar")       = false
    /// StringUtils.isAllBlank("foo", "bar")     = false
    /// StringUtils.isAllBlank(new String[] {})  = true
    /// </pre>
    ///
    /// @param values The Strings to check, may be nil or empty
    /// @return {@code true} if all of the Strings are empty or nil or whitespace only
    ///
    @available(*, deprecated)
    public static func isAllBlank(_ values: [String]?) -> Bool {
        return CollectionUtils.isEmpty(values) || values!.all { isBlank($0) }
    }

    @available(*, deprecated)
    public static func isAllBlank(_ values: [String?]?) -> Bool {
        return CollectionUtils.isEmpty(values) || values!.all { isBlank($0) }
    }

    /// Checks if a String is not empty (""), not {@code nil} and not whitespace only.
    ///
    /// <pre>
    /// StringUtils.isNotBlank(nil)       = false
    /// StringUtils.isNotBlank("")        = false
    /// StringUtils.isNotBlank(" ")       = false
    /// StringUtils.isNotBlank("bob")     = true
    /// StringUtils.isNotBlank("  bob  ") = true
    /// </pre>
    ///
    /// @param value The String to check, may be nil
    /// @return {@code true} if the String is not empty and not nil and not whitespace only
    ///
    @available(*, deprecated)
    public static func isNotBlank(_ value: String?) -> Bool {
        return !isBlank(value)
    }

    /// Checks if none of the Strings are empty (""), {@code nil} or whitespace only.
    ///
    /// <pre>
    /// StringUtils.isAllNotBlank(nil)              = false
    /// StringUtils.isAllNotBlank(nil, "foo")       = false
    /// StringUtils.isAllNotBlank(nil, nil)         = false
    /// StringUtils.isAllNotBlank("", "bar")        = false
    /// StringUtils.isAllNotBlank("bob", "")        = false
    /// StringUtils.isAllNotBlank("  bob  ", nil)   = false
    /// StringUtils.isAllNotBlank(" ", "bar")       = false
    /// StringUtils.isAllNotBlank(new String[] {})  = false
    /// StringUtils.isAllNotBlank("foo", "bar")     = true
    /// </pre>
    ///
    /// @param values The Strings to check, may be nil or empty
    /// @return {@code true} if none of the Strings are empty or nil or whitespace only
    ///
    @available(*, deprecated)
    public static func isAllNotBlank(_ values: [String]?) -> Bool {
        return CollectionUtils.isNotEmpty(values) && values!.all { isNotBlank($0) }
    }

    @available(*, deprecated)
    public static func isAllNotBlank(_ values: [String?]?) -> Bool {
        return CollectionUtils.isNotEmpty(values) && values!.all { isNotBlank($0) }
    }

// MARK: -

    /// Returns the given string if it is nonempty; {@code nil} otherwise.
    @available(*, deprecated)
    public static func emptyToNil(_ value: String?) -> String? {
        return value.isEmpty ? nil : value
    }

    /// Returns the given string if it is non {@code nil}; the empty string otherwise.
    @available(*, deprecated)
    public static func nilToEmpty(_ value: String?) -> String {
        return (value == nil) ? "" : value!
    }
}

// ----------------------------------------------------------------------------
