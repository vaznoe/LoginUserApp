# LoginUserApp

Welcome to the LoginUserApp project! This documentation will guide you through the setup, usage, and contribution process for this iOS application.

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Configuration](#configuration)
- [Testing](#testing)
- [Contributing](#contributing)
- [License](#license)

## Overview
LoginUserApp is an iOS application designed as a Test Automation Framework demo for iOS apps. The main purpose of this project is to showcase the use of the Page Object Model (POM) to describe all states on a screen, facilitating efficient and maintainable UI test automation. This simple app includes a login feature only, and it is written in Swift using modern iOS development practices.

## Features
- User login

## Requirements
- Xcode 12.0 or later
- iOS 13.0 or later
- Swift 5.0 or later

## Installation
To get started with LoginUserApp, follow these steps:

1. **Clone the repository:**
    ```sh
    git clone https://github.com/vaznoe/LoginUserApp.git
    cd LoginUserApp
    ```

2. **Open the project in Xcode:**
    ```sh
    open LoginUserApp.xcodeproj
    ```

3. **Install dependencies:**
    - Make sure you have [CocoaPods](https://cocoapods.org/) installed.
    - Navigate to the project directory and run:
        ```sh
        pod install
        ```

4. **Open the workspace:**
    ```sh
    open LoginUserApp.xcworkspace
    ```

5. **Build and run the project:**
    - Select a target device or simulator.
    - Press `Cmd + R` to build and run the application.

## Usage
Once the application is running on your device or simulator, you can perform the following actions:

- **Log in a user:** Access the login screen and enter the credentials.

## Testing
LoginUserApp includes a UI test framework written in Swift. The project demonstrates the use of the Page Object Model (POM) to describe all states on a screen, making the tests more maintainable and scalable. To run the tests, follow these steps:

1. **Select the test target:**
    - In Xcode, select the `LoginUserAppUITests` target.

2. **Run the tests:**
    - Press `Cmd + U` to run all tests.

## Contributing
We welcome contributions from the community! To contribute, follow these steps:

1. Fork the repository.
2. Create a new branch: `git checkout -b feature-name`.
3. Make your changes and commit them: `git commit -m 'Add new feature'`.
4. Push to the branch: `git push origin feature-name`.
5. Submit a pull request.

Please ensure your code follows the project's coding standards and includes appropriate tests.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
