//
//  EventServiceState.swift
//  bottle-ar-ios
//
//  Created by Loïc GRIFFIE on 29/11/2019.
//  Copyright © 2019 Loïc GRIFFIE. All rights reserved.
//

import Foundation

public enum EventServiceState {
    /// Connection in progress
    case connecting
    /// Connection succeeded
    case open
    /// Not connected
    case closed
}
