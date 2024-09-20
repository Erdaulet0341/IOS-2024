// Problem 1: FizzBuzz

for number in 1...100 {
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

func isPrime(_ number: Int) -> Bool {
    guard number > 1 else { return false }
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
guard let input = readLine(), let temperature = Double(input) else {
    print("Invalid input")
    exit(1)
}

print("Enter unit (C, F, or K):")
guard let unit = readLine()?.uppercased() else {
    print("Invalid input")
    exit(1)
}

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
    if let item = readLine(), !item.isEmpty {
        shoppingList.append(item)
        print("\(item) added to the list.")
    } else {
        print("Invalid input. Item not added.")
    }
}

func removeItem() {
    print("Enter item to remove:")
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
        for (index, item) in shoppingList.enumerated() {
            print("\(index + 1). \(item)")
        }
    }
}

while true {
    displayMenu()
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

import Foundation

print("Enter a sentence:")
guard let input = readLine() else {
    print("Invalid input")
    exit(1)
}

let words = input.lowercased().components(separatedBy: .punctuationCharacters).joined().components(separatedBy: .whitespaces).filter { !$0.isEmpty }

var wordFrequency: [String: Int] = [:]

for word in words {
    wordFrequency[word, default: 0] += 1
}

print("\nWord frequencies:")
for (word, count) in wordFrequency.sorted(by: { $0.key < $1.key }) {
    print("\(word): \(count)")
}


// Problem 6: Fibonacci Sequence

func fibonacci(_ n: Int) -> [Int] {
    guard n > 0 else { return [] }
    var sequence = [0, 1]
    while sequence.count < n {
        sequence.append(sequence[sequence.count - 1] + sequence[sequence.count - 2])
    }
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

var students: [String: Double] = [:]

print("Enter student names and scores (e.g., 'John 85'). Type 'done' when finished.")

while true {
    guard let input = readLine() else { continue }
    if input.lowercased() == "done" { break }
    
    let parts = input.components(separatedBy: " ")
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

let averageScore = students.values.reduce(0, +) / Double(students.count)
let highestScore = students.values.max() ?? 0
let lowestScore = students.values.min() ?? 0

print("\nResults:")
print("Average score: \(averageScore)")
print("Highest score: \(highestScore)")
print("Lowest score: \(lowestScore)")
print("\nStudent performances:")

for (name, score) in students.sorted(by: { $0.key < $1.key }) {
    let performance = score > averageScore ? "above" : "below"
    print("\(name): \(score) (\(performance) average)")
}



// Problem 8: Palindrome Checker

import Foundation

func isPalindrome(_ text: String) -> Bool {
    let cleanedText = text.lowercased().components(separatedBy: CharacterSet.alphanumerics.inverted).joined()
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

func add(_ a: Double, _ b: Double) -> Double { a + b }
func subtract(_ a: Double, _ b: Double) -> Double { a - b }
func multiply(_ a: Double, _ b: Double) -> Double { a * b }
func divide(_ a: Double, _ b: Double) -> Double? {
    guard b != 0 else { return nil }
    return a / b
}

while true {
    print("\nSimple Calculator")
    print("Enter two numbers:")
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

func hasUniqueCharacters(_ text: String) -> Bool {
    var seenCharacters: Set<Character> = []
    for char in text {
        if seenCharacters.contains(char) {
            return false
        }
        seenCharacters.insert(char)
    }
    return true
}

print("Enter a string to check for unique characters:")
if let input = readLine() {
    let result = hasUniqueCharacters(input)
    print("\"\(input)\" \(result ? "has" : "does not have") all unique characters.")
} else {
    print("Invalid input")
}
