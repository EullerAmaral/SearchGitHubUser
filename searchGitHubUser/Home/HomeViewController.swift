import UIKit

class HomeViewController: UIViewController {

    var homeScreen: HomeScreen?
    //var gitHubAPI = GitHubAPI()
    
    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeScreen?.delegate = self
        dismissKeyboard()
    }
    
    func dismissKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
}

extension HomeViewController: HomeScreenDelegate {
    func searchButtonAction() {

        if let user = homeScreen?.userTextField.text {
            GitHubAPI.shared.getUser(for: user) { [weak self] result in
                switch result {
                case.success(let gitHubUserData):
                    DispatchQueue.main.async {
                        let vc = UserProfileViewController(gitHubModel: gitHubUserData)
                        self?.navigationController?.pushViewController(vc, animated: true)
                    }
                case .failure(_):
                    break
                }
            }
        }
    }
}
