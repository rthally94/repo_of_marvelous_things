import Foundation

// Naive Solution

/// Compute x raised to the y power
///
/// - Complexity: O(y-1)
/// - Parameters:
///   - x: The base of the power equation
///   - y: The power to compute
/// - Returns: The result of x raised to the y power
func computePow(_ x: Double, _ y: Int) -> Double {
    if y == 0 {
        return 1
    }
    
    return x * computePow(x, y-1)
}

computePow(2, 2) == 4
computePow(2, 3) == 8
computePow(3, 3) == 27
