import Foundation

public struct Request<Response> {

    public let url: URL
    public let method: HTTPMethod
    public var headers: [String: String] = [:]

}
