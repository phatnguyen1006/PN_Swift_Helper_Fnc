import Foundation

// MARK: - Factorial Helper Function
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

// Calculate nPr (arrangements/permutations of r items from n items)
func arrangement(n: Int, r: Int) -> Int {
    guard n >= 0 && r >= 0 else { return 0 }
    guard r <= n else { return 0 }
    
    if r == 0 { return 1 }
    
    // nPr = n! / (n-r)!
    return factorial(n) / factorial(n - r)
}

// Alternative implementation using iterative approach (more efficient for large numbers)
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

// Generate all possible arrangements of an array
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

// MARK: - Usage Examples

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
