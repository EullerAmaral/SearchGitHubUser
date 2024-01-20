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
        let vc = UserProfileViewController()
        navigationController?.pushViewController(vc, animated: true)
        if let user = homeScreen?.userTextField.text {
            GitHubAPI.shared.getUser(for: user) { [weak self] result in
                switch result {
                case.success(let gitHubUserData):
                    print(gitHubUserData)
                case .failure(_):
                    break
                }
            }
        }
    }
}
