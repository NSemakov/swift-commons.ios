// ----------------------------------------------------------------------------
//
//  LogcatLogger.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

@available(*, deprecated)
public final class LogcatLogger: LoggerContract
{
// MARK: - Construction

    @available(*, deprecated)
    public init() {
        // Do nothing
    }

// MARK: - Methods

    @available(*, deprecated)
    public func v(_ tag: String, _ message: String) {
        let level = Logger.LogLevel.verbose
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, message))
        }
    }

    @available(*, deprecated)
    public func d(_ tag: String, _ message: String) {
        let level = Logger.LogLevel.debug
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, message))
        }
    }

    @available(*, deprecated)
    public func i(_ tag: String, _ message: String) {
        let level = Logger.LogLevel.information
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, message))
        }
    }

// --

    @available(*, deprecated)
    public func w(_ tag: String, _ message: String) {
        let level = Logger.LogLevel.warning
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, message))
        }
    }

    @available(*, deprecated)
    public func w(_ tag: String, _ message: String, _ error: Error?) {
        let level = Logger.LogLevel.warning
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, message, error))
        }
    }

    @available(*, deprecated)
    public func w(_ tag: String, _ message: String, _ error: NSError?) {
        let level = Logger.LogLevel.warning
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, message, error))
        }
    }

    @available(*, deprecated)
    public func w(_ tag: String, _ message: String, _ exception: NSException?) {
        let level = Logger.LogLevel.warning
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, message, exception))
        }
    }

    @available(*, deprecated)
    public func w(_ tag: String, _ error: Error) {
        let level = Logger.LogLevel.warning
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, nil, error))
        }
    }

    @available(*, deprecated)
    public func w(_ tag: String, _ error: NSError) {
        let level = Logger.LogLevel.warning
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, nil, error))
        }
    }

    @available(*, deprecated)
    public func w(_ tag: String, _ exception: NSException) {
        let level = Logger.LogLevel.warning
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, nil, exception))
        }
    }

// --

    @available(*, deprecated)
    public func e(_ tag: String, _ message: String) {
        let level = Logger.LogLevel.error
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, message))
        }
    }

    @available(*, deprecated)
    public func e(_ tag: String, _ message: String, _ error: Error?) {
        let level = Logger.LogLevel.error
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, message, error))
        }
    }

    @available(*, deprecated)
    public func e(_ tag: String, _ message: String, _ error: NSError?) {
        let level = Logger.LogLevel.error
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, message, error))
        }
    }

    @available(*, deprecated)
    public func e(_ tag: String, _ message: String, _ exception: NSException?) {
        let level = Logger.LogLevel.error
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, message, exception))
        }
    }

    @available(*, deprecated)
    public func e(_ tag: String, _ error: Error) {
        let level = Logger.LogLevel.error
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, nil, error))
        }
    }

    @available(*, deprecated)
    public func e(_ tag: String, _ error: NSError) {
        let level = Logger.LogLevel.error
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, nil, error))
        }
    }

    @available(*, deprecated)
    public func e(_ tag: String, _ exception: NSException) {
        let level = Logger.LogLevel.error
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, nil, exception))
        }
    }
}

// ----------------------------------------------------------------------------