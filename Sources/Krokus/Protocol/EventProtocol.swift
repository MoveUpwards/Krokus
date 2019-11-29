//
//  EventProtocol.swift
//  bottle-ar-ios
//
//  Created by Loïc GRIFFIE on 29/11/2019.
//  Copyright © 2019 Loïc GRIFFIE. All rights reserved.
//

import Foundation

public protocol EventProtocol {
    /// The message identifier
    var id: UUID { get }
    /// The message event type
    var event: String? { get }
    /// The message data content
    var data: String? { get }
}
