import UIKit

class ViewController: UIViewController {
    
    private lazy var imageView = UIImageView(image: UIImage(systemName: "person.crop.circle.fill")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal))
    private lazy var scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Avatar"

        setupScrollView()
        setupImage()
    }
    
    private func setupScrollView() {
        scrollView.backgroundColor = .systemBackground
        scrollView.contentSize = .init(width: view.bounds.width, height: view.bounds.height * 2)
        view = scrollView
    }
    
    private func setupImage() {
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        guard let navigationBar = navigationController?.navigationBar else { return }
        
        for subview in navigationBar.subviews {
            if let labelView = subview.subviews.first(where: { $0 is UILabel }) {
                subview.addSubview(imageView)
                
                NSLayoutConstraint.activate([
                    imageView.heightAnchor.constraint(equalToConstant: 36),
                    imageView.widthAnchor.constraint(equalToConstant: 36),
                    imageView.trailingAnchor.constraint(equalTo: subview.trailingAnchor, constant: -16),
                    imageView.centerYAnchor.constraint(equalTo: labelView.centerYAnchor)
                ])
                return
            }
        }
    }
}
