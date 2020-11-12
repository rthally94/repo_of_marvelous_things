import Foundation


/// A naive implementation to describe a 2D array in clockwise spiral order
/// - Parameters:
///   - A: The array to transform
///   - offset: Optional - The depth into the array, used for recursion
/// - Returns: The transformed array
func spiralOrderingNaive(_ A: [[Int]], offset: Int = 0) -> [Int] {
    var result = [Int]()

    if offset == A.count-1-offset {
        // Is odd matrix, return the center
        return [A[offset][offset]]
    } else if offset > A.count-1-offset {
        return []
    }
    
    // Get first row
    for i in (0+offset)..<(A.count-1-offset) {
        result.append(A[offset][i])
    }
    
    // Get last column
    for j in (0+offset)..<(A.count-1-offset) {
        result.append(A[j][A.count-1-offset])
    }
    
    // Get last row
    for k in stride(from: A.count-1-offset, to: offset, by: -1) {
        result.append(A[A.count-1-offset][k])
    }
    
    // Get first column
    for l in stride(from: A.count-1-offset, to: offset, by: -1) {
        result.append(A[l][offset])
    }

    return result + spiralOrderingNaive(A, offset: offset+1)
}

//spiralOrderingNaive([[1,2,3], [4,5,6], [7,8,9]])
spiralOrderingNaive([[1,2,3,4], [5,6,7,8], [9,10,11,12], [13,14,15,16]])
