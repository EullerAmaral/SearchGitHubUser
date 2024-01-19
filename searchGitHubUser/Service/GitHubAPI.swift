import UIKit

class GitHubAPI: UIViewController {

    static let shared = GitHubAPI()
    
    var gitHubModel: GitHubModel?
    
    func getUser(for user: String, completion: @escaping(Result<GitHubModel, Error>) -> Void) {
        
        let endPoint: String = "https://api.github.com/users/\(user)"
        
        guard let url: URL = URL(string: endPoint) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("Empty Response")
                return
            }
            
            print(response.statusCode)
            
            if let data = data {
                do {
                    let json = try JSONDecoder().decode(GitHubModel.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(json))
                        print(json.bio)
                    }
                }
                catch {
                    completion(.failure(error))
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
        
    }

}
