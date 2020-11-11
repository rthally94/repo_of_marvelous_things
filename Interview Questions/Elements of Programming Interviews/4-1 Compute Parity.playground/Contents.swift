import Foundation

// 1. Naive Solution

/// Calcualtes the parity bit of an integer by counting the number of 1 bits.
/// - Complexity
///     - O(n) where n is the number of bits
/// - Parameter x: The number to calculate parity for
/// - Returns: 1, if the number of 1 bits is odd, 0 if even
func calculateParity(_ x: Int) -> Int {
    var x = x
    var parity = 0
    
    // Loop over each bit
    while x != 0 {
        // parity = parity XOR (x AND 1)
        // XOR => Sets bit to 1 if a != b (Ex: Toggle)
        parity ^= (x & 1)
        
        // Shift x over 1 bit to the right
        x >>= 1
    }
    
    return parity
}

// 2. Optimized Solution

/// Calculates the parity bit of an ineger by computing the XOR
///
/// - Complexity: O(log n)
/// - Parameter x:The number to calculate parity for.
/// - Returns: 1, if the number of 1 bits is odd, 0 if even
///
/// - Note:
///     - 11010111 -> 1101 ^ 0111 = 1010
///     -        1010 ->     10 ^    10 =      00
///     -            00 ->       0 ^      0 =        0
func calculateBetterParity(_ x: Int) -> Int {
    var x = x
    x ^= x >> 32
    x ^= x >> 16
    x ^= x >> 8
    x ^= x >> 4
    x ^= x >> 2
    x ^= x >> 1
    return x & 1
}


/// A very swifty implementaion of parity calculation.
/// - Parameter x: The number to calculate parity for
/// - Returns: 1, if the number of 1 bits is odd, 0 if even
func swiftyParity(_ x: Int) -> Int {
    return x.nonzeroBitCount & 1
}

print(calculateParity(1) == 1)
print(calculateParity(2) == 1)
print(calculateParity(3) == 0)
print(calculateParity(4) == 1)
print(calculateParity(5) == 0)
print(calculateParity(6) == 0)
print(calculateParity(7) == 1)

print(calculateBetterParity(1) == 1)
print(calculateBetterParity(2) == 1)
print(calculateBetterParity(3) == 0)
print(calculateBetterParity(4) == 1)
print(calculateBetterParity(5) == 0)
print(calculateBetterParity(6) == 0)
print(calculateBetterParity(7) == 1)

