import Foundation

protocol RepositoryProtocol {
    func fetchDatas(in city: City, completion: @escaping (Result<Weather, Error>) -> Void)
}

final class Repository: RepositoryProtocol {
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    func fetchDatas(in city: City, completion: @escaping (Result<Weather, Error>) -> Void) {
        let url = URL(string: "https://wttr.in/\(city.rawValue)?format=4&m")!
        dataTask =
          defaultSession.dataTask(with: url) { [weak self] data, response, error in
          defer {  self?.dataTask = nil }
          DispatchQueue.main.async {
            guard let response = response as? HTTPURLResponse,
                response.statusCode == 200, let data = data,
                let string = String.init(data: data, encoding: .utf8)
            else {
                if let error = error {
                    completion(.failure(error))
                }
                return
            }
              let componant = string.components(separatedBy: " ").filter { !$0.isEmpty }
            let object = Weather(
                city: componant[0].replacingOccurrences(of: ":", with: ""),
                status: componant[1],
                temperature: componant[2],
                windSpeed: componant[3]
            )
            completion(.success(object))
            }
              
        }
        dataTask?.resume()
    }
}
