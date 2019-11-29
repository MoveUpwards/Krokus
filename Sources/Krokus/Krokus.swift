import Foundation
import EventSource

open class Krokus: EventServiceProtocol {
    public let retryTime: TimeInterval = 3000
    public var state: EventServiceState = .closed
    public var listenedEventIds: [String] {
        return source?.events() ?? []
    }

    // MARK: Private variables

    public private(set) var source: EventSourceProtocol?

    // MARK: Life cycle

    required public init() { }

    @discardableResult
    public func set(config: EventConfigProtocol) -> Self {
        guard let baseURL = URL(string: config.baseURL) else { return self }

        self.source = EventSource(url: baseURL, headers: config.headers)
        return self
    }

    @discardableResult
    public func connect(with event: EventProtocol? = nil) -> Self {
        state = .connecting
        source?.connect(lastEventId: event?.id.uuidString)
        return self
    }

    public func disconnect() {
        state = .closed
        source?.disconnect()
    }

    @discardableResult
    public func onOpen(_ handler: @escaping (() -> Void)) -> Self {
        source?.onOpen(handler)
        return self
    }

    @discardableResult
    open func onMessage(_ handler: @escaping ((EventProtocol) -> Void)) -> Self {
        return self
    }

    @discardableResult
    open func onComplete(_ handler: @escaping ((EventDisconnectProtocol) -> Void)) -> Self {
        return self
    }

    @discardableResult
    open func addEventListener(_ name: String, handler: ((EventProtocol) -> Void)? = nil) -> Self {
        return self
    }

    public func removeEventListener(_ name: String) {
        source?.removeEventListener(name)
    }
}
