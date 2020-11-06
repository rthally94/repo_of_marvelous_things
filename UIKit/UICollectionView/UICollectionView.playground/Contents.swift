//: Basic configuration of a UICollectionView. Includes DataSource, Delegate, and UICollectionViewCell
  
import UIKit
import PlaygroundSupport

// 1. Configure the View Controller to display a UICollectionView
class MyViewController : UIViewController {
    override func loadView() {
        // 1a. Create a new UICollectionView with a simple Flow Layout
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        
        // 1b. Assign the necessary delegate and data source
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // 1c. Register a cell(s) to use via reuse
        collectionView.register(TextCell.self, forCellWithReuseIdentifier: TextCell.reuseIdentifer)
        
        // 1d. Configure the ViewController for display
        // Assign the configured CollectionView as the view of the ViewController
        self.view = view
        // Set the background to white so it is visible (since it is the root view)
        self.view.backgroundColor = .white
    }
}

// 2. Conform to the UICollectionViewDataSource protocol - specifies how the collection will display data
extension MyViewController: UICollectionViewDataSource {
    // 2a. Sepcify the number of sections (optional - defaults to 1)
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    // 2b. Specify the number of rows in each section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    // 2c. Specify and configure a cell to display at the desired IndexPath (section, row)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TextCell.reuseIdentifer, for: indexPath) as? TextCell else { fatalError("Cannot dequeue TextCell") }
        cell.titleLabel.text = "\(indexPath.row)"
        return cell
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
    }
    
    // 4d. Required by the compiler to use with Storyboards.
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
