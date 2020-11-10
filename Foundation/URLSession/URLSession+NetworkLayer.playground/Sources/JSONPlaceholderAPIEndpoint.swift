import Foundation

// 1. Define an Enum that conforms to the Endpoint protocol
enum JSONPlaceholderAPIEndpoint: Endpoint {
    // 1a. Add API Endpoints as enum cases
    case getPosts
    case getPost(id: String)
    
    // 1b. Optional: Provide strong types for the endpoint SchemeType and ResourceMethodType
    enum Scheme: String {
        case http, https
    }
    
    enum ResourceMethod: String {
        case get
    }
    
    typealias SchemeType = Scheme
    typealias ResourceMethodType = ResourceMethod
    
    // 1c.  Implement protocol requirements as computer properties.
    //      All properties are implemented a switch statements for simplier future upgrades.
    var scheme: SchemeType {
        switch self {
            default:
                return .https
        }
    }
    
    var host: String {
        switch self {
            default:
                return "jsonplaceholder.typicode.com"
        }
    }
    
    var path: String {
        switch self {
        case .getPosts:
            return "/posts"
        case .getPost(let id):
            return "/posts/\(id)"
        default:
            return ""
        }
    }
    
    var parameters: [URLQueryItem] {
        switch self {
            default:
                return []
        }
    }
    
    var method: ResourceMethodType {
        switch self {
        case .getPosts:
            fallthrough
        case .getPost:
            return .get
        }
    }
}
