//: [Previous](@previous)

/*:
 ### `Example with URLSession`
 */
import Combine
import Foundation

enum ServiceError: Error {
    case url(URLError?)
    case decode
    case unknown(Error)
}

struct Item: Codable {
    let id: Int
    let title: String
    let completed: Bool
}

let urlRequest: URLRequest? = {
    var components = URLComponents()
    components.scheme = "https"
    components.host = "jsonplaceholder.typicode.com"
    components.path = "/todos/1"
    
    guard let url = components.url else { return nil }
    
    var urlRequest = URLRequest(url: url)
    urlRequest.timeoutInterval = 5.0
    return urlRequest
}()

func get() -> AnyPublisher<Item, ServiceError> {
    guard let request = urlRequest else {
        fatalError("request not available")
    }
    
    return URLSession.shared
        .dataTaskPublisher(for: request) // ((Data, URLResponse), URLError)
        .map { $0.data } // (Data, URLError)
        .decode(type: Item.self, decoder: JSONDecoder()) // (Item, Error)
        .mapError { error -> ServiceError in
            switch error {
            case is DecodingError: return ServiceError.decode
            case is URLError: return ServiceError.url(error as? URLError)
            default: return ServiceError.unknown(error)
            }
    }
    .retry(1)
    .eraseToAnyPublisher()
}

/*:
 Marking request
 */

get()
    .receive(on: RunLoop.main)
    .sink(receiveCompletion: { completion in
        switch completion {
        case .finished: print("🏁 finished")
        case .failure(let error): print("❗️ failure: \(error)")
        }
    }, receiveValue: { value in
        print("✅ value: \(value)")
    })
