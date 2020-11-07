//: Continuation of UICollectionView with an implementation of UICollectionViewDiffableDataSource
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    // Hold a reference to the data source to apply updates later (Collection view has a weak reference.)
    private var diffableDataSource: UICollectionViewDiffableDataSource<Int, Int>!
    
    override func loadView() {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.delegate = self
        collectionView.register(TextCell.self, forCellWithReuseIdentifier: TextCell.reuseIdentifer)
        
        /*
        1.  Implement UICollectionViewDataSource. Takes Section and Item Identifiers as generic parameters. Initializer takes a
            UICollectionView and a cell provider closure (equalivelent to "cellForRowAt:indexPath:")
            Assign to a seperate variable instead of directly to collection view, since UICollectionView.dataSource has
            a **weak** referece and
            will imediately deallocate.
        */
        diffableDataSource = UICollectionViewDiffableDataSource<Int, Int>(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifer: Int) -> UICollectionViewCell? in
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TextCell.reuseIdentifer, for: indexPath) as? TextCell else { return nil }
            cell.titleLabel.text = "\(itemIdentifer)"
            return cell
        }
        
        // Assign data source to collection view.
        collectionView.dataSource = diffableDataSource
        
        self.view = collectionView
        self.view.backgroundColor = .white
    }
    
    // Load the data once the view is configured.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load some data to a NSDiffableDataSourceSnapshot
        var snapshot = NSDiffableDataSourceSnapshot<Int, Int>()
        snapshot.appendSections([0])
        snapshot.appendItems(Array(0..<10))
        
        diffableDataSource.apply(snapshot, animatingDifferences: true)
    }
}

// 3. Conform to the UICollectionViewDelegate protocol - specifies how the collection will respond to events
extension MyViewController: UICollectionViewDelegate {
    // 3a. Provides a response to an item tap (Optional)
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Tapped: Section(\(indexPath.section)), Row(\(indexPath.row))")
    }
}

// 4. Provide a cell to display in the collection view.
class TextCell: UICollectionViewCell {
    // 4a. Providing a static reuse identifier unique to the cell simplifies configuration
    static let reuseIdentifer: String = "TextCell"
    
    // 4b. Create a simple label to display some text.
    //     Closure instantiation contains the label cofiguration to block for better orgainization
    var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    // 4c. Override the instantiation to configure view hiearchy and autolayout.
    override init(frame: CGRect) {
        // Don't forget to initialize the superclass
        super.init(frame: frame)
        
        // Add the label to the view hiearchy and enable autolayout (TAMIC = false)
        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure layout constraints (Top, Leading, Bottom, Trailing)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        self.backgroundColor = .red
    }
    
    // 4d. Required by the compiler to use with Storyboards.
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
