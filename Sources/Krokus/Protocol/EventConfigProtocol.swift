//
//  EventConfigProtocol.swift
//  bottle-ar-ios
//
//  Created by Loïc GRIFFIE on 29/11/2019.
//  Copyright © 2019 Loïc GRIFFIE. All rights reserved.
//

import Foundation

public protocol EventConfigProtocol {
    /// Headers for the event source
    var headers: [String: String] { get }
    /// Base URL of the event source
    var baseURL: String { get }
}
