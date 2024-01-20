import UIKit

class UserProfileScreen: UIView {
    
    lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 15
        stack.distribution = .equalSpacing
        return stack
    }()
    
    lazy var userImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "GitHubLogo")
        image.contentMode = .scaleAspectFit
        image.heightAnchor.constraint(equalToConstant: 150).isActive = true
        return image
    }()
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Text"
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    lazy var idLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Text"
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    lazy var followersLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Text"
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    lazy var bioLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Text"
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    private func addAllElements() {
        addSubview(stack)
        stack.addArrangedSubview(userImage)
        stack.addArrangedSubview(loginLabel)
        stack.addArrangedSubview(idLabel)
        stack.addArrangedSubview(followersLabel)
        stack.addArrangedSubview(bioLabel)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray6
        addAllElements()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            //stack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 15),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
        
        ])
    }
}
