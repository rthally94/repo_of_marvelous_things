import Foundation

/// Increments an aribatrairly large array representing an integer number by 1
///
/// - Complexity: O(n)
/// - Parameter A: The array to increment
/// - Returns: The incremented array
func incrementAnArbitraryPrecisionInteger(_ A: [Int]) -> [Int] {
    var A = A
    
    for i in stride(from: A.endIndex-1, through: 0, by: -1) {
        if A[i] < 9 {
            A[i] += 1
        } else {
            A[i] = 0
            if i == 0 {
                A.insert(1, at: 0)
            }
            continue
        }
        
        break
    }
    
    return A
}

incrementAnArbitraryPrecisionInteger([1,2,3]) == [1,2,4]
incrementAnArbitraryPrecisionInteger([1,2,9]) == [1,3,0]
incrementAnArbitraryPrecisionInteger([1,2,3,4,5,6,7,8,9]) == [1,2,3,4,5,6,7,9,0]
incrementAnArbitraryPrecisionInteger([9,9,9,9]) == [1,0,0,0,0]
