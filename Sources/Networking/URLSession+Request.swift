import Combine
import Foundation

public extension URLSession {

    func publisher<R: RequestRepresentable>(for request: R) -> AnyPublisher<Data, Swift.Error> {
        dataTaskPublisher(for: request.request.urlRequest)
            .mapError(Error.networking)
            .map(\.data)
            .eraseToAnyPublisher()
    }

    func publisher<R: RequestRepresentable>(for request: R) -> AnyPublisher<URLResponse, Swift.Error> {
        dataTaskPublisher(for: request.request.urlRequest)
            .mapError(Error.networking)
            .map(\.response)
            .eraseToAnyPublisher()
    }

    func publisher<R: RequestRepresentable, Value: Decodable>(
        for request: R,
        using decoder: JSONDecoder = .init()) -> AnyPublisher<Value, Swift.Error>
    {
        dataTaskPublisher(for: request.request.urlRequest)
            .mapError(Error.networking)
            .map(\.data)
            .decode(type: Value.self, decoder: decoder)
            .mapError(Error.decoding)
            .eraseToAnyPublisher()
    }

}
