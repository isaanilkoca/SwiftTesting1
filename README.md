# 🧪 SwiftTesting1 - iOS Unit, Integration & UI Testing

A comprehensive iOS testing demonstration showcasing **Unit Tests**, **Integration Tests**, and **Automated UI Tests** using Swift and XCTest. The project utilizes a practical ToDo List implementation to test real-world CRUD operations, state updates, and automated UI workflows.

---

### 📌 Project Overview
This repository serves as a hands-on guide and testbed for modern iOS testing methodologies. It covers foundational arithmetic unit testing as well as complete user interface automation using UI Recording on a ToDo list.

---

### 🛠 Testing Architecture & Layers

* **Unit Testing:**
  * Isolated testing of core helper methods and mathematical business logic (`MathematicFunctions.swift`).
  * Boundary value analysis, input validation, and edge-case assertions.

* **Integration Testing:**
  * Data flow verification between controllers, models, and UI state changes.
  * Ensuring state persistence and list integrity when handling new data.

* **UI Testing & UI Recording:**
  * **Add Item Flow:** Automated typing into input fields, triggering the Add button, and asserting table row insertion.
  * **Delete Item Flow:** Automated row targeting, triggering the Delete button, and asserting dynamic item removal.
  * **UI Recording Sessions:** Xcode UI test recording converted into maintainable and repeatable automated test scripts.

---

### 💻 Tech Stack
* **Language:** Swift
* **UI Framework:** UIKit
* **Testing Suite:** XCTest Framework
* **Pattern:** MVC with Testable Logic Separation

---

### 🚀 How to Run Tests

1. Open `SwiftTesting1.xcodeproj` in Xcode.
2. Select an iOS Simulator.
3. Press **Cmd + U** to run all Unit, Integration, and UI tests simultaneously.
