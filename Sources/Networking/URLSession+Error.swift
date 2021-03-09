import Foundation

extension URLSession {

    public enum Error: Swift.Error {
        case networking(URLError)
        case decoding(Swift.Error)
    }

}
