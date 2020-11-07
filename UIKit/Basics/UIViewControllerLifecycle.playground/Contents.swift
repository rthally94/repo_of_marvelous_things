//:A breakdown of the UIViewController Lifecycle.

import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    /// Creates the view that the controller manages. Only called when created programatically
    override func loadView() {
        super.loadView()
        
        print("Load view")
    }
    
    
    /// Loads the view controller's view if it has not already been set
    override func loadViewIfNeeded() {
        super.loadViewIfNeeded()
        
        print("Load view if needed")
    }
    
    /// Called once the view is loaded. Use to initialize the interface, load data, etc.
    /// If created in code, called after loadView()
    /// If unarchived from a nib, called after view is set
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("View did load")
    }
    
    /// Called every time the view is about to appear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("View will appear")
    }
    
    /// Called just before the vc's view is about to call layoutSubviews()
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        print("View will layout subviews")
    }
    
    /// Called just after the vc's view called layoutSubviews()
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        print("View did layout subviews")
    }
    
    /// Called when the view has fully transitioned on screen
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("View did appear")
    }
    
    /// Called just before the vc's view is to be removed from the view hiearchy
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("View will disappear")
    }
    
    /// Called just after the vc's view is removed from the view hiearchy
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("View did disappear")
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
