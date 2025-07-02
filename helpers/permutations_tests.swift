import XCTest

class ArrangementCombinationTests: XCTestCase {
    
    // MARK: - Factorial Tests
    
    func testFactorial() {
        // Test basic cases
        XCTAssertEqual(factorial(0), 1, "0! should equal 1")
        XCTAssertEqual(factorial(1), 1, "1! should equal 1")
        XCTAssertEqual(factorial(2), 2, "2! should equal 2")
        XCTAssertEqual(factorial(3), 6, "3! should equal 6")
        XCTAssertEqual(factorial(4), 24, "4! should equal 24")
        XCTAssertEqual(factorial(5), 120, "5! should equal 120")
        XCTAssertEqual(factorial(6), 720, "6! should equal 720")
        
        // Test negative input
        XCTAssertEqual(factorial(-1), 0, "Factorial of negative number should return 0")
        XCTAssertEqual(factorial(-5), 0, "Factorial of negative number should return 0")
    }
    
    // MARK: - Arrangement Tests
    
    func testArrangement() {
        // Test basic cases
        XCTAssertEqual(arrangement(n: 5, r: 3), 60, "P(5,3) should equal 60")
        XCTAssertEqual(arrangement(n: 4, r: 2), 12, "P(4,2) should equal 12")
        XCTAssertEqual(arrangement(n: 3, r: 1), 3, "P(3,1) should equal 3")
        XCTAssertEqual(arrangement(n: 5, r: 5), 120, "P(5,5) should equal 120")
        
        // Test edge cases
        XCTAssertEqual(arrangement(n: 5, r: 0), 1, "P(n,0) should equal 1")
        XCTAssertEqual(arrangement(n: 0, r: 0), 1, "P(0,0) should equal 1")
        
        // Test invalid inputs
        XCTAssertEqual(arrangement(n: 3, r: 5), 0, "P(3,5) should return 0 (r > n)")
        XCTAssertEqual(arrangement(n: -1, r: 2), 0, "Negative n should return 0")
        XCTAssertEqual(arrangement(n: 5, r: -1), 0, "Negative r should return 0")
    }
    
    func testArrangementIterative() {
        // Test that iterative method gives same results as factorial method
        let testCases = [(5, 3), (4, 2), (6, 4), (3, 1), (7, 0), (5, 5)]
        
        for (n, r) in testCases {
            let factorialResult = arrangement(n: n, r: r)
            let iterativeResult = arrangementIterative(n: n, r: r)
            XCTAssertEqual(factorialResult, iterativeResult, 
                          "Factorial and iterative methods should give same result for P(\(n),\(r))")
        }
        
        // Test specific values
        XCTAssertEqual(arrangementIterative(n: 5, r: 3), 60, "P(5,3) should equal 60")
        XCTAssertEqual(arrangementIterative(n: 10, r: 2), 90, "P(10,2) should equal 90")
        
        // Test edge cases
        XCTAssertEqual(arrangementIterative(n: 0, r: 0), 1, "P(0,0) should equal 1")
        XCTAssertEqual(arrangementIterative(n: 5, r: 0), 1, "P(n,0) should equal 1")
        
        // Test invalid inputs
        XCTAssertEqual(arrangementIterative(n: 2, r: 5), 0, "P(2,5) should return 0")
    }
    
    func testGenerateArrangements() {
        // Test with strings
        let letters = ["A", "B", "C"]
        let arrangements2 = generateArrangements(letters, r: 2)
        XCTAssertEqual(arrangements2.count, 6, "Should generate 6 arrangements of 2 from 3")
        
        // Check specific arrangements
        let expectedArrangements = [
            ["A", "B"], ["A", "C"], ["B", "A"], 
            ["B", "C"], ["C", "A"], ["C", "B"]
        ]
        XCTAssertEqual(Set(arrangements2.map { $0.joined() }), 
                      Set(expectedArrangements.map { $0.joined() }),
                      "Should contain all expected arrangements")
        
        // Test with numbers
        let numbers = [1, 2, 3]
        let arrangements1 = generateArrangements(numbers, r: 1)
        XCTAssertEqual(arrangements1.count, 3, "Should generate 3 arrangements of 1 from 3")
        XCTAssertEqual(arrangements1, [[1], [2], [3]], "Single element arrangements")
        
        // Test edge cases
        let emptyResult = generateArrangements([1, 2], r: 0)
        XCTAssertTrue(emptyResult.isEmpty, "r=0 should return empty array")
        
        let invalidResult = generateArrangements([1, 2], r: 3)
        XCTAssertTrue(invalidResult.isEmpty, "r > n should return empty array")
        
        // Test full arrangement
        let fullArrangement = generateArrangements([1, 2], r: 2)
        XCTAssertEqual(fullArrangement.count, 2, "Should generate 2 arrangements")
        XCTAssertTrue(fullArrangement.contains([1, 2]), "Should contain [1, 2]")
        XCTAssertTrue(fullArrangement.contains([2, 1]), "Should contain [2, 1]")
    }
    
    // MARK: - Combination Tests
    
    func testCombination() {
        // Test basic cases
        XCTAssertEqual(combination(n: 5, r: 3), 10, "C(5,3) should equal 10")
        XCTAssertEqual(combination(n: 4, r: 2), 6, "C(4,2) should equal 6")
        XCTAssertEqual(combination(n: 6, r: 4), 15, "C(6,4) should equal 15")
        XCTAssertEqual(combination(n: 3, r: 1), 3, "C(3,1) should equal 3")
        
        // Test symmetry property: C(n,r) = C(n,n-r)
        XCTAssertEqual(combination(n: 5, r: 2), combination(n: 5, r: 3), "C(5,2) should equal C(5,3)")
        XCTAssertEqual(combination(n: 6, r: 1), combination(n: 6, r: 5), "C(6,1) should equal C(6,5)")
        
        // Test edge cases
        XCTAssertEqual(combination(n: 5, r: 0), 1, "C(n,0) should equal 1")
        XCTAssertEqual(combination(n: 5, r: 5), 1, "C(n,n) should equal 1")
        XCTAssertEqual(combination(n: 0, r: 0), 1, "C(0,0) should equal 1")
        
        // Test invalid inputs
        XCTAssertEqual(combination(n: 3, r: 5), 0, "C(3,5) should return 0 (r > n)")
        XCTAssertEqual(combination(n: -1, r: 2), 0, "Negative n should return 0")
        XCTAssertEqual(combination(n: 5, r: -1), 0, "Negative r should return 0")
    }
    
    func testCombinationIterative() {
        // Test that iterative method gives same results as factorial method
        let testCases = [(5, 3), (4, 2), (6, 4), (3, 1), (7, 0), (5, 5), (8, 3)]
        
        for (n, r) in testCases {
            let factorialResult = combination(n: n, r: r)
            let iterativeResult = combinationIterative(n: n, r: r)
            XCTAssertEqual(factorialResult, iterativeResult, 
                          "Factorial and iterative methods should give same result for C(\(n),\(r))")
        }
        
        // Test specific values
        XCTAssertEqual(combinationIterative(n: 10, r: 3), 120, "C(10,3) should equal 120")
        XCTAssertEqual(combinationIterative(n: 7, r: 2), 21, "C(7,2) should equal 21")
        
        // Test symmetry
        XCTAssertEqual(combinationIterative(n: 8, r: 3), combinationIterative(n: 8, r: 5), 
                      "Should maintain symmetry property")
    }
    
    func testGenerateCombinations() {
        // Test with strings
        let letters = ["A", "B", "C", "D"]
        let combinations2 = generateCombinations(letters, r: 2)
        XCTAssertEqual(combinations2.count, 6, "Should generate 6 combinations of 2 from 4")
        
        // Check specific combinations (order shouldn't matter, but generation order is consistent)
        let expectedCombinations = [
            ["A", "B"], ["A", "C"], ["A", "D"],
            ["B", "C"], ["B", "D"], ["C", "D"]
        ]
        XCTAssertEqual(combinations2, expectedCombinations, "Should generate expected combinations in order")
        
        // Test with numbers
        let numbers = [1, 2, 3, 4]
        let combinations3 = generateCombinations(numbers, r: 3)
        XCTAssertEqual(combinations3.count, 4, "Should generate 4 combinations of 3 from 4")
        
        let expectedNumberCombinations = [
            [1, 2, 3], [1, 2, 4], [1, 3, 4], [2, 3, 4]
        ]
        XCTAssertEqual(combinations3, expectedNumberCombinations, "Should generate expected number combinations")
        
        // Test single element combinations
        let combinations1 = generateCombinations([1, 2, 3], r: 1)
        XCTAssertEqual(combinations1, [[1], [2], [3]], "Single element combinations")
        
        // Test full combination
        let fullCombination = generateCombinations([1, 2], r: 2)
        XCTAssertEqual(fullCombination, [[1, 2]], "Full combination should return original array")
        
        // Test edge cases
        let emptyResult = generateCombinations([1, 2], r: 0)
        XCTAssertTrue(emptyResult.isEmpty, "r=0 should return empty array")
        
        let invalidResult = generateCombinations([1, 2], r: 3)
        XCTAssertTrue(invalidResult.isEmpty, "r > n should return empty array")
    }
    
    // MARK: - Comparison Tests
    
    func testArrangementVsCombination() {
        // Arrangements should always be >= combinations for same n, r
        let testCases = [(4, 2), (5, 3), (6, 2), (3, 2)]
        
        for (n, r) in testCases {
            let arrangements = arrangement(n: n, r: r)
            let combinations = combination(n: n, r: r)
            XCTAssertGreaterThanOrEqual(arrangements, combinations, 
                                       "P(\(n),\(r)) should be >= C(\(n),\(r))")
        }
        
        // Special cases where they should be equal
        XCTAssertEqual(arrangement(n: 5, r: 1), combination(n: 5, r: 1), 
                      "P(n,1) should equal C(n,1)")
        XCTAssertEqual(arrangement(n: 3, r: 0), combination(n: 3, r: 0), 
                      "P(n,0) should equal C(n,0)")
    }
    
    // MARK: - Pascal's Triangle Test
    
    func testPascalsTriangle() {
        // Test first few rows of Pascal's triangle using combinations
        let expectedRows = [
            [1],                    // Row 0
            [1, 1],                 // Row 1
            [1, 2, 1],              // Row 2
            [1, 3, 3, 1],           // Row 3
            [1, 4, 6, 4, 1],        // Row 4
            [1, 5, 10, 10, 5, 1]    // Row 5
        ]
        
        for (rowIndex, expectedRow) in expectedRows.enumerated() {
            var actualRow: [Int] = []
            for j in 0...rowIndex {
                actualRow.append(combination(n: rowIndex, r: j))
            }
            XCTAssertEqual(actualRow, expectedRow, "Pascal's triangle row \(rowIndex) should match")
        }
    }
    
    // MARK: - Performance Tests
    
    func testPerformanceFactorialVsIterative() {
        // Test that iterative methods work for larger numbers where factorial might overflow
        let largeN = 20
        let largeR = 5
        
        // These should not crash or give wrong results
        let arrangeIterative = arrangementIterative(n: largeN, r: largeR)
        let combineIterative = combinationIterative(n: largeN, r: largeR)
        
        XCTAssertGreaterThan(arrangeIterative, 0, "Large arrangement calculation should work")
        XCTAssertGreaterThan(combineIterative, 0, "Large combination calculation should work")
        XCTAssertGreaterThan(arrangeIterative, combineIterative, "P(20,5) should be > C(20,5)")
    }
    
    // MARK: - Generic Type Tests
    
    func testGenericTypes() {
        // Test with different types
        struct TestItem: Equatable {
            let value: String
        }
        
        let items = [TestItem(value: "A"), TestItem(value: "B"), TestItem(value: "C")]
        let arrangements = generateArrangements(items, r: 2)
        let combinations = generateCombinations(items, r: 2)
        
        XCTAssertEqual(arrangements.count, 6, "Should work with custom types for arrangements")
        XCTAssertEqual(combinations.count, 3, "Should work with custom types for combinations")
        
        // Test with Character type
        let chars: [Character] = ["X", "Y", "Z"]
        let charCombinations = generateCombinations(chars, r: 2)
        XCTAssertEqual(charCombinations.count, 3, "Should work with Character type")
    }
}
