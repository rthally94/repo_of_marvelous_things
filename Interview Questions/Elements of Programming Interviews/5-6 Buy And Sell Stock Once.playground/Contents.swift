import Foundation

/// A naive implementation to compute the maximum profit buying and selling only once.
///
/// - Complexity: O(n2)
/// - Parameter A: The array of stock prices
/// - Returns: The maximum profit
func buyAndSellStockOnceNaive(_ A: [Int]) -> Int {
    var maxProfit = 0
    
    for i in 0..<A.count-1 {
        for j in i+1..<A.count {
            if A[j] - A[i] > maxProfit {
                maxProfit = A[j] - A[i]
            }
        }
    }
    
    return maxProfit
}

let test1 = [310, 315, 275, 295, 260, 270, 290, 230, 255, 250]

buyAndSellStockOnceNaive(test1)
