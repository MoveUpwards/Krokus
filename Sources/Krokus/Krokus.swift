import Foundation
import EventSource

open class Krokus: EventServiceProtocol {
    public static let `default` = Krokus()

    public let retryTime: TimeInterval = 3000
    public var state: EventServiceState = .closed
    public var listenedEventIds: [String] {
        return source?.events() ?? []
    }

    // MARK: Private variables

    private var source: EventSourceProtocol?

    // MARK: Life cycle

    internal init() { }

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

    public func onOpen(_ handler: @escaping (() -> Void)) {
        source?.onOpen(handler)
    }

    open func onMessage(_ handler: @escaping ((EventProtocol) -> Void)) { }

    open func onComplete(_ handler: @escaping ((EventDisconnectProtocol) -> Void)) { }

    @discardableResult
    open func addEventListener(_ name: String, handler: ((EventProtocol) -> Void)? = nil) -> Self {
        return self
    }

    public func removeEventListener(_ name: String) {
        source?.removeEventListener(name)
    }
}
