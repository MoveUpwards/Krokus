//
//  EventServiceProtocol.swift
//  bottle-ar-ios
//
//  Created by Loïc GRIFFIE on 29/11/2019.
//  Copyright © 2019 Loïc GRIFFIE. All rights reserved.
//

import Foundation

public protocol EventServiceProtocol {
    /// RetryTime: This can be changed remotly if the server sends an event `retry:`
    var retryTime: TimeInterval { get }

    /// Current connection state
    var state: EventServiceState { get }

    /// Returns the list of event names that we are currently listening for.
    var listenedEventIds: [String] { get }

    /// Method used to configure the event source.
    ///
    /// - Parameter config: event source configuration
    func set(config: EventConfigProtocol) -> Self

    /// Method used to connect to server. It can receive an optional event indicating the Last-Event-ID
    ///
    /// - Parameter event: optional value that is going to be added on the request header to server.
    func connect(with event: EventProtocol?) -> Self

    /// Method used to disconnect from server.
    func disconnect()

    /// Callback called when EventSource has successfully connected to the server.
    ///
    /// - Parameter handler: callback
    func onOpen(_ onOpenCallback: @escaping (() -> Void)) -> Self

    /// This callback is called everytime an event with name "message" or no name is received.
    func onMessage(_ onMessageCallback: @escaping ((_ event: EventProtocol) -> Void)) -> Self

    /// Callback called once EventSource has disconnected from server. This can happen for multiple reasons.
    /// The server could have requested the disconnection or maybe a network layer error, wrong URL or any other
    /// error.
    ///
    /// @see: EventDisconnectProtocol
    ///
    /// - Parameter handler: callback
    func onComplete(_ onComplete: @escaping ((_ message: EventDisconnectProtocol) -> Void)) -> Self

    /// Add an event handler for an specific event name.
    ///
    /// - Parameters:
    ///   - name: name of the event to receive
    ///   - handler: this handler will be called everytime an event is received
    func addEventListener(_ name: String, handler: ((_ event: EventProtocol) -> Void)?) -> Self

    /// Remove an event handler for the given id
    ///
    /// - Parameter name: name of the listener to be remove from event source.
    func removeEventListener(_ name: String)
}
