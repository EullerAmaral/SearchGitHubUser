import UIKit

class UserProfileViewController: UIViewController {

    var userProfileScreen: UserProfileScreen?
    let gitHubModel: GitHubModel
    
    init(gitHubModel: GitHubModel) {
        self.gitHubModel = gitHubModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        userProfileScreen = UserProfileScreen()
        view = userProfileScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userProfileScreen?.displayGitHubUser(gitHubModel)
    }
}
