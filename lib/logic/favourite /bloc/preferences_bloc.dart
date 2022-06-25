import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'preferences_event.dart';
part 'preferences_state.dart';

class PreferencesBloc extends Bloc<PreferencesEvent, FavouritesState> {
  PreferencesBloc() : super(FavouritesState([])) {
    on<PreferencesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
