// 1. Array Creation and Access
let fruits = ["apple", "banana", "cherry", "date", "elderberry"]
print("Third fruit:", fruits[2])

// 2. Set Creation and Manipulation
var favoriteNumbers: Set = [7, 13, 42, 99]
favoriteNumbers.insert(21)
print("Updated favorite numbers:", favoriteNumbers)

// 3. Dictionary Creation and Access
let programmingLanguages = ["Swift": 2014, "Python": 1991, "JavaScript": 1995]
print("Swift release year:", programmingLanguages["Swift", default: 0])

// 4. Array Element Update
var colors = ["red", "blue", "green", "yellow"]
colors[1] = "purple"
print("Updated colors:", colors)

// Medium Tasks

// 1. Set Intersection
let set1: Set = [1, 2, 3, 4]
let set2: Set = [3, 4, 5, 6]
let intersectionSet = set1.intersection(set2)
print("Intersection of sets:", intersectionSet)

// 2. Dictionary Update
var studentScores = ["Alice": 85, "Bob": 72, "Charlie": 90]
studentScores["Bob"] = 78
print("Updated student scores:", studentScores)

// 3. Array Merge
let fruits1 = ["apple", "banana"]
let fruits2 = ["cherry", "date"]
let mergedFruits = fruits1 + fruits2
print("Merged fruits:", mergedFruits)

// Hard Tasks

// 1. Dictionary Key Addition
var countryPopulations = ["USA": 331_002_651, "China": 1_439_323_776, "India": 1_380_004_385]
countryPopulations["Brazil"] = 212_559_417
print("Updated country populations:", countryPopulations)

// 2. Set Union and Subtract
let animals1: Set = ["cat", "dog"]
let animals2: Set = ["dog", "mouse"]
let unionSet = animals1.union(animals2)
let finalSet = unionSet.subtracting(animals2)
print("Final set after union and subtraction:", finalSet)

// 3. Nested Collection
let studentGrades = [
    "Alice": [92, 88, 95, 90],
    "Bob": [85, 79, 82, 88],
    "Charlie": [90, 93, 87, 91]
]
print("Bob's second grade:", studentGrades["Bob", default: []][1])
