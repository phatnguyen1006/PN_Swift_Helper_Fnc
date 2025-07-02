import Foundation

// MARK: - Factorial Helper Function

/**
 Calculates the factorial of a given number.
 
 The factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
 Mathematically represented as n! = n × (n-1) × (n-2) × ... × 2 × 1
 
 - Parameter n: The non-negative integer for which to calculate the factorial
 - Returns: The factorial of n as an integer. Returns 0 for negative inputs, and 1 for n = 0 or n = 1
 
 - Note: For large values of n, this function may cause integer overflow
 - Complexity: O(n) time complexity, O(1) space complexity
 
 **Examples:**
 ```swift
 factorial(0) // Returns 1
 factorial(1) // Returns 1
 factorial(5) // Returns 120 (5 × 4 × 3 × 2 × 1)
 factorial(-1) // Returns 0 (invalid input)
 ```
 */
func factorial(_ n: Int) -> Int {
    guard n >= 0 else { return 0 }
    guard n > 1 else { return 1 }
    
    var result = 1
    for i in 2...n {
        result *= i
    }
    return result
}

// MARK: - Arrangement Functions

/**
 Calculates the number of arrangements (permutations) of r items selected from n items.
 
 An arrangement is a selection of items where the order matters. This function calculates nPr,
 which represents the number of ways to arrange r items from a set of n items.
 
 The mathematical formula used is: nPr = n! / (n-r)!
 
 - Parameter n: The total number of items to choose from (must be non-negative)
 - Parameter r: The number of items to arrange (must be non-negative and ≤ n)
 - Returns: The number of possible arrangements as an integer. Returns 0 for invalid inputs
 
 - Note: This function uses factorial calculations, which may cause overflow for large inputs
 - Complexity: O(n) time complexity due to factorial calculations
 
 **Examples:**
 ```swift
 arrangement(n: 5, r: 3) // Returns 60 (5!/(5-3)! = 120/2 = 60)
 arrangement(n: 4, r: 2) // Returns 12 (4!/(4-2)! = 24/2 = 12)
 arrangement(n: 3, r: 0) // Returns 1 (by definition)
 arrangement(n: 2, r: 3) // Returns 0 (invalid: r > n)
 ```
 */
func arrangement(n: Int, r: Int) -> Int {
    guard n >= 0 && r >= 0 else { return 0 }
    guard r <= n else { return 0 }
    
    if r == 0 { return 1 }
    
    // nPr = n! / (n-r)!
    return factorial(n) / factorial(n - r)
}

/**
 Calculates the number of arrangements (permutations) using an iterative approach.
 
 This is a more efficient alternative to the factorial-based arrangement function,
 especially for large values of n, as it avoids calculating full factorials.
 
 The calculation is performed as: n × (n-1) × (n-2) × ... × (n-r+1)
 
 - Parameter n: The total number of items to choose from (must be non-negative)
 - Parameter r: The number of items to arrange (must be non-negative and ≤ n)
 - Returns: The number of possible arrangements as an integer. Returns 0 for invalid inputs
 
 - Note: More efficient than factorial-based calculation for large numbers
 - Complexity: O(r) time complexity, O(1) space complexity
 
 **Examples:**
 ```swift
 arrangementIterative(n: 5, r: 3) // Returns 60 (5 × 4 × 3)
 arrangementIterative(n: 4, r: 2) // Returns 12 (4 × 3)
 arrangementIterative(n: 10, r: 3) // Returns 720 (10 × 9 × 8)
 ```
 */
func arrangementIterative(n: Int, r: Int) -> Int {
    guard n >= 0 && r >= 0 else { return 0 }
    guard r <= n else { return 0 }
    
    if r == 0 { return 1 }
    
    var result = 1
    for i in 0..<r {
        result *= (n - i)
    }
    return result
}

/**
 Generates all possible arrangements of r items from the given array.
 
 This function returns all possible ways to select and arrange r items from the input array,
 where order matters. Each arrangement is represented as an array of the selected items.
 
 - Parameter array: The source array containing items to arrange (can be of any type T)
 - Parameter r: The number of items to include in each arrangement (must be > 0 and ≤ array.count)
 - Returns: A 2D array where each sub-array represents one possible arrangement
 
 - Note: The number of arrangements returned will be equal to nPr where n = array.count
 - Complexity: O(nPr × r) time complexity, O(nPr × r) space complexity
 
 **Examples:**
 ```swift
 generateArrangements(["A", "B", "C"], r: 2)
 // Returns [["A", "B"], ["A", "C"], ["B", "A"], ["B", "C"], ["C", "A"], ["C", "B"]]
 
 generateArrangements([1, 2, 3], r: 1)
 // Returns [[1], [2], [3]]
 
 generateArrangements(["X", "Y"], r: 2)
 // Returns [["X", "Y"], ["Y", "X"]]
 ```
 */
func generateArrangements<T>(_ array: [T], r: Int) -> [[T]] {
    guard r > 0 && r <= array.count else { return [] }
    
    if r == 1 {
        return array.map { [$0] }
    }
    
    var arrangements: [[T]] = []
    
    for i in 0..<array.count {
        let element = array[i]
        let remaining = Array(array[0..<i] + array[(i+1)...])
        let subArrangements = generateArrangements(remaining, r: r - 1)
        
        for subArrangement in subArrangements {
            arrangements.append([element] + subArrangement)
        }
    }
    
    return arrangements
}

// MARK: - Combination Functions

/**
 Calculates the number of combinations of r items selected from n items.
 
 A combination is a selection of items where the order does not matter. This function calculates nCr,
 which represents the number of ways to choose r items from a set of n items without regard to order.
 
 The mathematical formula used is: nCr = n! / (r! × (n-r)!)
 
 - Parameter n: The total number of items to choose from (must be non-negative)
 - Parameter r: The number of items to select (must be non-negative and ≤ n)
 - Returns: The number of possible combinations as an integer. Returns 0 for invalid inputs
 
 - Note: This function uses factorial calculations and applies optimization by using min(r, n-r)
 - Complexity: O(n) time complexity due to factorial calculations
 
 **Examples:**
 ```swift
 combination(n: 5, r: 3) // Returns 10 (same as choosing 2 from 5)
 combination(n: 4, r: 2) // Returns 6
 combination(n: 3, r: 0) // Returns 1 (by definition)
 combination(n: 5, r: 5) // Returns 1 (only one way to choose all items)
 combination(n: 2, r: 3) // Returns 0 (invalid: r > n)
 ```
 */
func combination(n: Int, r: Int) -> Int {
    guard n >= 0 && r >= 0 else { return 0 }
    guard r <= n else { return 0 }
    
    if r == 0 || r == n { return 1 }
    
    // Use the smaller of r and n-r for efficiency
    let k = min(r, n - r)
    
    // nCr = n! / (r! * (n-r)!)
    return factorial(n) / (factorial(k) * factorial(n - k))
}

/**
 Calculates the number of combinations using an iterative approach.
 
 This is a more efficient alternative to the factorial-based combination function,
 especially for large values of n, as it avoids calculating full factorials.
 Uses the optimization nCr = nC(n-r) to minimize calculations.
 
 The calculation is performed iteratively to avoid large intermediate values.
 
 - Parameter n: The total number of items to choose from (must be non-negative)
 - Parameter r: The number of items to select (must be non-negative and ≤ n)
 - Returns: The number of possible combinations as an integer. Returns 0 for invalid inputs
 
 - Note: More efficient and numerically stable than factorial-based calculation
 - Complexity: O(min(r, n-r)) time complexity, O(1) space complexity
 
 **Examples:**
 ```swift
 combinationIterative(n: 5, r: 3) // Returns 10
 combinationIterative(n: 10, r: 3) // Returns 120
 combinationIterative(n: 20, r: 2) // Returns 190
 ```
 */
func combinationIterative(n: Int, r: Int) -> Int {
    guard n >= 0 && r >= 0 else { return 0 }
    guard r <= n else { return 0 }
    
    if r == 0 || r == n { return 1 }
    
    // Use the smaller of r and n-r for efficiency
    let k = min(r, n - r)
    
    var result = 1
    for i in 0..<k {
        result = result * (n - i) / (i + 1)
    }
    return result
}

/**
 Generates all possible combinations of r items from the given array.
 
 This function returns all possible ways to select r items from the input array,
 where order does not matter. Each combination is represented as an array of the selected items.
 The combinations are generated in lexicographic order based on the original array indices.
 
 - Parameter array: The source array containing items to combine (can be of any type T)
 - Parameter r: The number of items to include in each combination (must be > 0 and ≤ array.count)
 - Returns: A 2D array where each sub-array represents one possible combination
 
 - Note: The number of combinations returned will be equal to nCr where n = array.count
 - Complexity: O(nCr × r) time complexity, O(nCr × r) space complexity
 
 **Examples:**
 ```swift
 generateCombinations(["A", "B", "C"], r: 2)
 // Returns [["A", "B"], ["A", "C"], ["B", "C"]]
 
 generateCombinations([1, 2, 3, 4], r: 3)
 // Returns [[1, 2, 3], [1, 2, 4], [1, 3, 4], [2, 3, 4]]
 
 generateCombinations(["X", "Y"], r: 1)
 // Returns [["X"], ["Y"]]
 ```
 */
func generateCombinations<T>(_ array: [T], r: Int) -> [[T]] {
    guard r > 0 && r <= array.count else { return [] }
    
    if r == 1 {
        return array.map { [$0] }
    }
    
    if r == array.count {
        return [array]
    }
    
    var combinations: [[T]] = []
    
    for i in 0...(array.count - r) {
        let element = array[i]
        let remaining = Array(array[(i+1)...])
        let subCombinations = generateCombinations(remaining, r: r - 1)
        
        for subCombination in subCombinations {
            combinations.append([element] + subCombination)
        }
    }
    
    return combinations
}

// MARK: - Usage Examples

// MARK: - Arrangement Examples
print("=== ARRANGEMENTS (Order Matters) ===")

// Example 1: Calculate nPr
let n = 5
let r = 3
print("Arrangements of \(r) items from \(n) items: \(arrangement(n: n, r: r))")
print("Using iterative method: \(arrangementIterative(n: n, r: r))")

// Example 2: Generate all arrangements
let letters = ["A", "B", "C", "D"]
let arrangements = generateArrangements(letters, r: 2)
print("\nAll arrangements of 2 letters from \(letters):")
for arr in arrangements {
    print(arr.joined())
}

// Example 3: Numbers
let numbers = [1, 2, 3, 4]
let numberArrangements = generateArrangements(numbers, r: 3)
print("\nAll arrangements of 3 numbers from \(numbers):")
for arr in numberArrangements {
    print(arr.map(String.init).joined(separator: ", "))
}

// MARK: - Combination Examples
print("\n=== COMBINATIONS (Order Doesn't Matter) ===")

// Example 1: Calculate nCr
print("Combinations of \(r) items from \(n) items: \(combination(n: n, r: r))")
print("Using iterative method: \(combinationIterative(n: n, r: r))")

// Example 2: Generate all combinations
let combinations = generateCombinations(letters, r: 2)
print("\nAll combinations of 2 letters from \(letters):")
for combo in combinations {
    print(combo.joined())
}

// Example 3: Numbers
let numberCombinations = generateCombinations(numbers, r: 3)
print("\nAll combinations of 3 numbers from \(numbers):")
for combo in numberCombinations {
    print(combo.map(String.init).joined(separator: ", "))
}

// MARK: - Comparison Examples
print("\n=== COMPARISON ===")
let testN = 4
let testR = 2
print("For n=\(testN), r=\(testR):")
print("Arrangements (nPr): \(arrangement(n: testN, r: testR))")
print("Combinations (nCr): \(combination(n: testN, r: testR))")

// Pascal's Triangle example
print("\nPascal's Triangle (first 6 rows using combinations):")
for i in 0...5 {
    var row = ""
    for j in 0...i {
        row += "\(combination(n: i, r: j)) "
    }
    print("Row \(i): \(row)")
}
