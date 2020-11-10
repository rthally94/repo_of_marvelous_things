import Foundation

// 1. Define an Enum that conforms to the Endpoint protocol
public enum JSONPlaceholderAPIEndpoint: Endpoint {
    // 1a. Add API Endpoints as enum cases
    case getPosts
    case getPost(id: String)
    
    // 1b. Optional: Provide strong types for the endpoint SchemeType and ResourceMethodType
    internal enum Scheme: String {
        case http, https
    }
    
    internal enum ResourceMethod: String {
        case get
    }
    
    // 1c.  Implement protocol requirements as computer properties.
    //      All properties are implemented a switch statements for simplier future upgrades.
    public var scheme: String {
        switch self {
            default:
                return Scheme.https.rawValue
        }
    }
    
    public var host: String {
        switch self {
            default:
                return "jsonplaceholder.typicode.com"
        }
    }
    
    public var path: String {
        switch self {
        case .getPosts:
            return "/posts"
        case .getPost(let id):
            return "/posts/\(id)"
        default:
            return ""
        }
    }
    
    public var parameters: [URLQueryItem] {
        switch self {
            default:
                return []
        }
    }
    
    public var method: String {
        switch self {
        case .getPosts:
            fallthrough
        case .getPost:
            return ResourceMethod.get.rawValue
        }
    }
}
