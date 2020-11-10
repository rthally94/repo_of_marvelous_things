import Foundation

/// Provides network communitcation abilities via URLSession
public class NetworkEngine {
    public class func request<T: Codable>(endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> ()) {
        // Create a URL from the endpoint components.
        var components = URLComponents()
        components.scheme = endpoint.scheme
        components.host = endpoint.host
        components.path = endpoint.path
        components.queryItems = endpoint.parameters
        
        guard let url = components.url else { return }
        
        // Create a requst for the desired url with the httpMethod specified by the Endpoint
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method
        
        // Create a new dataTask to fetch the url request
        let session = URLSession.shared
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            // Handle any errors with the fetch
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            
            // Confirm the response and data are available
            guard response != nil, let data = data else { return }
            
            // Process the data on the main thread
            DispatchQueue.main.async {
                if let responseObject = try? JSONDecoder().decode(T.self, from: data) {
                    completion(.success(responseObject))
                } else {
                    let error = NSError(domain: "", code: 200, userInfo: [NSLocalizedDescriptionKey: "Failed to decode response"])
                    completion(.failure(error))
                }
                
            }
        }
        
        // Run the data task.
        dataTask.resume()
    }
}
