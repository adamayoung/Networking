import Combine
import Foundation

public extension URLSession {

    func publisher(for request: Request<Data>) -> AnyPublisher<Data, Swift.Error> {
        dataTaskPublisher(for: request.urlRequest)
            .mapError(Error.networking)
            .map(\.data)
            .eraseToAnyPublisher()
    }

    func publisher(for resource: Request<URLResponse>) -> AnyPublisher<URLResponse, Swift.Error> {
        dataTaskPublisher(for: resource.urlRequest)
            .mapError(Error.networking)
            .map(\.response)
            .eraseToAnyPublisher()
    }

    func publisher<Value: Decodable>(for request: Request<Value>,
                                     using decoder: JSONDecoder = .init()) -> AnyPublisher<Value, Swift.Error> {
        dataTaskPublisher(for: request.urlRequest)
            .mapError(Error.networking)
            .map(\.data)
            .decode(type: Value.self, decoder: decoder)
            .mapError(Error.decoding)
            .eraseToAnyPublisher()
    }

}
