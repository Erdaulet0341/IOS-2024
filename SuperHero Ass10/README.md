# Random Superhero Roller App

## Project Description
This iOS application allows users to roll a random superhero and view their stats, biography, and image. The app demonstrates skills in working with `UIKit`, including custom UI elements, API integration, and JSON parsing to dynamically fetch and display data.

## Chosen Theme: Superhero Randomizer  
For this project, I chose to implement a fun superhero randomizer. Each roll fetches a new superhero with the following information:
- Hero image
- Hero name
- Power stats (Intelligence, Strength, Speed, etc.)
- Biography (Full Name, Alter Egos, etc.)

This theme is engaging and provides a great way to showcase visually appealing content and interactive user experiences.

---

## Screenshots

### App UI Example

**Main Screen**: Displays the rolled hero's information, including stats and biography.  

<img width="477" alt="Снимок экрана 2024-11-22 в 11 31 55" src="https://github.com/user-attachments/assets/f6d49410-61c4-4b48-b198-9c22bb8fea57">


---

## Video Demonstration

https://github.com/user-attachments/assets/96265269-6322-4375-bd8e-64a421ff1329


---

## Setup Instructions

To run this project:

1. Clone the repository to your local machine.
2. Open the `.xcodeproj` file in Xcode.
3. Ensure your simulator or device has internet access to fetch superhero data from the API.
4. Build and run the project (`Cmd + R`).

---

## Features

- Displays a random superhero's data using the [Superhero API](https://akabab.github.io/superhero-api/).
- Fetches and displays:
  - Hero image
  - Power stats
  - Biography details
- Intuitive UI with clean and dynamic labels.
- Interactive "Roll" button to fetch a new superhero.

---

## Requirements

- **iOS Version**: 14.0+
- **Xcode Version**: 12.0+
- **Programming Language**: Swift 5.0+

---

## Technical Overview

1. **API Integration**  
   - Fetch superhero data using the Superhero API via `URLSession` and JSON decoding.

2. **Custom UI**  
   - Circular image view for hero photos.
   - Dynamic labels organized in `UIStackView` for displaying stats and biography.

3. **Error Handling**  
   - Graceful error messages when the API fails or data is unavailable.

4. **Code Organization**  
   - Decodable structs (`Hero`, `PowerStats`, `Biography`, etc.) for parsing API data.
