import Foundation

// 1. Fetch all posts using the network engine.
NetworkEngine.request(endpoint: JSONPlaceholderAPIEndpoint.getPosts) { (result: Result<[JSONPlaceholderPost], Error>) in
    switch result {
    case .success(let posts):
        // 1a. Do something with the valid posts.
        print("--- All Posts ---")
        print(posts.count)
        print(posts[0])
        
    case .failure(let error):
        // 1b. Do something else with the error.
        print(error.localizedDescription)
    }
}

// 2. Fetch a specifc post using the network engine.
NetworkEngine.request(endpoint: JSONPlaceholderAPIEndpoint.getPost(id: "1")) { (result: Result<JSONPlaceholderPost, Error>) in
    switch result {
    case .success(let post):
        // 1a. Do something with the valid posts.
        print("--- One Post ---")
        print(post)
        
    case .failure(let error):
        // 1b. Do something else with the error.
        print(error.localizedDescription)
    }
}

// Notice how the print statements may or may not be in the same order as the request above. Due to the asynchronous nature of URLSession, it will print based on the order of completion.
