

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


part 'home_screen_controls_event.dart';
part 'home_screen_controls_state.dart';

class HomeScreenListControlsBloc extends Bloc<HomeScreenListControlsEvent, HomeScreenListControlsState> {

  HomeScreenListControlsBloc() : super(HomeScreenListControlsState('USD', TopListBy.marketCap)) {
    on<HomeScreenListControlsEvent>((event, emit) {
      if(event is ChangeDisplayedCurrency)
      {
        emit(HomeScreenListControlsState(event.newDisplayedCurrency!, state.topListBy));
      }
      else if(event is ChangeListData)
      {
        emit(HomeScreenListControlsState(state.displayedCurrency, event.topListBy!));
      }
    });
  }

}
