import Foundation

public struct Request<Response> {

    public let url: URL
    public let method: HTTPMethod
    public var headers: [String: String] = [:]

    public init(url: URL, queryItems: [URLQueryItem] = [], method: HTTPMethod = .get,
                headers: [String: String] = [:]) {
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        components?.queryItems = queryItems
        guard let url = components?.url else {
            preconditionFailure("Couldn't create a url from components.")
        }

        self.url = url
        self.method = method
        self.headers = headers
    }

}

extension Request: RequestRepresentable {

    public var request: Request<Response> {
        self
    }

}
