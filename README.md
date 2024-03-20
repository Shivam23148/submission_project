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

# Introduction
The Project Name is a Flutter application designed to provide users with a seamless experience in selecting countries and managing their profiles. With a focus on simplicity and usability, the app offers features such as country selection, profile information display, navigation, and logout functionality.

Users can easily browse through a list of countries, view their flags and names, and select their preferred country. Additionally, the app presents users with their profile information, including their name and contact number. The bottom navigation bar facilitates smooth navigation between different sections of the app, enhancing the overall user experience.

# Features:
Country Selection:

The app allows users to select a country from a list.
Countries are displayed with their names and flags.


# Dependencies:
Flutter Framework:

The project is built using the Flutter framework for cross-platform app development.
Dio:

Dio is used for making HTTP requests to fetch data from an API.
It's utilized within the data/services.dart file.
Bloc:

Bloc (Business Logic Component) pattern is employed for state management in the app.
flutter_bloc package is used for implementing Bloc.
Blocs are utilized in the presentation/screens/selection_screen/bloc/selection_bloc.dart file.
Material Design Components:

Flutter's Material Design components are used for building the UI elements such as Scaffold, AppBar, BottomAppBar, etc.
Other Flutter Packages:

package:flutter/material.dart: Core Flutter UI toolkit.
package:flutter_bloc/flutter_bloc.dart: Flutter package for implementing the Bloc pattern.
package:dio/dio.dart: Dart package for making HTTP requests.