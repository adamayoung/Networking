import Foundation

extension Request {

    var urlRequest: URLRequest {
        var request = URLRequest(url: url)

        switch method {
        case .post(let data), .put(let data):
            request.httpBody = data

        default:
            break
        }

        request.allHTTPHeaderFields = headers
        request.httpMethod = method.name
        return request
    }

}
