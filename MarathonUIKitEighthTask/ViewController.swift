import UIKit

final class ViewController: UIViewController {

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 1500)
        scrollView.backgroundColor = .white
        return scrollView
    }()

    private lazy var avatarImage: UIImageView = {
        let avatarImage = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
        avatarImage.clipsToBounds = true
        return avatarImage
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = scrollView
        setupUI()

    }

    private func setupUI(){
        title = "Avatar"
        guard let navigationBar = navigationController?.navigationBar else { return }
        for subview in navigationBar.subviews {
            if NSStringFromClass(subview.classForCoder).contains("UINavigationBarLargeTitleView") {

                subview.addSubview(avatarImage)

                avatarImage.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    avatarImage.trailingAnchor.constraint(equalTo: subview.trailingAnchor,
                                                       constant: -16),
                    avatarImage.topAnchor.constraint(equalTo: subview.bottomAnchor, constant: 16),
                    avatarImage.bottomAnchor.constraint(equalTo: avatarImage.superview?.bottomAnchor ?? navigationBar.bottomAnchor, constant: -10),
                    avatarImage.heightAnchor.constraint(equalToConstant: 36),
                    avatarImage.widthAnchor.constraint(equalToConstant: 36)
                ])
            }
        }
    }
}



