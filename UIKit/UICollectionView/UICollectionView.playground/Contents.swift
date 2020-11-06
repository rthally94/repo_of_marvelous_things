//: Basic configuration of a UICollectionView. Includes DataSource, Delegate, and UICollectionViewCell
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.delegate = self
        view.dataSource = self
        
        view.register(TextCell.self, forCellWithReuseIdentifier: TextCell.reuseIdentifer)
        
        view.backgroundColor = .white
        
        self.view = view
    }
}

extension MyViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TextCell.reuseIdentifer, for: indexPath) as? TextCell else { fatalError("Cannot dequeue TextCell") }
        cell.titleLabel.text = "\(indexPath.row)"
        return cell
    }
}

extension MyViewController: UICollectionViewDelegate {
    
}

class TextCell: UICollectionViewCell {
    static let reuseIdentifer: String = "TextCell"
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
