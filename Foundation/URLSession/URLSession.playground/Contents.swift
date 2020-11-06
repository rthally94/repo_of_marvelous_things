import UIKit

// 1. Create a function to handle data fetching
private func fetchData() {
    // 1a. Specify a URL to fetch data from
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    
    // 1b. Create a dataTask to fetch the url. Takes a completion handler to handle response.
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        // Check and handle client errors
        if let error = error {
            print("Data Task Error: \(error.localizedDescription)")
            return
        }
        
        // Check and ensure there is data and a valid response
        guard
            let data = data,
            let response = response as? HTTPURLResponse,
            (200...299).contains(response.statusCode) else {
            
            print("Failed to access data or got bad response.")
            return
        }
            // DO STUFF WITH DATA HERE (JSON Decoding, etc)
    }
    
    // 1c. Start the dataTask to fetch the URL
    task.resume()
}

// 2. Fetch the data.
fetchData()
