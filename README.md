# submission_project

Submission Project

## Getting Started

<!-- This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
 -->
## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Dependencies](#dependencies)
- [Installation](#installation)
- [Screenshots](#screenshots)


## Introduction

This project is a Flutter application designed to provide users with features such as country selection and profile management. It offers a seamless user experience through intuitive navigation and efficient state management using the Bloc pattern.

The main features of the app include:

- **Country Selection:** Users can select a country from a list, displayed with names and flags.
- **Profile Information:** Displays user profile details including name and contact number.
- **Navigation:** Utilizes a bottom navigation bar for easy navigation between app sections.
- **Logout Functionality:** Allows users to log out from the app.

The project relies on various dependencies including the Flutter framework, Dio for making HTTP requests, and Bloc for state management. It leverages Material Design components for building a visually appealing user interface.

### Features:

1. **Country Selection:**
   - The app allows users to select a country from a list.
   - Countries are displayed with their names and flags.

2. **Profile Information:**
   - The app displays profile information including the user's name and contact number.

3. **Navigation:**
   - The bottom navigation bar allows users to navigate between different sections of the app.

4. **Logout Functionality:**
   - Users can log out from the app.

### Dependencies:

1. **Flutter Framework:**
   - The project is built using the Flutter framework for cross-platform app development.

2. **Dio:**
   - Dio is used for making HTTP requests to fetch data from an API.
   - It's utilized within the `data/services.dart` file.

3. **Bloc:**
   - Bloc (Business Logic Component) pattern is employed for state management in the app.
   - `flutter_bloc` package is used for implementing Bloc.
   - Blocs are utilized in the `presentation/screens/selection_screen/bloc/selection_bloc.dart` file.

4. **Material Design Components:**
   - Flutter's Material Design components are used for building the UI elements such as `Scaffold`, `AppBar`, `BottomAppBar`, etc.

5. **Other Flutter Packages:**
   - `package:flutter/material.dart`: Core Flutter UI toolkit.
   - `package:flutter_bloc/flutter_bloc.dart`: Flutter package for implementing the Bloc pattern.
   - `package:dio/dio.dart`: Dart package for making HTTP requests.

   
## Installation

Provide instructions on how to install your project. Include any necessary steps such as installing dependencies, configuring settings, etc.

```bash
# Clone the repository
git clone https://github.com/your-username/your-project.git

# Navigate to the project directory
cd your-project

# Install dependencies
flutter pub get
```

## Screenshots

![Screenshot 1](/assets/screenshot/profile_screen.jpg)
![Screenshot 2](/assets/screenshot/selection_screen.jpg)