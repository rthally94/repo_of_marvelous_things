import Foundation

/// A model describing a Post from the JSONPlaceholder API.
/// Conforms to Codable for JSON Conversion
public struct JSONPlaceholderPost: Codable {
    let id: Int
    let title: String
    let body: String
    let userId: Int
}


/// A model describing a Comment from the JSONPlaceholder API
/// Conforms to Codable for JSON Conversion
public struct JSONPlaceholderComment: Codable {
    let postID: Int
    let name: String
    let email: String
    let body: String
}
