# WorldOfPAYBACK
## Overview
The WorldOfPAYBACK app is a SwiftUI-based iOS application that allows the user to view a list of transactions grouped by booking date. The user can filter the transactions based on their category and view transaction details. The app uses clean architecture uncle Bob and is built using SwiftUI and Combine frameworks.

## Features
- View transactions sorted by `bookingDate`
- Filter transactions by category.
- View transaction details by tapping on a transaction.
- If there is no internet connection, the app will show an error message.
- Error handling when there is a failure to load transactions.
- Show loader when data is being loaded.
- Show total sum of transactions.

## Prerequisites
- Xcode 15 or later.
- iOS 17 or later.

## Installation
- Clone or download the project from the GitHub repository.
- Open the project in Xcode.
- Build and run the app.

## Usage
- Upon launching the app, the user will land on the home page where they see a welcome message with a button to go to the transaction page.
- Once the user taps on the button, the user will see a list of transactions sorted by bookingDate.
- The user can filter the transactions by selecting a category from the segmented control at the bottom of the screen.
- To view transaction details, the user can tap on a transaction to present a new view that shows the transaction details.
- If there is no internet connection, the app will show an error message.
- If there is a failure to load transactions, the app will show an error message.
- The app will show a loader while data is being loaded.
- The app will display the total sum of transactions at the bottom of the screen.

## Localization
App is localized on 4 langages:
- English
- Polish
- Russian
- Ukrainan

## Architecture
The app uses clean architecture uncle Bob, with presentation layer ( MVVM + R ).

## Libraries and Frameworks
The app uses the following libraries and frameworks:
  - SwiftUI: A declarative framework for building user interfaces.
  - Combine: A framework for reactive programming.
  - URLSession: A framework for making network requests.
