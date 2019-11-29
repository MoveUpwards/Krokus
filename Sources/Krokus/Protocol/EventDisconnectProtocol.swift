//
//  EventDisconnectProtocol.swift
//  bottle-ar-ios
//
//  Created by Loïc GRIFFIE on 29/11/2019.
//  Copyright © 2019 Loïc GRIFFIE. All rights reserved.
//

import Foundation

public protocol EventDisconnectProtocol {
    /// The error code for the disconnection
    var code: Int? { get }
    /// Should reconnect or not following event source rules
    var shallReconnect: Bool? { get }
    /// The network layer error if any
    var error: Error? { get }
}
