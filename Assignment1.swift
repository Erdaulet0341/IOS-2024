// Personal Information
let firstName = "Yerdaulet"
let lastName = "Abdurakhman" 
let birthYear = 2003
let birthDate = "September 15, 2003"
let hometown = "Shymkent"
let isStudent = true
let height = 1.79

// Current year constant for age calculation
let currentYear = 2024

// Calculating age
let age = currentYear - birthYear

// Hobbies and Interests
let hobby1 = "watching movies"
let hobby2 = "playing football"
let hobby3 = "going to the mountains"
let numberOfHobbies = 3
let favoriteNumber = 7
let isHobbyCreative = false

// Future Goals
let futureGoal = "become a Python backend developer"

// Additional interesting information
let favoriteEmoji = "⚽️" 

// Creating the life story
let lifeStory = """
My name is \(firstName) \(lastName). I am \(age) years old, born on \(birthDate) in \(hometown). \(isStudent ? "I am currently a student." : "I am not currently a student.") I stand \(height) meters tall.

I have \(numberOfHobbies) main hobbies: \(hobby1), \(hobby2), and \(hobby3). \(isHobbyCreative ? "My hobbies are creative." : "My hobbies are not particularly creative, but they keep me active and entertained.") My favorite number is \(favoriteNumber).

In the future, I want to \(futureGoal). I love the outdoors, especially mountains \(lastName), and my favorite emoji is \(favoriteEmoji), which represents one of my hobbies!
"""

// Printing the life story
print(lifeStory)
