import Foundation

// 1. Fetch all posts using the network engine.
NetworkEngine.request(endpoint: JSONPlaceholderAPIEndpoint.getPosts) { (result: Result<[JSONPlaceholderPost], Error>) in
    switch result {
    case .success(let posts):
        // 1a. Do something with the valid posts.
        print(posts.count)
        print(posts[0])
        
    case .failure(let error):
        // 1b. Do something else with the error.
        print(error.localizedDescription)
    }
}

