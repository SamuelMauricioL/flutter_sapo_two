# flutter_sapo_two

## Table of Contents

- [Project Description](#project-description)
- [Prerequisites](#prerequisites)
- [Local Setup](#local-setup)
  - [Repository Cloning](#repository-cloning)
  - [Flutter Configuration](#flutter-configuration)
  - [Firebase Configuration](#firebase-configuration)
    - [Installing Firebase CLI](#installing-firebase-cli)
    - [Configuring Firebase Project](#configuring-firebase-project)
    - [Firebase Project Verification](#firebase-project-verification)
- [Running the Application](#running-the-application)
- [Project Architecture](#project-architecture)
  - [Project Structure](#project-structure)
  - [Current Resources](#current-resources)

## Project Description

This is the repository for the Flutter project `flutter_sapo_two`. This application uses Firebase for data storage and management of posts, allowing users to view posts with pagination and interact with them using like/dislike functionality.

## Prerequisites

Before starting, make sure you have the following installed on your development machine:

- **Flutter:** 3.27.4 or higher (or the latest stable version).
- **Dart:** 3.6.2 or higher (or the latest stable version).
- **Firebase CLI:** 14.1.0 or higher (or the latest stable version).
- **Google Account:** Permission granted for the `flutter_sapo_two` application to the Google account where the Firebase project is hosted.

## Local Setup

Follow these steps to set up the project in your local environment:

### Repository Cloning

1.  Clone this repository to your local machine using Git:

    ```bash
    git clone <YOUR_REPOSITORY_URL>
    cd flutter_sapo_two
    ```

    (Replace `<YOUR_REPOSITORY_URL>` with the actual URL of your repository.)

### Flutter Configuration

1.  Get the Flutter project dependencies:

    ```bash
    flutter pub get
    ```

### Firebase Configuration

1.  **Installing Firebase CLI:**

    - If you haven't already installed the Firebase CLI, run the following command:

      ```bash
      npm install -g firebase-tools
      ```

2.  **Configuring Firebase Project:**

    - Navigate to your Flutter project directory in the terminal and run the following command to connect to your existing Firebase project:

      ```bash
      flutterfire configure --project=<YOUR_FIREBASE_PROJECT_ID>
      ```

      (Replace `<YOUR_FIREBASE_PROJECT_ID>` with the actual ID of your Firebase project.)

    - Follow the prompts to select the platforms you are developing for. This command will generate the `firebase_options.dart` file in your `lib/` directory.

3.  **Firebase Project Verification:**

    - Ensure you have access to the Firebase console ([https://console.firebase.google.com/](https://console.firebase.google.com/)) and can select your project.
    - Verify that the following services are enabled in the project:
      - Cloud Firestore

### Running the Application

1.  Run the Flutter application on your device or emulator:

    ```bash
    flutter run
    ```

## Project Architecture

Clean architecture based-on-packages with a feature-first approach.

### Project Structure

```
|-- lib/
|   |-- di/
|   |-- app/
|   |   |-- view/
|   |   |-- widgets/
|   |-- posts/      # Feature for handling posts
|   |   |-- di/
|   |   |-- widgets/
|   |   |-- view/
|   |   |-- bloc/
|   |-- bootstrap.dart
|   |-- main.dart
|
|-- packages/
|   |-- core/
|   |   |-- st_ui   # UI Components
|   |   |-- st_utils # Utility Functions
|   |-- features/
|   |   |-- st_post_data    # Posts Feature - Data Layer
|   |   |-- st_post_domain  # Posts Feature - Domain Layer
```

### Current Resources

- **State Management:** [bloc](https://pub.dev/packages/bloc), [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- **Object Comparison:** [equatable](https://pub.dev/packages/equatable)
- **Dependency Injection:** [get_it](https://pub.dev/packages/get_it)
- **UI Components (Internal Package):** `st_ui` (located at `packages/core/st_ui`)
- **Utility Functions (Internal Package):** `st_utils` (located at `packages/core/st_utils`)
- **Posts Feature - Data Layer (Internal Package):** `st_post_data` (located at `packages/features/st_post_data`)
- **Posts Feature - Domain Layer (Internal Package):** `st_post_domain` (located at `packages/features/st_post_domain`)
- **Firebase Core:** [firebase_core](https://pub.dev/packages/firebase_core)
- **Cloud Firestore:** [cloud_firestore](https://pub.dev/packages/cloud_firestore)
