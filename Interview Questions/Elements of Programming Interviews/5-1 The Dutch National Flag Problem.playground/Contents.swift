import Foundation


/// A naive implemention of the Dutch Flag Partitioning algorithm
///
/// - Complexity: O(n2)
/// - Parameters:
///   - A: The array to partition
///   - pivot: The index of the pivot
/// - Returns: The partitioned array
func DutchFlagPartitionNaive(_ A: [Int], pivot: Int) -> [Int] {
    var A = A
    let pivot = A[pivot]
    
    for i in 0..<A.count {
        for j in i+1..<A.count {
            if A[j] < pivot {
                A.swapAt(i, j)
                break
            }
        }
    }
    
    for i in stride(from: A.count-1, through: 0, by: -1) {
        for j in stride(from: i-1, through: 0, by: -1) {
            if A[j] > pivot {
                A.swapAt(i, j)
                break
            }
        }
    }
    
    return A
}

/// A better implemention of the Dutch Flag Partitioning algorithm
///
/// - Complexity: O(n)
/// - Parameters:
///   - A: The array to partition
///   - pivot: The index of the pivot
/// - Returns: The partitioned array
func DutchFlagPartitionBetter(_ A: [Int], pivot: Int) -> [Int] {
    var A = A
    let pivot = A[pivot]
    
    var lower = 0
    for i in 0..<A.count {
        if A[i] < pivot {
            A.swapAt(i, lower)
            lower += 1
        }
    }
    
    var upper = A.count-1
    for i in stride(from: A.count-1, through: 0, by: -1) {
        if A[i] > pivot {
            A.swapAt(i, upper)
            upper -= 1
        }
    }
    
    return A
}

DutchFlagPartitionNaive([0,1,2,0,2,1,1], pivot: 1)
DutchFlagPartitionBetter([0,1,2,0,2,1,1], pivot: 1)
