import 'package:submission_project/data/models.dart';

abstract class SelectionState {}

class SelectionInitialState extends SelectionState {}

class DataLoadingState extends SelectionState {}

class DataLoadedState extends SelectionState {
  final List<Country> data;

  DataLoadedState({required this.data});
}

class DataErrorState extends SelectionState {
  final String errorMessage;

  DataErrorState({required this.errorMessage});
}

class SelectedRadioState extends SelectionState {
  final String countryCode;

  SelectedRadioState({required this.countryCode});
}
