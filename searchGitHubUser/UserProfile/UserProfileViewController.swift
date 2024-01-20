import UIKit

class UserProfileViewController: UIViewController {

    var userProfileScreen: UserProfileScreen?
    
    override func loadView() {
        userProfileScreen = UserProfileScreen()
        view = userProfileScreen
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
