//: UICollectionView using a standard data source and CompositionalLayout. Builds off UICollectionView Playground.
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    // 1. Create a function to define the layout
    private func collectionViewLayout() -> UICollectionViewLayout {
        // 1a. Configure the item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // 1b. Configure the group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // Add some spacing between items
        group.interItemSpacing = .flexible(10)
        
        // 1c. Configure the sections
        let section = NSCollectionLayoutSection(group: group)
        
        // Add some spacing between groups
        section.interGroupSpacing = 10
        
        // 1d. Configure the layout
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    override func loadView() {
        // 2. Apply the layout when creating the collection view
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(TextCell.self, forCellWithReuseIdentifier: TextCell.reuseIdentifer)
        self.view = collectionView
        self.view.backgroundColor = .white
    }
}


extension MyViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TextCell.reuseIdentifer, for: indexPath) as? TextCell else { fatalError("Cannot dequeue TextCell") }
        cell.titleLabel.text = "\(indexPath.row)"
        return cell
    }
}

extension MyViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Tapped: Section(\(indexPath.section)), Row(\(indexPath.row))")
    }
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
        
        self.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
