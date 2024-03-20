import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:submission_project/data/models.dart';
import 'package:submission_project/data/services.dart';
import 'package:submission_project/presentation/screens/selection_screen/bloc/selection_event.dart';
import 'package:submission_project/presentation/screens/selection_screen/bloc/selection_state.dart';

class SelectionBloc extends Bloc<SelectionEvent, SelectionState> {
  SelectionBloc() : super(SelectionInitialState()) {
    on<SelectionDataLoadingEvent>(_dataFetching);
    on<SelectionRadioTapEvent>(_doSelectionRadioTapEvent);
  }

  Future<FutureOr<void>> _dataFetching(
      SelectionDataLoadingEvent event, Emitter<SelectionState> emit) async {
    emit(DataLoadingState());
    try {
      final List<Country> apiData =
          await ApiService(Dio(BaseOptions(contentType: "application/json")))
              .getData();

      apiData.sort((a, b) => a.name.common.compareTo(b.name.common));

      emit(DataLoadedState(data: apiData));
    } catch (e) {
      emit(DataErrorState(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _doSelectionRadioTapEvent(
      SelectionRadioTapEvent event, Emitter<SelectionState> emit) {
    emit(SelectedRadioState(countryCode: event.countryCode));
  }
}
