abstract class SelectionEvent {}

class SelectionDataLoadingEvent extends SelectionEvent {}

class SelectionRadioTapEvent extends SelectionEvent {
  final String countryCode;

  SelectionRadioTapEvent({required this.countryCode});
}
