// Problem 1: FizzBuzz
// This program prints numbers from 1 to 100, replacing multiples of 3 with "Fizz", multiples of 5 with "Buzz", and multiples of both with "FizzBuzz".
for number in 1...100 {
    // Use a tuple to check divisibility by 3 and 5 simultaneously
    switch (number % 3 == 0, number % 5 == 0) {
    case (true, true):
        print("FizzBuzz")
    case (true, false):
        print("Fizz")
    case (false, true):
        print("Buzz")
    default:
        print(number)
    }
}

// Problem 2: Prime Numbers
// This program defines a function to check if a number is prime and then prints all prime numbers between 1 and 100.
func isPrime(_ number: Int) -> Bool {
    // Numbers less than or equal to 1 are not prime
    guard number > 1 else { return false }
    // Only need to check up to the square root of the number for efficiency
    for i in 2..<Int(Double(number).squareRoot()) + 1 {
        if number % i == 0 {
            return false
        }
    }
    return true
}

for number in 1...100 {
    if isPrime(number) {
        print(number)
    }
}

// Problem 3: Temperature Converter
// This program converts temperatures between Celsius, Fahrenheit, and Kelvin based on user input.

// Define conversion functions for temperature scales.
func celsiusToFahrenheit(_ celsius: Double) -> Double {
    return celsius * 9/5 + 32
}

func celsiusToKelvin(_ celsius: Double) -> Double {
    return celsius + 273.15
}

func fahrenheitToCelsius(_ fahrenheit: Double) -> Double {
    return (fahrenheit - 32) * 5/9
}

func fahrenheitToKelvin(_ fahrenheit: Double) -> Double {
    return (fahrenheit + 459.67) * 5/9
}

func kelvinToCelsius(_ kelvin: Double) -> Double {
    return kelvin - 273.15
}

func kelvinToFahrenheit(_ kelvin: Double) -> Double {
    return kelvin * 9/5 - 459.67
}

print("Enter temperature value:")
// Use guard to safely unwrap the optional input and convert it to a Double
guard let input = readLine(), let temperature = Double(input) else {
    print("Invalid input")
    exit(1)
}

print("Enter unit (C, F, or K):")
// Use optional chaining to safely access the uppercased unit
guard let unit = readLine()?.uppercased() else {
    print("Invalid input")
    exit(1)
}

// Perform temperature conversion based on input unit.
switch unit {
case "C":
    print("\(temperature)°C = \(celsiusToFahrenheit(temperature))°F")
    print("\(temperature)°C = \(celsiusToKelvin(temperature))K")
case "F":
    print("\(temperature)°F = \(fahrenheitToCelsius(temperature))°C")
    print("\(temperature)°F = \(fahrenheitToKelvin(temperature))K")
case "K":
    print("\(temperature)K = \(kelvinToCelsius(temperature))°C")
    print("\(temperature)K = \(kelvinToFahrenheit(temperature))°F")
default:
    print("Invalid unit")
}

// Problem 4: Shopping List Manager
// This program implements a simple shopping list manager with options to add, remove, display items, and exit.

var shoppingList: [String] = []

func displayMenu() {
    print("\nShopping List Manager")
    print("1. Add item")
    print("2. Remove item")
    print("3. Display list")
    print("4. Exit")
    print("Enter your choice:")
}

func addItem() {
    print("Enter item to add:")
    // Check if the input is not empty before adding to the list
    if let item = readLine(), !item.isEmpty {
        shoppingList.append(item)
        print("\(item) added to the list.")
    } else {
        print("Invalid input. Item not added.")
    }
}

func removeItem() {
    print("Enter item to remove:")
    // Use optional binding and firstIndex(of:) to find and remove the item
    if let item = readLine(), let index = shoppingList.firstIndex(of: item) {
        shoppingList.remove(at: index)
        print("\(item) removed from the list.")
    } else {
        print("Item not found in the list.")
    }
}

func displayList() {
    if shoppingList.isEmpty {
        print("Your shopping list is empty.")
    } else {
        print("Your shopping list:")
        // Use enumerated() to get both index and item for display
        for (index, item) in shoppingList.enumerated() {
            print("\(index + 1). \(item)")
        }
    }
}

// Main loop for the shopping list manager.
while true {
    displayMenu()
    // Use optional binding to safely unwrap and convert user input
    if let choice = readLine(), let option = Int(choice) {
        switch option {
        case 1:
            addItem()
        case 2:
            removeItem()
        case 3:
            displayList()
        case 4:
            print("Goodbye!")
            exit(0)
        default:
            print("Invalid option. Please try again.")
        }
    } else {
        print("Invalid input. Please enter a number.")
    }
}

// Problem 5: Word Frequency Counter
// This program counts and displays the frequency of each word in a given sentence.

import Foundation

print("Enter a sentence:")
guard let input = readLine() else {
    print("Invalid input")
    exit(1)
}

// Process the input sentence and count word frequencies.
// This line does several things:
// 1. Converts the input to lowercase
// 2. Removes all punctuation
// 3. Splits the string into an array of words
// 4. Filters out any empty strings
let words = input.lowercased().components(separatedBy: .punctuationCharacters).joined().components(separatedBy: .whitespaces).filter { !$0.isEmpty }

var wordFrequency: [String: Int] = [:]

// Count the frequency of each word using a dictionary
for word in words {
    // If the word doesn't exist in the dictionary, it's added with a default value of 0, then incremented
    wordFrequency[word, default: 0] += 1
}

print("\nWord frequencies:")
// Sort the dictionary by keys (words) and print each word with its frequency
for (word, count) in wordFrequency.sorted(by: { $0.key < $1.key }) {
    print("\(word): \(count)")
}

// Problem 6: Fibonacci Sequence
// This program generates and prints the Fibonacci sequence up to a specified number of elements.

func fibonacci(_ n: Int) -> [Int] {
    guard n > 0 else { return [] }
    var sequence = [0, 1]
    // Generate Fibonacci numbers until we reach the desired count
    while sequence.count < n {
        // Add the last two numbers to get the next Fibonacci number
        sequence.append(sequence[sequence.count - 1] + sequence[sequence.count - 2])
    }
    // Use prefix() to ensure we return exactly n elements
    return Array(sequence.prefix(n))
}

print("Enter the number of Fibonacci sequence elements to generate:")
if let input = readLine(), let n = Int(input) {
    let result = fibonacci(n)
    print("Fibonacci sequence of \(n) elements:")
    print(result)
} else {
    print("Invalid input")
}

// Problem 7: Grade Calculator
// This program calculates and displays statistics for a set of student grades.

var students: [String: Double] = [:]

print("Enter student names and scores (e.g., 'John 85'). Type 'done' when finished.")

// Input student names and scores.
while true {
    guard let input = readLine() else { continue }
    if input.lowercased() == "done" { break }
    
    // Split the input into name and score
    let parts = input.components(separatedBy: " ")
    // Ensure we have exactly two parts (name and score) and that the score is a valid Double
    if parts.count == 2, let score = Double(parts[1]) {
        students[parts[0]] = score
    } else {
        print("Invalid input. Please use the format 'Name Score'.")
    }
}

guard !students.isEmpty else {
    print("No students entered.")
    exit(1)
}

// Calculate and display grade statistics.
// Calculate average score using reduce
let averageScore = students.values.reduce(0, +) / Double(students.count)
let highestScore = students.values.max() ?? 0
let lowestScore = students.values.min() ?? 0

print("\nResults:")
print("Average score: \(averageScore)")
print("Highest score: \(highestScore)")
print("Lowest score: \(lowestScore)")
print("\nStudent performances:")

// Sort students by name and print their scores with performance relative to average
for (name, score) in students.sorted(by: { $0.key < $1.key }) {
    let performance = score > averageScore ? "above" : "below"
    print("\(name): \(score) (\(performance) average)")
}

// Problem 8: Palindrome Checker
// This program checks if a given string is a palindrome, ignoring spaces, punctuation, and case.

import Foundation

func isPalindrome(_ text: String) -> Bool {
    // Remove non-alphanumeric characters and convert to lowercase
    let cleanedText = text.lowercased().components(separatedBy: CharacterSet.alphanumerics.inverted).joined()
    // Compare the cleaned string with its reverse
    return cleanedText == String(cleanedText.reversed())
}

print("Enter a string to check if it's a palindrome:")
if let input = readLine() {
    let result = isPalindrome(input)
    print("\"\(input)\" is \(result ? "a palindrome" : "not a palindrome").")
} else {
    print("Invalid input")
}

// Problem 9: Simple Calculator
// This program implements a basic calculator with addition, subtraction, multiplication, and division operations.

func add(_ a: Double, _ b: Double) -> Double { a + b }
func subtract(_ a: Double, _ b: Double) -> Double { a - b }
func multiply(_ a: Double, _ b: Double) -> Double { a * b }
func divide(_ a: Double, _ b: Double) -> Double? {
    // Check for division by zero
    guard b != 0 else { return nil }
    return a / b
}

// Main calculator loop.
while true {
    print("\nSimple Calculator")
    print("Enter two numbers:")
    // Use multiple optional bindings to get and convert both numbers
    guard let input1 = readLine(), let num1 = Double(input1),
          let input2 = readLine(), let num2 = Double(input2) else {
        print("Invalid input. Please enter valid numbers.")
        continue
    }
    
    print("Choose operation (+, -, *, /) or 'q' to quit:")
    guard let operation = readLine() else { continue }
    
    switch operation {
    case "+":
        print("Result: \(add(num1, num2))")
    case "-":
        print("Result: \(subtract(num1, num2))")
    case "*":
        print("Result: \(multiply(num1, num2))")
    case "/":
        // Handle potential nil result from divide function
        if let result = divide(num1, num2) {
            print("Result: \(result)")
        } else {
            print("Error: Division by zero")
        }
    case "q", "Q":
        print("Goodbye!")
        exit(0)
    default:
        print("Invalid operation. Please try again.")
    }
}

// Problem 10: Unique Characters
// This program checks if a given string contains all unique characters.

func hasUniqueCharacters(_ text: String) -> Bool {
    var seenCharacters: Set<Character> = []
    for char in text {
        // If the character is already in the set, it's not unique
        if seenCharacters.contains(char) {
            return false
        }
        seenCharacters.insert(char)
    }
    // If we've made it through all characters without finding a duplicate, they're all unique
    return true
}

print("Enter a string to check for unique characters:")
if let input = readLine() {
    let result = hasUniqueCharacters(input)
    print("\"\(input)\" \(result ? "has" : "does not have") all unique characters.")
} else {
    print("Invalid input")
}
