import Foundation

/// Randomly selects a set of values from the array of the desired size.
/// - Parameters:
///   - A: The array to select from
///   - size: The number of elements to select
/// - Returns: The selected set of values
func sampleOfflineDataNaive(_ A: [Int], of size: Int) -> [Int] {
    var A = A
    
    for i in 0..<size {
        let rand = Int.random(in: i..<A.count)
        A.swapAt(i, rand)
    }
    
    return Array(A[0..<size])
}

sampleOfflineDataNaive([3, 5, 7, 11], of: 3)
