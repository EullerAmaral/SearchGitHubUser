import UIKit

protocol HomeScreenDelegate: AnyObject {
    func searchButtonAction()
}

class HomeScreen: UIView {
    
    var delegate: HomeScreenDelegate?
    
    lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 15
        stack.distribution = .equalSpacing
        return stack
    }()
    
    lazy var gitHubImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "GitHubLogo")
        image.contentMode = .scaleAspectFit
        image.heightAnchor.constraint(equalToConstant: 150).isActive = true
        return image
    }()
    
    lazy var userTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "User GitHub"
        textField.autocorrectionType = .no
        textField.keyboardType = .default
        textField.clipsToBounds = true
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 4
        textField.layer.borderWidth = 0.5
        //textField.layer.borderColor
        textField.backgroundColor = .white
        return textField
    }()

    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.setTitle("Search", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func searchButtonTapped() {
        delegate?.searchButtonAction()
        print("Teste delegate2")
    }
    
    private func addAllElements() {
        addSubview(stack)
        stack.addArrangedSubview(gitHubImage)
        stack.addArrangedSubview(userTextField)
        stack.addArrangedSubview(searchButton)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addAllElements()
        setupConstraints()
        backgroundColor = .systemGray6
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            stack.centerXAnchor.constraint(equalTo: centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: centerYAnchor),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
    }
}
