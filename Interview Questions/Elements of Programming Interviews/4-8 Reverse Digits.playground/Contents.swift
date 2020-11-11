import Foundation

// Naive Solution

/// Reverses the digits of a given number, maintaining the positive/negative state
/// - Parameter x: The number to reverse
/// - Returns: The reversed number
func reverseDigitsNaive(x: Int) -> Int {
    let str = String(abs(x))
    
    let reversed = Int(String(str.reversed())) ?? 0
    return x < 0 ? reversed * -1 : reversed
}


/// Reverses the digits of a given number, maintaining the positive/negative state without converting to/from a string
/// - Parameter x: The number to reverse
/// - Returns: The reversed number
func reverseDigitsBetter(x: Int) -> Int {
    var x = x
    var result = 0
    
    while x != 0 {
        // Offset the result and add the least significant digit of x
        result = result * 10 + x % 10
        
        // Move to the next significant digit
        x /= 10
    }
    
    return result
}

reverseDigitsNaive(x: 21) == 12
reverseDigitsNaive(x: -123) == -321

reverseDigitsBetter(x: 21) == 12
reverseDigitsBetter(x: -123) == -321
