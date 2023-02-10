//
//  NetworkService.swift
//  Jikoni
//
//  Created by Wilson Mungai on 2023-02-10.
//

import Foundation

struct NetworkService {
    
    
    // MARK: - Private functions
    
    /// Make request
    /// - Parameters:
    ///   - route: path to make request to backend
    ///   - method: action being taken on the data
    ///   - parameters: params being parsed
    ///   - completion: returns the response after request has been made
    private func request<T: Decodable>(route: Route,
                                       method: Method,
                                       parameters: [String: Any]? = nil,
                                       completion: @escaping(Result<T, Error>) -> Void) {
        // Make url request to the backend
        guard let request = createRequest(route: route, method: method, paramters: parameters) else {
            completion(.failure(AppError.unkownError))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            // check whether there is a data or an error
            // get the result data
            var result: Result<Data, Error>?
            
            if let data = data {
                result = .success(data)
                // Convert the data to string and print
                let responseString = String(data: data, encoding: .utf8) ?? "Couldn't springify our data"
            } else if let error = error {
                result = .failure(error)
                // Retrieve the localized description for this error
                print("The error is: \(error.localizedDescription)")
            }
        }
    }
    
    // URL Request
    /// <#Description#>
    /// - Parameters:
    ///   - route: <#route description#>
    ///   - method: <#method description#>
    ///   - paramters: <#paramters description#>
    /// - Returns: <#description#>
    private func createRequest(route: Route, method:Method, paramters:[String: Any]? = nil) -> URLRequest? {
        // returns the baseurl to the endpoint
        // this will create the url by combining the baseUrl defined and the endpoints which are in the description
        let urlString = Route.baseUrl + route.description // "https://yummie.glitch.me/temp"
        
        // Converts the urlString to an actual url
        guard let url = urlString.asUrl else { return nil }
        
        // Create the request
        var urlRequest = URLRequest(url: url)
        
        // Add value of type "Content-Type"
        // This specifies what kind of document will be requesting, In this case we are requesting an "application.json"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Specify the method
        urlRequest.httpMethod = method.rawValue
        
        // Check whether there are extra parameters
        if let params = paramters {
            
            switch method {
                // If there are extra params they will be added in the url request
            case .get: // https://google.com/books?type=cartoon&page=1 => The urlcomponent will construct this
                // Adding extra params to the url strng
                var urlComponent = URLComponents(string: urlString)
                // map helps to alter the type or value of certain items in an array and then return a new array with an updated content
                // For every item we map to the urlQuery item
                urlComponent?.queryItems = params.map {URLQueryItem(name: $0, value: "\($1)")}
                // Update the url to the new url that has the components
                urlRequest.url = urlComponent?.url
                
                // If there are any params they will be parsed in the body in the cases below
            case .post, .delete, .patch:
                // try? means that data can be nil
                // If the dict cant be convertaed into a dataobject, this will fail and retrun nil as the body data
                let bodyData = try? JSONSerialization.data(withJSONObject: params, options: [])
                // If it get any data, then parse it into the body
                urlRequest.httpBody =  bodyData
            }
        }
        return urlRequest
    }
    
    /// <#Description#>
    /// - Parameters:
    ///   - result: <#result description#>
    ///   - completion: <#completion description#>
    private func handleResponse<T:Decodable>(result: Result<Data, Error>?,
                                             completion: (Result<T, Error>) -> Void) {
        
        guard let result = result else {
            // If there is no result, then the completion will tell the app that there is an error
            completion(.failure(AppError.unkownError))
            return
        }
        
        // If there is a result then we have to swith result and check data sucess or the error
        switch result {
        case .success(let data):
            let decoder = JSONDecoder()
            // What is happening is that we are getting our response which we decode into the apiresponse, we then pass the generic T which will hold the any type data that we recieve from the backend
            guard let response = try? decoder.decode(APIResponse<T>.self, from: data) else {
                // if we didnt get data then the decoding wasnt a success and the completion handler will throw an error
                completion(.failure(AppError.errorDecoding))
                return
            }
            // else if we get data, we check whether it decode with an error or with the correct data
            if let error = response.error {
                completion(.failure(AppError.serverError(error)))
                return
            }
            // Check whether there is actual data
            // the varibale decodedData is of type T, which is the generic that takes any type in our ApiResponse struct
            if let decodedData = response.data {
                completion(.success(decodedData))
            } else {
                completion(.failure(AppError.errorDecoding))
            }
        case .failure(let error):
            completion(.failure(error))
        }
    }
}
