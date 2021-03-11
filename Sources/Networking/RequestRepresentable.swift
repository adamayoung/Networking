import Foundation

public protocol RequestRepresentable {

    associatedtype Response

    var request: Request<Response> { get }

}
