import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/API_providers/shared_prefs.dart';
part 'preferences_event.dart';
part 'preferences_state.dart';

class PreferencesBloc extends Bloc<PreferencesEvent, PreferencesState> {
  PreferencesBloc() : super(PreferencesState([])) {
   
    SharedPrefs().getFavouriteCoins().then((value) {
      emit(PreferencesState(value));
    },);

    on<PreferencesEvent>((event, emit) {
      if(event is AddCoinToFav)
      {
        state.favCoins.add(event.coinCode);
        SharedPrefs().setFavouriteCoin(event.coinCode);
        emit(PreferencesState(state.favCoins));

      }
      else if(event is RemoveCoinFromFav)
      {
        state.favCoins.remove(event.coinCode);
        SharedPrefs().removeFavouriteCoin(event.coinCode);
        emit(PreferencesState(state.favCoins));

      }
    });
  }
}
