import Foundation

/// A protocol to define the parameters of the API request
public protocol Endpoint {
    /// HTTP, HTTPS
    var scheme: String { get }
    
    /// The host to connect to. (Ex: jsonplaceholder.typicode.com)
    var host: String { get }
    
    /// Path to the API endpoint. (Ex: /todos/1)
    var path: String { get }
    
    /// Additional parameters to pass to the request (Ex: API Key, etc)
    var parameters: [URLQueryItem] { get }
    
    /// RESTful resource method to use (Ex: GET, POST, etc)
    var method: String { get }
}
